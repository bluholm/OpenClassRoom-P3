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
        team1.printMyTeam()
        print(team2.playerName)
        team2.printMyTeam()
        terminal.pressAKeyToContinue()
    }

    func startBattle () {
        var nextPlayer: Int = 1
        terminal.clearTerminal()
        print(printText.fightBegin)
        while team1.isDead() == false && team2.isDead() == false {
            
            
            
            if nextPlayer == 1 && !team1.isDead() {
                nextPlayer = 2
                print(" \(team1.playerName) it is your time to Attack !")
                team1.teamAttackACharacter()
            } else {
                nextPlayer = 1
                print(" \(team2.playerName) it is your time to Attack !")
                team2.teamAttackACharacter()
            }
        }
    }
    // 📌 a dev showWinner
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
