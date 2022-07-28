//
//  team.swift
//  OpenClassRoom P3
//
//  Created by Marc-Antoine BAR on 2022-07-27.
//

class Team {
    var playerTeamName : [String] = []
    var playerTeamLife : [Int] = []
    var playerTeamType : [String] = []
    var charactereName: String = ""
    let numberMaxOfHerosPerTeam = 3
    
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
            case 2:
                playerTeamType.append(magus.characterType)
                playerTeamLife.append(magus.characterMaxLifePoints)
            case 3:
                playerTeamType.append(dwarf.characterType)
                playerTeamLife.append(dwarf.characterMaxLifePoints)
            default:
                print (printText.defaultChooseCharacter  )
                //😁 randomisation a faire avec un switch peut etre  ?!
                playerTeamType.append(warrior.characterType)
                playerTeamLife.append(warrior.characterMaxLifePoints)
            }
        }
    }
    
    func addAcharacterToMyTeam () {
        for _ in 1...self.numberMaxOfHerosPerTeam {
            self.checkNameCharacter()
            self.appendAcharacterToMyTeam()            
            }
        }
    
    func printMyTeam () -> String {
        var myTeam: String = ""
        for i in 0..<3 {
            myTeam += "[\(i+1)] "
            myTeam += playerTeamName[i]
            myTeam += " the \(playerTeamType[i])"
            myTeam += "(\(playerTeamLife[i]) / \(playerTeamLife[i]))"
            myTeam += "\n"
        }
        myTeam += "\n"
        return myTeam
    }
}

var team1 = Team()
var team2 = Team()

