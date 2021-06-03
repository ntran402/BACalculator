//Authors: Nathan Tran, Reeder Loveland, Richard Vu
//CPSC254-01 25615

//This page handles drink sizes and alcohol values for users to input

import QtQuick 2.12
import QtQuick.Controls 2.5
import Qt.labs.settings 1.0

Page {
    //Initialize window dimensions
    id: drinksPage
    width: 600
    height: 450

    Button {
        id: enterButton
        x: 262
        y: 299
        width: 76
        height: 30
        text: qsTr("Enter")

        onClicked:{
            //Drink sizes for users to select
            if(fourOunceButton.checked == true)
                portionSize = 4.0
            if(eightOunceButton.checked == true)
                portionSize = 8.0
            if(twelveOunceButton.checked == true)
                portionSize = 12.0
            if(sixteenOunceButton.checked == true)
                portionSize = 16.0
            if (customSizeButton.checked == true)
                portionSize = customSizeField.displayText

            alcoholValue = (alcoholPercentField.displayText * portionSize) / 100 //Calculate the ounces of alcohol in the drink
            bloodAlcoholContent += (alcoholValue * genderConstant / weightValue) //Calculate the amount of alcohol the user intakes based on their gender and weight
        }
    }

    //GUI Objects
    header: Label {
        height: 50
        color: "#ffffff"
        text: qsTr("Enter Drinks")
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }

    Rectangle {
        x: 0
        y: -51
        width: 600
        height: 51
        color: "#000000"
    }

    background: Rectangle {
        radius: 2
        color: "light gray"
        border.color: "light gray"
        border.width: 1
        implicitWidth: 200
        implicitHeight: 24
    }

    Text {
        id: drinkSizeLabel
        x: 228
        y: 18
        text: qsTr("Drink Sizes")
        font.pixelSize: 30
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    RadioButton {
        id: fourOunceButton
        x: 160
        y: 69
        width: 107
        height: 40
        text: qsTr("4 oz")
    }

    RadioButton {
        id: eightOunceButton
        x: 315
        y: 69
        width: 112
        height: 40
        text: qsTr("8 oz")
    }

    RadioButton {
        id: sixteenOunceButton
        x: 316
        y: 103
        width: 140
        height: 40
        text: qsTr("16 oz")
    }

    RadioButton {
        id: twelveOunceButton
        x: 160
        y: 103
        width: 150
        height: 40
        text: qsTr("12 oz")
    }

    RadioButton {
        id: customSizeButton
        x: 236
        y: 149
        width: 129
        height: 40
        text: qsTr("Custom Size")
    }

    TextField {
        id: customSizeField
        x: 254
        y: 195
        width: 93
        height: 34
        clip: false

        visible: (customSizeButton.checked)?true:false
        horizontalAlignment: Text.AlignHCenter
        placeholderText: "Enter oz"
    }

    TextField {
        id: alcoholPercentField
        x: 200
        y: 244
        horizontalAlignment: Text.AlignHCenter
        placeholderText: qsTr("Enter Alcohol %")
    }
}
