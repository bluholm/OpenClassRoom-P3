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
    var playerTeamNumber : Int
    var charactereName: String = "" //📌a voir si utile ou non
    var playerName: String = "NoName" //📌a noname ? ou declaration autrement init ?!
    let numberMaxOfHerosPerTeam = 3
    
    
    
    
    func setName () {
        print (printText.askNamePlayer  )
            if let name = readLine(strippingNewline: true) {
                self.playerName = name
            }
        terminal.clearTerminal()
    }
        
    
    func isDead () -> Bool {
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
        print("what is the type of \(charactereName) ?")
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
    
    
    func printMyOpponentTeam () {
        if playerTeamNumber == 1 {
            var myTeam: String = ""
            for i in 0..<team2.playerTeamName.count {
                if team2.playerTeamLife[i] > 0 {
                    myTeam += "[\(i+1)] "
                } else {
                    myTeam += "[D] "
                }
                    myTeam += team2.playerTeamName[i]
                    myTeam += " the \(team2.playerTeamType[i])"
                    myTeam += "  (\(team2.playerTeamLife[i]) PV)"
                    myTeam += "\n"
                    
            }
            myTeam += "\n"
            print("\(myTeam)")
        } else {
            var myTeam: String = ""
            for i in 0..<team1.playerTeamName.count {
                if team1.playerTeamLife[i] > 0 {
                    myTeam += "[\(i+1)] "
                } else {
                    myTeam += "[D] "
                }
                    myTeam += team1.playerTeamName[i]
                    myTeam += " the \(team1.playerTeamType[i])"
                    myTeam += "  (\(team1.playerTeamLife[i]) PV)"
                    myTeam += "\n"
                    
            }
            myTeam += "\n"
            print("\(myTeam)")
        }
        
    }
    
     
    func printMyTeam () {
        var myTeam: String = ""
        for i in 0..<playerTeamName.count {
            if playerTeamLife[i] > 0 {
                myTeam += "[\(i+1)] "
            } else{
                myTeam += "[D] "
            }
                myTeam += playerTeamName[i]
                myTeam += " the \(playerTeamType[i])"
                myTeam += "  (\(playerTeamLife[i]) PV)"
                myTeam += "\n"
                
        }
        print("\(myTeam)")
    }
    
    
    func teamselectAnAttacker () -> Int {
        var KeepGoing = true
        var attacker = 0
        let rangeCharactereStillAlive = 1...playerTeamName.count
        
        while KeepGoing == true {
            if let choice = readLine(){
                print (" ")
                if self.playerTeamLife[Int(choice)!-1]>0 &&  Int(choice) != nil && choice != "" && rangeCharactereStillAlive.contains(Int(choice)!){
                        attacker = Int(choice)!
                        KeepGoing = false
                }else{
                    print ("wrong choice")
                }
            }
        }
        return attacker
    }
   
    
    func teamselectTarget () -> Int {
        var KeepGoing = true
        var target = 0
        var Life = 0
        var rangeCharactereStillAlive = 1...1
        
        if playerTeamNumber == 1{
            rangeCharactereStillAlive = 1...team2.playerTeamName.count
        } else {
            rangeCharactereStillAlive = 1...team1.playerTeamName.count
        }
        while KeepGoing == true {
            print ("")
            if let choice = readLine(){
                
                if playerTeamNumber == 1{
                    rangeCharactereStillAlive = 1...team2.playerTeamName.count
                    Life = team2.playerTeamLife[Int(choice)!-1]
                } else {
                    rangeCharactereStillAlive = 1...team1.playerTeamName.count
                    Life = team1.playerTeamLife[Int(choice)!-1]
                }
                
                
                if Life > 0 && Int(choice) != nil && choice != "" && rangeCharactereStillAlive.contains(Int(choice)!){
                    target = Int(choice)!
                        KeepGoing = false
                }else{
                    print ("wrong choice")
                }
            }
        }
        return target
    }
    
    
    func Attack (attacker: Int, target: Int){
        print("Une attaque massive de \(playerTeamName[attacker-1]) a eu lieu ! il était \(playerTeamType[attacker-1]) !")
        var damage: Int = 0
        if playerTeamType[attacker-1] == "magus" {
            damage = wand.weaponDamage
        }
        else if playerTeamType[attacker-1] == "warrior" {
            damage = sword.weaponDamage
        }
        else if playerTeamType[attacker-1] == "dwarf" {
            damage = axe.weaponDamage
        }
        if playerTeamNumber == 1 {
            team2.playerTeamLife[target-1] -= damage
            print(" nombre de damage infligé= \(damage) à \(team2.playerTeamName[target-1]) ")
            if team2.playerTeamLife[target-1] < 0 {
                team2.playerTeamLife[target-1] = 0
               
            }
        }else{
            team1.playerTeamLife[target-1] -= damage
            if team1.playerTeamLife[target-1] <= 0 {
                team1.playerTeamLife[target-1] = 0
            }
            print(" nombre de damage infligé= \(damage) à \(team1.playerTeamName[target-1]) ")
        }
        
    }
    
    // 📌 les soins ?!
    func teamAttackACharacter () {
        //1- Select an attacker
        self.printMyTeam()
        print("Select a fighter:")
        let teamAttacker = teamselectAnAttacker()
        
        //2- Select an target
        self.printMyOpponentTeam()
        print("Select a target:")
        let teamOpponent = teamselectTarget()
        
        //3- Attack
        self.Attack(attacker: teamAttacker, target: teamOpponent)
        
        
    }
    
    
    init(playerTeamNumber: Int){
        self.playerTeamNumber = playerTeamNumber
        
    }
    
}



var team1 = Team(playerTeamNumber: 1)
var team2 = Team(playerTeamNumber: 2)

