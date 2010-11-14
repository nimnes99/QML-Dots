import Qt 4.7
import "lines.js" as Lines

Item {
    id: gameView
    anchors.fill: parent
    signal animateScoreAdding(int x, int y, int score, string color)

    // create line
    function createLine(x1, y1, x2, y2, type) {
        var color;

        // color depends of player
        // player1 - red points
        // player2 - blue
        if (type == 0)
            color = "red";
        else
            color = "blue"

        // create lines for contour of captured zone
        var lineStr = 'Line {x1: ' + x1 +
            '; y1:' + y1 +
            '; x2:' + x2 +
            '; y2:' + y2 +
            '; color: "' + color + '" ; opacity: 0.7; smooth: true}'
        var newObject = Qt.createQmlObject('import Qt 4.7;import MyComponents 1.0;' + lineStr,
                        gameView, "LineSnippet");
        Lines.arr.push(newObject)
    }

    // delete lines
    function deleteLines() {
        for (var i = 0; i < Lines.arr.length; i++) {
            Lines.arr[i].destroy();
        }
    }

    Flickable {
        id: boardFlickable
        anchors.fill: parent
        maximumFlickVelocity: 500
        flickDeceleration: 1000

        Image {
            id: bg
            source: "images/bg.png"
        }

        Grid {
            columns: 13
            rows: 11
            spacing: 38
            x: 11
            y: -5

            Repeater {
                model: gameData.points
                Point {}
            }
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: gameData.handleClick(mouse.x, mouse.y)
    }

    // *** Animation to center the board ***
    ParallelAnimation {
        id: centeringAnimation
        NumberAnimation {
            target: boardFlickable
            property: "contentX"
            to: boardFlickable.contentWidth / 2 - boardFlickable.width / 2
            duration: 1000
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: boardFlickable
            property: "contentY"
            to: boardFlickable.contentHeight / 2 - boardFlickable.height / 2
            duration: 1000
            easing.type: Easing.InOutQuad
        }
    }

    function animateScore(x, y, score, color) {
        animateScoreAdding(x, y, score, color)
    }

    onAnimateScoreAdding: {
        numCaptured.x = x
        numCaptured.y = y
        numCaptured.visible = true
        numCaptured.color = color
        numCaptured.text = "+ " + score;

        scoreAnimation.start()
    }

    // *** Animation of score adding ***
    ParallelAnimation {
        id: scoreAnimation

        NumberAnimation {
            target: numCaptured;
            property: "font.pointSize";
            to: 28;
            duration: 400
        }

        onCompleted: numCaptured.visible = false

    }

    Text {
        visible: false
        id: numCaptured
        font.family: "Helvetica"
        font.pointSize: 14
        color: "gray"
        style: Text.Outline
        styleColor: "black"
        text: ""
    }

    // *** Control panel ***
    ControlPanel {
        id: controlPanel
        anchors.right: boardFlickable.right
        anchors.rightMargin: 10
    }
}
