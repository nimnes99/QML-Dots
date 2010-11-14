import Qt 4.7

Item {
    id: mainView
    width: 800
    height: 480

    GameView {
        id: gameView
        enabled: gameViewHider.state == "hide"
    }

    Rectangle {
        id: gameViewHider
        anchors.fill: parent
        color: "black"
        opacity: 0.7

        states: [
            State {
                name: "hide"
                when: menuPanel.state == "hide"
                PropertyChanges {
                    target: gameViewHider
                    opacity: 0
                }
            }
        ]

        transitions: Transition {
            NumberAnimation {
                properties: "opacity"
                duration: 400
            }
        }
    }

    MenuPanel {
        id: menuPanel
        onResetGame: gameView.deleteLines()
    }
}

