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
    var numberOfTurns =  0
    let numberOfPlayer = 2
    

    func startGame () {
        team1.setName ()
        team2.setName ()
        self.setTeam1()
        self.setTeam2()
    }
    
    func setTeam1 () {
        print("\(team1.playerName), \(message.selectHero) ")
        print (message.presentCharacter)
        team1.addAcharacterToMyTeam()
    }
    
    func setTeam2 () {
        print("\(team2.playerName), \(message.selectHero) ")
        print(message.presentCharacter)
        team2.addAcharacterToMyTeam()
    }
    
    func showStatBeforeFight () {
        terminal.clearTerminal()
        print(message.reviewTheTeam)
        print(team1.playerName)
        team1.printMyTeam()
        print(team2.playerName)
        team2.printMyTeam()
        terminal.pressAKeyToContinue()
    }

    func startBattle () {
        var nextPlayer: Int = 1
        terminal.clearTerminal()
        print(message.fightBegin)
        while team1.isDead() == false && team2.isDead() == false {
            numberOfTurns += 1
            if nextPlayer == 1 && !team1.isDead() {
                nextPlayer = 2
                print(" \(team1.playerName) it is your time to Attack !")
                team1.realizeAnAction()
            } else {
                nextPlayer = 1
                print(" \(team2.playerName) it is your time to Attack !")
                team2.realizeAnAction()
            }
        }
    }
    // 📌 a dev showWinner
    // meilleur cou porté !
    // meilleur soin porté
    // les survivants
    // le premier mort
    // nombre de tours
    func showWinner () {
        print(message.gameOver)
        print("number of Turns : \(numberOfTurns)")
        print(team1.playerName)
        team1.printMyTeam()
        print(team2.playerName)
        team2.printMyTeam()
        terminal.pressAKeyToContinue()
    }
    
    init (){
        print (message.welcome)
    }
}

var newGame = Game()
