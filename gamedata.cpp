#include "gamedata.h"
#include <QDebug>
#include "math.h"

#define PLAYER_1 0
#define PLAYER_2 1

// transparent point
#define PLAYER_0 2

#define PLAYER_CAPTURED 3


const int CELL_COLS = 13;
const int CELL_ROWS = 11;
const int CELL_SIZE = 48;
const int OFFSET = 11;
bool waveEnd;

GameData::GameData(QObject *parent)
    : QObject(parent),
      m_gameOn(false),
      m_gameTime(0, 0),
      m_time("0:00")
{
    // initialize chain array
    chain = new int[CELL_COLS * CELL_ROWS];
    m_player = 0;
    m_scoreP1 = 0;
    m_scoreP2 = 0;
    m_player1Turn = true;
    m_moves = 0;

    for (int i = 0; i < CELL_COLS * CELL_ROWS; i++)
        m_points << new Point;

    // Timer to update the game time
    m_gameTimer = new QTimer(this);
    connect(m_gameTimer, SIGNAL(timeout()), this, SLOT(updateTime()));
    m_gameTimer->setInterval(1000);
}

void GameData::updateTime()
{
    if (m_gameOn) m_gameTimeSeconds++;
    setGameTime(m_gameTime.addSecs(m_gameTimeSeconds).toString("m:ss"));
}

GameData::~GameData() {
    delete []chain;
}

// reset different game properties
void GameData::newGame() {
    setMoves(0);
    setP1Score(0);
    setP2Score(0);
    m_gameTimeSeconds = 0;
    setGameTime("0:00");
    foreach (Point *p, m_points) {
        p->setType(PLAYER_0);
        p->setCaptured(false);
    }
    m_player = 0;
    setGameOn(true);
}

void GameData::handleClick(float xPos, float yPos) {
    int column = round(xPos / CELL_SIZE);
    int row = round(yPos / CELL_SIZE);
    int i, j, k;
    int score_x1 = 0, score_y1 = 0;
    int score_x2 = 0, score_y2 = 0;

    Point *p = point(row * CELL_COLS + column);

    // check if player catches in intersection of cells
    if (((fabs(xPos - column * CELL_SIZE) - OFFSET) < 10) &&
        ((fabs(yPos - row * CELL_SIZE) - OFFSET) < 10)) {

        // if place is empty, then create point
        if (p->type() == PLAYER_0) {
            createPoint(column, row, m_player);
            setMoves(m_moves + 1);
            setPlayer1Turn(!player1Turn());

            // switch player
            m_player = !m_player;
        }
        else
            return;

        // check for captured points for player1
        m_closed.clear();
        for (i = 0; i < CELL_COLS; i++)
            for (j = 0; j < CELL_ROWS; j++) {
                for (k = 0; k < CELL_COLS * CELL_ROWS; k++)
                    chain[k] = 0;

                if (m_points.at(j * CELL_COLS + i)->type() == PLAYER_2) {
                    waveEnd = false;
                    m_closed << m_points.at(j * CELL_COLS + i);

                    wave(i, j, PLAYER_1, 1);
                    if (!waveEnd) {
                        score_x1 = i * CELL_SIZE + OFFSET;
                        score_y1 = j * CELL_SIZE;
                        drawCaptured(PLAYER_1);
                    } else {
                        m_captured.clear();
                        m_closed.clear();
                    }
                }
            }

        score_x2 = 0;
        score_y2 = 0;

        // check for captured points for player2
        m_closed.clear();
        for (i = 0; i < CELL_COLS; i++)
            for (j = 0; j < CELL_ROWS; j++) {
                for (k = 0; k < CELL_COLS * CELL_ROWS; k++)
                    chain[k] = 0;

                if (m_points.at(j * CELL_COLS + i)->type() == PLAYER_1) {
                    waveEnd = false;
                    m_closed << m_points.at(j * CELL_COLS + i);

                    wave(i, j, PLAYER_2, 1);
                    if (!waveEnd) {
                        score_x2 = i * CELL_SIZE + OFFSET;
                        score_y2 = j * CELL_SIZE;
                        drawCaptured(PLAYER_2);
                    } else {
                        m_captured.clear();
                        m_closed.clear();
                    }
                }
            }


        // count captured points of both player
        int counter = 0;

        // counts points which player1 captured
        foreach (Point *p, m_points) {
            if ((p->type() == PLAYER_1) && p->captured())
                counter++;
        }

        // show earned points
        if ((counter - m_scoreP1) > 0)
            emit animateScore(score_x1, score_y1, counter - m_scoreP1, QVariant("red"));
        setP1Score(counter);

        // counts points which player2 captured
        counter = 0;
        foreach (Point *p, m_points) {
            if ((p->type() == PLAYER_2) && p->captured())
                counter++;
        }

        // show earned points
        if ((counter - m_scoreP2) > 0)
            emit animateScore(score_x2, score_y2, counter - m_scoreP2, QVariant("blue"));
        setP2Score(counter);
    }
}

void GameData::drawCaptured(int player) {
    // draw contour around captured points
    foreach (Point *p, m_captured) {
        foreach (Point *t, m_captured) {
            if (p != t && (p->type() == player) && (t->type() == player) &&
                    !p->captured() && !t->captured()) {
                if ((abs(p->x() - t->x()) <= 1 ) &&
                    (abs(p->y() - t->y()) <= 1 )) {
                    emit createLine(p->x() * CELL_SIZE + OFFSET + 5,
                                    p->y() * CELL_SIZE,
                                    t->x() * CELL_SIZE + OFFSET + 5,
                                    t->y() * CELL_SIZE,
                                    player);
                }
            }
        }
    }

    // check captured points
    foreach (Point *p, m_closed) {
        p->setCaptured(true);
        p->setType(player);
    }
}

void GameData::createPoint(int column, int row, int player) {
    m_points.at(row * CELL_COLS + column)->setType(player);
}

// check for closed contour (wave alghoritm)
void GameData::wave(int column, int row, int player, int waveNum) {
    if (waveEnd)
        return;

    if (column < 0 || column > CELL_COLS || row < 0 || row > CELL_ROWS) {
        waveEnd = true;
        return;
    }

    int index = row * CELL_COLS + column;
    Point *p = m_points.at(index);

    if ((p->type() == PLAYER_0
         || p->type() != player)
         && chain[index] == 0) {
        chain[index] = waveNum;
    } else {
        if (!m_captured.contains(p)) {
            p->setX(column);
            p->setY(row);
            m_captured.append(p);
        }
        return;
    }

    wave(column - 1, row, player, waveNum + 1);
    wave(column, row - 1, player, waveNum + 1);
    wave(column + 1, row, player, waveNum + 1);
    wave(column, row + 1, player, waveNum + 1);
}

void GameData::pauseGame(bool state) {
    if (state)
        m_gameTimer->stop();
    else
        m_gameTimer->start();
}
