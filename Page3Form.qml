//Authors: Nathan Tran, Reeder Loveland, Richard Vu
//CPSC254-01 25615

//This file handles the user settings page

import QtQuick 2.12
import QtQuick.Controls 2.5
import Qt.labs.settings 1.0

Page {
    //Initialize page dimensions
    id: settingsPage
    width: 600
    height: 450

    Button {
        id: save_button
        x: 461
        y: 316
        width: 100
        height: 34
        text: "Save"

        onClicked:{
            if(maleRadioButton.checked === true) //if user selected male
            {
                genderConstant = 3.75
                genderString = "Male"
            }
            else //if user selected female
            {
                genderConstant = 4.7
                genderString = "Female"
            }

            ageValue = 2020 - ageComboBox.displayText //calculate user age and set its value on the first page
            weightValue = weightTextField.displayText //set the weight string on the first page
            nameString = nameTextField.text //set the name string on the first page
        }

    }

    //GUI objects
    header: Label {
        height: 50
        color: "#ffffff"
        text: qsTr("User Profile Settings")
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }

    background: Rectangle {
        radius: 2
        color: "light gray"
        border.color: "light gray"
        border.width: 1
        implicitWidth: 200
        implicitHeight: 24
    }

    Rectangle {
        x: 0
        y: -51
        width: 600
        height: 51
        color: "#000000"
    }

    Label {
        id: nameLabel
        x: 65
        y: 22
        width: 60
        height: 29
        text: qsTr("Name")
        font.pointSize: 20
    }

    Label {
        id: genderLabel
        x: 65
        y: 105
        width: 70
        height: 24
        text: qsTr("Gender")
        font.pointSize: 20
    }

    Label {
        id: ageLabel
        x: 65
        y: 185
        width: 118
        height: 29
        text: qsTr("Birthyear")
        font.pointSize: 20
    }

    Label {
        id: weightLabel
        x: 65
        y: 263
        text: qsTr("Weight")
        font.pointSize: 20
    }

    TextField {
        id: weightTextField
        x: 267
        y: 263
        width: 147
        height: 40
        horizontalAlignment: Text.AlignHCenter
        placeholderText: qsTr("Enter Weight (lb)")
    }

    TextField {
        id: nameTextField
        x: 267
        y: 22
        width: 147
        height: 40
        horizontalAlignment: Text.AlignHCenter
        placeholderText: qsTr("Enter Name")
    }

    Pane {
        id: genderPane
        x: 228
        y: 87
        width: 272
        height: 68
        clip: false
        scale: 1
        visible: true

        background: Rectangle {
            radius: 2
            color: "light gray"
            implicitWidth: 50
            implicitHeight: 24
        }

        RadioDelegate {
            id: maleRadioButton
            x: 24
            y: 6
            width: 102
            height: 38
            text: qsTr("Male")
            autoRepeat: false
            autoExclusive: true
            checkable: true
            checked: true
        }

        RadioDelegate {
            id: femaleRadioButton
            x: 169
            y: 6
            width: 127
            height: 38
            text: qsTr("Female")
            hoverEnabled: false
            enabled: true
            highlighted: false
            autoExclusive: true
            autoRepeat: false
        }
    }

    ComboBox {
        id: ageComboBox
        x: 267
        y: 185
        model: ["1978","1979","1980", "1981", "1982", "1983", "1984", "1985", "1986", "1987", "1988", "1989", "1990",
            "1991", "1992", "1993", "1994", "1995", "1996", "1997", "1998", "1999", "2000", "2001", "2002", "2003",
            "2004", "2005", "2006", "2007", "2008", "2009", "2010"]
    }

    Rectangle {
        id: seperator1
        x: 12
        y: 80
        width: 577
        height: 1
        color: "#ffffff"
    }

    Rectangle {
        id: seperator2
        x: 12
        y: 160
        width: 577
        height: 1
        color: "#ffffff"
    }

    Rectangle {
        id: seperator3
        x: 12
        y: 240
        width: 577
        height: 1
        color: "#ffffff"
    }
}
