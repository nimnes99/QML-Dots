#ifndef GAMEDATA_H
#define GAMEDATA_H

#include "point.h"
#include "line.h"

#include <QObject>
#include <QString>
#include <QTime>
#include <QTimer>

#include <QDeclarativeListProperty>

class GameData : public QObject
{
    Q_OBJECT

public:
    GameData(QObject *parent = 0);
    ~GameData();

    Q_PROPERTY(QDeclarativeListProperty<Point> points READ points CONSTANT);
    QDeclarativeListProperty<Point> points() {
        return QDeclarativeListProperty<Point>(this, m_points);
    }

    Q_PROPERTY(QDeclarativeListProperty<Line> lines READ lines CONSTANT);
    QDeclarativeListProperty<Line> lines() {
        return QDeclarativeListProperty<Line>(this, m_lines);
    }

    Q_PROPERTY(int moves READ moves WRITE setMoves NOTIFY movesChanged);
    int moves() const {return m_moves;}
    void setMoves(int moves) {if (moves == m_moves) return; m_moves = moves; emit movesChanged();}

    Q_PROPERTY(int p1_score READ p1_score WRITE setP1Score NOTIFY scoreP1Changed);
    int p1_score() const {return m_scoreP1;}
    void setP1Score(int score) {if (score == m_scoreP1) return; m_scoreP1 = score; emit scoreP1Changed();}

    Q_PROPERTY(int p2_score READ p2_score WRITE setP2Score NOTIFY scoreP2Changed);
    int p2_score() const {return m_scoreP2;}
    void setP2Score(int score) {if (score == m_scoreP2) return; m_scoreP2 = score; emit scoreP2Changed();}

    Q_PROPERTY(QString gameTime READ gameTime WRITE setGameTime NOTIFY gameTimeChanged);
    QString gameTime() const {return m_time;}
    void setGameTime(const QString &time) { if (time == m_time) return; m_time = time; emit gameTimeChanged();}

    Q_PROPERTY(bool gameOn READ gameOn WRITE setGameOn NOTIFY gameOnChanged);
    bool gameOn() const {return m_gameOn;}
    void setGameOn(bool on) { if (on == m_gameOn) return; m_gameOn = on; emit gameOnChanged();}

    Q_PROPERTY(bool player1Turn READ player1Turn WRITE setPlayer1Turn NOTIFY player1TurnChanged);
    bool player1Turn() const {return m_player1Turn;}
    void setPlayer1Turn(bool state) {if(state==m_player1Turn) return; m_player1Turn = state; emit player1TurnChanged();}

public slots:
    void newGame();
    void pauseGame(bool state);
    void handleClick(float xPos, float yPos);
    void createPoint(int column, int row, int player);
    void wave(int column, int row, int player, int waveNum);
    void updateTime();

signals:
    void pointsChanged();
    void gameTimeChanged();
    void player1TurnChanged();
    void gameOnChanged();
    void movesChanged();
    void scoreP1Changed();
    void scoreP2Changed();

    void animateScore(QVariant x, QVariant y, QVariant value, QVariant color);
    void createLine(QVariant x1, QVariant y1, QVariant x2, QVariant y2, QVariant type);

private:
    Point *point(int index) const {
        return (index >= 0 && index < m_points.count()) ? m_points.at(index) : 0;
    }

    QList<Point *> m_points;
    QList<Point *> m_captured;
    QList<Point *> m_closed;
    QList<Line *> m_lines;

    int m_scoreP1;
    int m_scoreP2;

    int *chain;
    bool m_gameOn;
    int m_moves;
    int m_player;
    int m_gameTimeSeconds;
    bool m_player1Turn;

    void drawCaptured(int player);

    QTime m_gameTime;
    QTimer *m_gameTimer;
    QString m_time;
};

#endif // GAMEDATA_H
