//
//  team.swift
//  OpenClassRoom P3
//
//  Created by Marc-Antoine BAR on 2022-07-27.
//  Defined the two teams

class Team {
    var playerTeamName : [String] = []
    var playerTeamLife : [Int] = []
    var playerTeamType : [String] = []
    var playerTeamHeal : [Bool] = []
    var charactereName: String = ""
    var playerName: String = "NoName"
    let numberMaxOfHerosPerTeam = 3
    
    
    
    
    func setName () {
        print (printText.askNamePlayer  )
            if let name = readLine(strippingNewline: true) {
                self.playerName = name
            }
        terminal.clearTerminal()
    }
        
    
    
    //😁fonctionne que pour team1 !!
    func isNotDead () -> Bool {
        var sumLifePoints: Int = 0
        for i in 0...playerTeamName.count-1 {
            sumLifePoints += playerTeamLife[i]
        }
        if sumLifePoints != 0 {
            return false
        } else {
            return true
        }
    }
    
    
    
    
    func checkNameCharacter () {
        print("Please Enter a name for your Hero ?")
        var isNameUnique = true
        while isNameUnique == true {
            if let Pname = readLine() {
                if team1.playerTeamName.contains(Pname) || team2.playerTeamName.contains(Pname) || Pname == "" {
                    print("name already exist or is empty  : please change ")
                } else {
                    charactereName = Pname
                    playerTeamName.append(charactereName)
                    isNameUnique = false
                }
            }
        }
    }
    
    
    
    
    func appendAcharacterToMyTeam (){
        print("what is the type of \(charactereName) ? (1 ; 2 or 3) ")
        if let choice = readLine() {
            switch Int(choice) {
            case 1:
                playerTeamType.append(warrior.characterType)
                playerTeamLife.append(warrior.characterMaxLifePoints)
                playerTeamHeal.append(warrior.characterHeal)
            case 2:
                playerTeamType.append(magus.characterType)
                playerTeamLife.append(magus.characterMaxLifePoints)
                playerTeamHeal.append(magus.characterHeal)
            case 3:
                playerTeamType.append(dwarf.characterType)
                playerTeamLife.append(dwarf.characterMaxLifePoints)
                playerTeamHeal.append(dwarf.characterHeal)
            default:
                print (printText.defaultChooseCharacter  )
                terminal.pressAKeyToContinue()
                let random = Int.random(in: 1...3)
                switch random {
                    case 1:
                        playerTeamType.append(warrior.characterType)
                        playerTeamLife.append(warrior.characterMaxLifePoints)
                        playerTeamHeal.append(warrior.characterHeal)
                    case 2:
                        playerTeamType.append(magus.characterType)
                        playerTeamLife.append(magus.characterMaxLifePoints)
                        playerTeamHeal.append(magus.characterHeal)
                    case 3:
                        playerTeamType.append(dwarf.characterType)
                        playerTeamLife.append(dwarf.characterMaxLifePoints)
                        playerTeamHeal.append(dwarf.characterHeal)
                    default:
                        break
                }
            }
        }
    }
    
    
    
    
    func addAcharacterToMyTeam () {
        for _ in 1...self.numberMaxOfHerosPerTeam {
            self.checkNameCharacter()
            self.appendAcharacterToMyTeam()            
            }
        }
    
    
    
    
    func printMyTeam () {
        var myTeam: String = ""
        for i in 0..<playerTeamName.count {
            if playerTeamLife[i] > 0 {
                myTeam += "[\(i+1)] "
                myTeam += playerTeamName[i]
                myTeam += " the \(playerTeamType[i])"
                myTeam += "  (\(playerTeamLife[i]) PV)"
                myTeam += "\n"
                }
        }
        myTeam += "\n"
        print("\(myTeam)")
    }
    
    
    func teamselectAnAttacker () -> Int {
        var attacker = 0
        let rangeCharactereStillAlive = 1...playerTeamName.count
        self.printMyTeam()
        var KeepGoing = true
        
        while KeepGoing == true {
            print("J1: Fait un choix :")
            if let choice = readLine(){
                if choice != "" && rangeCharactereStillAlive.contains(Int(choice)!){
                        attacker = Int(choice)!
                        KeepGoing = false
                }
            }
        }
        return attacker
    }
    
    
    // 😁 a dev attackACharacter trop de ligne donc a decouper pour meilleure lsiiblté
    func teamAttackACharacter () {
        terminal.clearTerminal()
        var teamAttacker = teamselectAnAttacker()
    }
    
    
    init(){
        
    }
    
}



var team1 = Team()
var team2 = Team()

