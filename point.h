#ifndef POINT_H
#define POINT_H

#include <QObject>

class Point : public QObject
{
    Q_OBJECT

public:
    Point(QObject *parent = 0) : QObject(parent), m_type(2), m_captured(false) {}

    Q_PROPERTY(int x READ x WRITE setX NOTIFY xChanged);
    int x() const { return m_x; }

    Q_PROPERTY(int y READ y WRITE setY NOTIFY yChanged);
    int y() const { return m_y; }

    Q_PROPERTY(int type READ type WRITE setType NOTIFY typeChanged);
    int type() const { return m_type; }

    Q_PROPERTY(bool captured READ captured WRITE setCaptured NOTIFY capturedChanged);
    int captured() const { return m_captured; }

    void setX(int x) { if(m_x == x) return; m_x = x; emit xChanged();}
    void setY(int y) { if(m_y == y) return; m_y = y; emit yChanged();}

    void setType(int type) {
        if(m_type == type)
            return;
        m_type = type;
        emit typeChanged();
    }

    void setCaptured(bool captured) {
        if (m_captured == captured)
            return;
        m_captured = captured;
        emit capturedChanged();
    }

signals:
    void xChanged();
    void yChanged();
    void typeChanged();
    void capturedChanged();

private:
    int m_x;
    int m_y;
    int m_type;
    bool m_captured;
};

#endif // POINT_H
