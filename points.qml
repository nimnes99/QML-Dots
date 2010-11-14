import Qt 4.7
import "game.js" as Game

Rectangle {
    id: screen
    width: 480
    height: 480

    SystemPalette {id: activePalette}
    color: "white"

    Item {
        // Draw a notebook list
        Grid {
            columns: 4
            rows: 10

            Repeater {
                model: 40

                Image {
                    source: "paper.gif"
                    fillMode: Image.TileHorizontally
                }
            }
        }

        Item {
            id: gameCanvas

            property int cellSize: 20

            width: parent.width - (parent.width % cellSize)
            height: parent.height - (parent.height % cellSize)
            anchors.centerIn: parent
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: Game.handleClick(mouse.x, mouse.y)
    }

    // Draw red line
    Rectangle {
        x: 420

        width: 1
        height: parent.height
        color: "red"
    }

    Rectangle {
        id: menu

        width: parent.width
        height: 30
        anchors.bottom: screen.bottom

        Button {
             anchors { left: parent.left; verticalCenter: parent.verticalCenter }
             text: "New Game"
             onClicked: Game.startNewGame()
         }
    }

//    // Draw a grid like notebook
//    Grid {
//        columns: 40
//        rows: 40

//        Repeater {
//            model: 1600

//            Rectangle {
//                width: 12
//                height: 12

//                border.width: 1
//                border.color: "black"
//            }
//        }
//    }

}
