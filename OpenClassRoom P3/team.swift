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
    
    func addAcharacterToMyTeam () {
        for i in 1...self.numberMaxOfHerosPerTeam {
            print("But first what is the name of your heros number \(i) ?")
            if let Pname = readLine() {
                charactereName = Pname
                playerTeamName.append(charactereName)
                //😁reste a checker l'unicite du prenom !
            }
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
                    print (PrintText.defaultChooseCharacter.rawValue  )
                    //😁 randomisation a faire avec un switch peut etre  ?!
                    playerTeamType.append(warrior.characterType)
                    playerTeamLife.append(warrior.characterMaxLifePoints)
                }
            }
        }
    }
}

var team1 = Team()
var team2 = Team()
