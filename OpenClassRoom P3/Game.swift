//
//  game.swift
//  OpenClassRoom P3
//
//  Created by Marc-Antoine BAR on 2022-07-27.
//

public class Game {
    var isGameDone = false
    var winner : String = ""
    let numberOfTurns =  0
    let numberOfPlayer = 2

    func startGame () {
        newPlayer1.setName ()
        newPlayer2.setName ()
        self.setTeam1()
        self.setTeam2()
    }
    
    func setTeam1 () {
        print("\(newPlayer1.playerName), \(printText.selectHero) ")
        print (printText.presentCharacter)
        team1.addAcharacterToMyTeam()
    }
    func setTeam2 () {
        print("\(newPlayer2.playerName), \(printText.selectHero) ")
        print (printText.presentCharacter)
        team2.addAcharacterToMyTeam()
    }
    
    func showStatBeforeFight () {
        terminal.clearTerminal()
        print(printText.reviewTheTeam)
        print(newPlayer1.playerName)
        print(team1.printMyTeam())
        print(newPlayer2.playerName)
        print(team2.printMyTeam())
        terminal.pressAKeyToContinue()
    }

    func startBattle () {
        var firstPlayer: Int = 1
        print("\(newPlayer1.isNotDead())")
        while !newPlayer1.isNotDead() || !newPlayer2.isNotDead(){
            if firstPlayer == 1 {
                firstPlayer = 2
                team1.team1AttackACharacter()
            } else {
                firstPlayer = 1
                team2.team2AttackACharacter()
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
    
    init (player1: Player, player2: Player){
        print (printText.welcome)
    }
}

var newGame = Game(player1: newPlayer1, player2: newPlayer2)
