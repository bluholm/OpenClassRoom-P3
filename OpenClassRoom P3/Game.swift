//
//  game.swift
//  OpenClassRoom P3
//
//  Created by Marc-Antoine BAR on 2022-07-27.
//

public class Game {
    var isGameDone = false
    var debugMod = true
    var winner : String = ""
    let numberOfTurns =  0
    let numberOfPlayer = 2
    

    func startGame () {
        team1.setName ()
        team2.setName ()
        self.setTeam1()
        self.setTeam2()
    }
    
    func setTeam1 () {
        print("\(team1.playerName), \(printText.selectHero) ")
        print (printText.presentCharacter)
        team1.addAcharacterToMyTeam()
    }
    
    func setTeam2 () {
        print("\(team2.playerName), \(printText.selectHero) ")
        print(printText.presentCharacter)
        team2.addAcharacterToMyTeam()
    }
    
    func showStatBeforeFight () {
        terminal.clearTerminal()
        print(printText.reviewTheTeam)
        print(team1.playerName)
        print(team1.printMyTeam())
        print(team2.playerName)
        print(team2.printMyTeam())
        terminal.pressAKeyToContinue()
    }

    func startBattle () {
        var nextPlayer: Int = 1
        while !team1.isNotDead() || !team2.isNotDead(){
            if nextPlayer == 1 {
                nextPlayer = 2
                team1.teamAttackACharacter()
            } else {
                nextPlayer = 1
                team2.teamAttackACharacter()
            }
        }
    }
    // 😁 a dev showWinner
    // meilleur cou porté !
    // meilleur soin porté
    // les survivants
    // le premier mort
    // nombre de tours
    func showWinner () { }
    
    init (){
        print (printText.welcome)
    }
}

var newGame = Game()
