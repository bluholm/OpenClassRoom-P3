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
    var charactereName: String = "" 
    var playerName: String = "NoName"
    let numberMaxOfHerosPerTeam = 3
    
    
    
    
    func setName () {
        print (message.askNamePlayer  )
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
                print (message.defaultChooseCharacter)
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
    
    
    func selectAttacker () -> Int {
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
   
    
    func selectTarget () -> Int {
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
    
    
    func selectHealer () -> Int {
        var KeepGoing = true
        var target = 0
        var Life = 0
        let rangeCharactereStillAlive = 1...self.playerTeamName.count
        
        while KeepGoing == true {
            print ("")
            if let choice = readLine(){
                Life = self.playerTeamLife[Int(choice)!-1]
                
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
            print("\(damage) to \(team2.playerTeamName[target-1]) ")
            if team2.playerTeamLife[target-1] < 0 {
                team2.playerTeamLife[target-1] = 0
               
            }
        }else{
            team1.playerTeamLife[target-1] -= damage
            if team1.playerTeamLife[target-1] <= 0 {
                team1.playerTeamLife[target-1] = 0
            }
            print("\(damage) to \(team1.playerTeamName[target-1]) ")
        }
        
    }
    
    
    func Heal (healer: Int, target: Int){
        print("\(playerTeamName[healer-1]) healed \(playerTeamName[target-1]) !")
        var healpts: Int = 0
        healpts = wand.weaponDamage
        self.playerTeamLife[target-1] += healpts
    }
    
    
    func wouldYouLikeToHeal () -> String{
        var answer: String = ""
        print("would you like to heal ? (Y or N) ")
        while answer == "" {
            if let wouldYouLikeToHeal = readLine() {
                switch wouldYouLikeToHeal {
                    case "Y" :
                        answer = "Y"
                    case "N" :
                        answer = "N"
                    default :
                        print("wrong choice")
                }
            }
        }
        return answer
    }
    
    
    func realizeAnAction () {
        
        //1- Select an attacker
        self.printMyTeam()
        print("Select a fighter:")
        let teamAttacker = selectAttacker()
        
        //2- Test Si veut soigner
        if playerTeamHeal[teamAttacker-1] == true {
            
            if self.wouldYouLikeToHeal() == "Y"{
                
                self.printMyTeam()
                print("Select someone to heal :")
                let teamHeal = selectHealer()
                self.Heal(healer: teamAttacker, target: teamHeal)
                
            } else {
                
                self.printMyOpponentTeam()
                print("Select a target:")
                let teamOpponent = selectTarget()
                self.Attack(attacker: teamAttacker, target: teamOpponent)
            }
            
        } else {
            
            self.printMyOpponentTeam()
            print("Select a target:")
            let teamOpponent = selectTarget()
            self.Attack(attacker: teamAttacker, target: teamOpponent)
        }
 
    }
    
    
    init(playerTeamNumber: Int){
        self.playerTeamNumber = playerTeamNumber
        
    }
    
}



var team1 = Team(playerTeamNumber: 1)
var team2 = Team(playerTeamNumber: 2)

