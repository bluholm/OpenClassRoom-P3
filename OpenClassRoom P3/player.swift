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
    
    func isNotDead () -> Bool {
        var sumLifePoints: Int = 0
        for i in 0...2 {
            sumLifePoints += team1.playerTeamLife[i]
        }
        if sumLifePoints != 0 {
            return false
        } else {
            return true
        }
       
        
        
    }
    init (){}
}

var newPlayer1 = Player()
var newPlayer2 = Player()
