//
//  player.swift
//  OpenClassRoom P3
//
//  Created by Marc-Antoine BAR on 2022-07-27.
//

class Player {
    
    var playerName: String = "NoName"
    let numberMaxOfHerosPerTeam = 3
    
    func setName () {
        print (printText.askNamePlayer  )
            if let name = readLine(strippingNewline: true) {
                self.playerName = name
            }
        terminal.clearTerminal()
    }
    
    func attackACharacter () {}
    func isDead () {}
    init (){}
}

var newPlayer1 = Player()
var newPlayer2 = Player()
