//
//  main.swift
//  OpenClassRoom P3
//
//  Created by Marc-Antoine BAR on 2022-07-27.
//

terminal.clearTerminal()

var team1 = Team(playerTeamNumber: 1)
var team2 = Team(playerTeamNumber: 2)

if newGame.debugMod == true {
    deboogageInProgess.debugSetTeams(firstTeam: team1, secondTeam: team2)
} else {
    newGame.startGame()
}

newGame.showStatBeforeFight()
newGame.startBattle()
newGame.showWinner()
