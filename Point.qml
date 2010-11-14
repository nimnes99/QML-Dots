import Qt 4.7

Item {
    id: point
    width: 10
    height: 10

    property int type: 2
    property bool captured: false

    Image {
        source: {
            if (!modelData.captured) {
                switch(modelData.type) {
                case 0:
                    return "images/point_red.png";
                    break;
                case 1:
                    return "images/point_blue.png";
                    break;
                case 2:
                    return "images/point_empty.png";
                    break;
                }
            } else {
                return "images/cross.png";
            }
        }
    }

    opacity: 1

}

