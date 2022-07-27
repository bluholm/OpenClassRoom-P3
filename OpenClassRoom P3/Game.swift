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
        print (PrintText.askNamePlayer.rawValue  )
        newPlayer1.setName ()
        print (PrintText.askNamePlayer.rawValue  )
        newPlayer2.setName ()
        terminal.clearScreen()
        self.setTeam()
    }
    
    func setTeam () {
        print("\(newPlayer1.playerName), \(PrintText.selectHero.rawValue) ")
        terminal.pressAKeyToContinue()
        terminal.clearScreen()
        print (PrintText.presentCharacter.rawValue)
        team1.addAcharacterToMyTeam()
        terminal.clearScreen()
        
        print("\(newPlayer2.playerName), \(PrintText.selectHero.rawValue) ")
        terminal.pressAKeyToContinue()
        terminal.clearScreen()
        print (PrintText.presentCharacter.rawValue)
        team2.addAcharacterToMyTeam()
        terminal.clearScreen()
    }
    
    // 😁 a dev
    func showStatBeforeFight () {}
    // 😁 a dev
    //      tant qu'un joueur est pas mort
    //           alors on alterne joueur
    //           Joueur choisi son heros
    //           Joueur choisi sa cible
    //           On applique les sortilege.
    func startBattle () {}
    // 😁 a dev
    func showWinner () { }
    
    init (player1: Player, player2 :Player){
        terminal.clearScreen()
        print (PrintText.welcome.rawValue  )
    }
}

var newGame = Game(player1: newPlayer1, player2: newPlayer2)
