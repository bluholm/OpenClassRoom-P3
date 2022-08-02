//
//  game.swift
//  OpenClassRoom P3
//
//  Created by Marc-Antoine BAR on 2022-07-27.
//

/// Class who manage the game
public class Game {
    /// if true = debug mod is active . please change to false to run the program
    var debugMod = false
    
    ///name of the winner
    var winner : String = ""
    
    /// how many player will play ( game is configure to run exactly 2 players
    let numberOfPlayer = 2
    
    var numberOfTurns =  0
    var bestHeal: Int = 0
    var bestAttack: Int = 0
    var firstPlayerDead: String = ""
    
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

    ///start Battle do the alternate choice of each player ; it also incremente the numberOfTurns
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
    
    func showWinner () {
        print(message.gameOver)
        print("number of turns : \(numberOfTurns) \n")
        print("best Attack : \(bestAttack) \n")
        print("best heal : \(bestHeal) \n")
        print("first player dead : \(bestHeal) \n")
        
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
