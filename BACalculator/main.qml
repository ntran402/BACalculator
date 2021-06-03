//Authors: Nathan Tran, Reeder Loveland, Richard Vu
//CPSC254-01 25615

//This file handles the application window and initializes pages

import QtQuick 2.12
import QtQuick.Controls 2.5
import Qt.labs.settings 1.0

ApplicationWindow {
    //Initialize the settings of the app window
    id: applicationWindow
    width: 600
    height: 450
    visible: true
    title: qsTr("BACalculator")

    //Initialize variables used on the first page to display user info
    property string genderString:""
    property string weightContent: ""
    property string nameString:""
    property double ageValue: 0.0

    //Initialize variables to calculate seconds passed between sessions
    property double newStartTime: new Date().getTime()
    property double oldStartTime: 0.0
    property double secondsPassed: 0.0
    property double sessionSeconds: 0.0

    //Initialize variables to calculate a user's BAC
    property double bloodAlcoholContent: 0.0
    property double weightValue: 0.0
    property double portionSize: 0.0
    property double alcoholValue: 0.0
    property double genderConstant: 0.0

    //The rate at which alcohol leaves our blood per second
    property double eliminationRate: 0.00000472222

    //Store variables from previous sessions
    Settings {
        property alias bloodAlcoholContent: applicationWindow.bloodAlcoholContent
        property alias genderString: applicationWindow.genderString
        property alias weightValue: applicationWindow.weightValue
        property alias ageValue: applicationWindow.ageValue
        property alias genderConstant: applicationWindow.genderConstant
        property alias nameString: applicationWindow.nameString
        property alias sessionSeconds: applicationWindow.sessionSeconds
        property alias newStartTime: applicationWindow.oldStartTime
    }

    //Initializes pages with swipe functionality
    //Pages are handled in separate files
    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page1Form {
        }

        Page2Form {
        }

        Page3Form {
        }
    }

    //Initialize tab bars
    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: qsTr("Blood Alcohol Content")
        }
        TabButton {
            text: qsTr("Enter Drinks")
        }
        TabButton {
            text: qsTr("User Profile Settings")
        }
    }
}
