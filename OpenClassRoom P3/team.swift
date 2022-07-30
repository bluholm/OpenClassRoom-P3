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
    
    
    
    
    func printMyTeam () -> String {
        var myTeam: String = ""
        for i in 0..<playerTeamName.count {
                myTeam += "[\(i+1)] "
                myTeam += playerTeamName[i]
                myTeam += " the \(playerTeamType[i])"
                myTeam += "  (\(playerTeamLife[i]) PV)"
                myTeam += "\n"
        }
        myTeam += "\n"
        return myTeam
    }
    
    
    
    // 😁 a dev attackACharacter trop de ligne donc a decouper pour meilleure lsiiblté
    func team1AttackACharacter () {
        terminal.clearTerminal()
       
            print("\(team1.playerName) select an attacker")
            print(team1.printMyTeam())
        
        //choice of the Charactere between the one still alive !!
        var choiceAttackerAlternate: Int = 0
        let rangeCharactereStillAlive = 0..<team1.playerTeamName.count
        while choiceAttackerAlternate == 0 {
            if let attacker = readLine() {
                if rangeCharactereStillAlive.contains(Int(attacker)!) {
                    choiceAttackerAlternate = 1
                    if (playerTeamHeal[Int(attacker)!] == true){
                        //😁 veut tu soigner ?!
                        print("would you like to heal ?! ")
                    }
                    //choose target
                    print("Choose a target : ")
                    print(team2.printMyTeam())
                    var choiceTargetAlternate: Int = 0
                    //😁 indiquer opponent team !
                    let rangeTargetStillAlive = 0..<team2.playerTeamName.count
                    while choiceTargetAlternate == 0 {
                        if let target = readLine() {
                            if rangeTargetStillAlive.contains(Int(target)!) {
                                choiceTargetAlternate = 1
                            }else{
                                choiceTargetAlternate = 0
                            }
                        }
                    }
                    
                    
                }else {
                    print("wrong choice")
                    choiceAttackerAlternate = 0
                }
            }
        }
        //check the target available ( including thoses who can be heal )
        
        
    }
        
       
        //liste targets
            //liste ceux que tu peux attaquer
            //liste ceux que tu peux soigner
        //appliquer le soin ou l'attaque
      
    init(){
        
    }
    
}



var team1 = Team()
var team2 = Team()

