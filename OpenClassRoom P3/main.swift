//
//  main.swift
//  OpenClassRoom P3
//
//  Created by Marc-Antoine BAR on 2022-07-27.
//


terminal.clearTerminal()

if newGame.debugMod == true {
    deboogageInProgess.debugSetTeams()
} else {
    newGame.startGame()
}

newGame.showStatBeforeFight()
newGame.startBattle()
newGame.showWinner()


//Documentation
//check all function
//check optimisation
//debug : generate a fake team + fake names
//renommer certaines variables.
