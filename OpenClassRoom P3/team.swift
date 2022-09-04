//
//  team.swift
//  OpenClassRoom P3
//
//  Created by Marc-Antoine BAR on 2022-07-27.
//  Defined the two teams

/// 2 teams ; 1 class : each team has numberMaxOfHerosPerTeam of character in each teams .
/// code has been made with table :
/// playerTeamName  (String)
/// playerTeamLife (Int)
/// playerTeamType (Type)
/// playerTeamHeal (Bool)
///
/// Example :
/// playerTeamName = ["Bob",Rasta"","Chris"]

class Team {
    var playerTeamName: [String] = []
    var playerTeamLife: [Int] = []
    var playerTeamType: [String] = []
    var playerTeamHeal: [Bool] = []
    /// playerTeamNumber is needed when we need to test which team to show (especially when oppoents are required)
    var playerTeamNumber: Int
    var charactereName: String = ""
    var playerName: String = "NoName"
    let numberMaxOfHerosPerTeam = 3
    /// set a Name to the Player
    func setName () {
        print(message.askNamePlayer  )
            if let name = readLine(strippingNewline: true) {
                self.playerName = name
            }
        terminal.clearTerminal()
    }
    /// sum of the LifePoint of all member of theteam to check if dead or not
    /// - Returns
    /// true mean 1 player is dead and game will be over
    func isDead () -> Bool {
        var sumLifePoints: Int = 0
        for number in 0...playerTeamName.count-1 {
            sumLifePoints += playerTeamLife[number]
        }
        if sumLifePoints != 0 {
            return false
        } else {
            return true
        }
    }
    /// check unicity of each name in the game ( using a loop to check all teams)
    func checkNameCharacter () {
        print("Please Enter a name for your Hero ?")
        var isNameUnique = true
        while isNameUnique == true {
            if let pname = readLine() {
                if team1.playerTeamName.contains(pname) || team2.playerTeamName.contains(pname) || pname == "" {
                    print("name already exist or is empty  : please change ")
                } else {
                    charactereName = pname
                    playerTeamName.append(charactereName)
                    isNameUnique = false
                }
            }
        }
}
    /// add the charactere type on the caractere after choicing
    /// If the choice is wrong : random type is affected
    func appendAcharacterToMyTeam () {
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
                print(message.defaultChooseCharacter)
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
    /// print in terminal the opponent team
    func printMyOpponentTeam () {
        if playerTeamNumber == 1 {
            team2.printMyTeam()
        } else {
            team1.printMyTeam()
        }
    }
     /// print in the terminal my team
    func printMyTeam () {
        var myTeam: String = ""
        for number in 0..<playerTeamName.count {
            if playerTeamLife[number] > 0 {
                myTeam += "[\(number+1)] "
            } else {
                myTeam += "[D] "
            }
                myTeam += playerTeamName[number]
                myTeam += " the \(playerTeamType[number])"
                myTeam += "  (\(playerTeamLife[number]) PV)"
                myTeam += "\n"
        }
        print("\(myTeam)")
    }
    /// Ask to select an attacker
    func selectAttacker () -> Int {
        var keepGoing = true
        var attacker = 0
        let rangeCharactereStillAlive = 1...playerTeamName.count
        while keepGoing == true {
            if let choice = readLine() {
                print(" range:\(rangeCharactereStillAlive)")
                if self.playerTeamLife[Int(choice)!-1]>0 &&  Int(choice) != nil && choice != ""  && rangeCharactereStillAlive.contains(Int(choice)!) {
                        attacker = Int(choice)!
                        keepGoing = false
                } else {
                    print("wrong choice")
                }
            }
        }
        return attacker
    }
    /// ask to select a Target and check the alive people !
    func selectTarget() -> Int {
        var keepGoing = true
        var target = 0
        var life = 0
        var rangeCharactereStillAlive = 1...1
        if playerTeamNumber == 1 {
            rangeCharactereStillAlive = 1...team2.playerTeamName.count
        } else {
            rangeCharactereStillAlive = 1...team1.playerTeamName.count
        }
        while keepGoing == true {
            print("")
            if let choice = readLine() {
                if playerTeamNumber == 1 {
                    rangeCharactereStillAlive = 1...team2.playerTeamName.count
                    life = team2.playerTeamLife[Int(choice)!-1]
                } else {
                    rangeCharactereStillAlive = 1...team1.playerTeamName.count
                    life = team1.playerTeamLife[Int(choice)!-1]
                }
                if life > 0 && Int(choice) != nil && choice != "" && rangeCharactereStillAlive.contains(Int(choice)!) {
                    target = Int(choice)!
                        keepGoing = false
                } else {
                    print("wrong choice")
                }
            }
        }
        return target
    }
    /// ask to select a healer , only if he is magus
    func selectHealer () -> Int {
        var keepGoing = true
        var target = 0
        var life = 0
        let rangeCharactereStillAlive = 1...self.playerTeamName.count
        while keepGoing == true {
            print("")
            if let choice = readLine() {
                life = self.playerTeamLife[Int(choice)!-1]
                if life > 0 && Int(choice) != nil && choice != "" && rangeCharactereStillAlive.contains(Int(choice)!) {
                    target = Int(choice)!
                        keepGoing = false
                } else {
                    print("wrong choice")
                }
            }
        }
        return target
    }
    /// Attack make the attack true and calculate
    func attack (attacker: Int, target: Int) {
        var damage: Int = 0
        if playerTeamType[attacker-1] == "magus" {
            damage = wand.weaponDamage
        } else if playerTeamType[attacker-1] == "warrior" {
            damage = sword.weaponDamage
        } else if playerTeamType[attacker-1] == "dwarf" {
            damage = axe.weaponDamage
        }
        if playerTeamNumber == 1 {
            team2.playerTeamLife[target-1] -= damage
            print("\(damage)PV to \(team2.playerTeamName[target-1]) ")
            if team2.playerTeamLife[target-1] < 0 {
                team2.playerTeamLife[target-1] = 0
                if newGame.firstPlayerDead != "" {
                    newGame.firstPlayerDead = team2.playerTeamName[target-1]
                }
            }
        } else {
            team1.playerTeamLife[target-1] -= damage
            if team1.playerTeamLife[target-1] <= 0 {
                team1.playerTeamLife[target-1] = 0
                if newGame.firstPlayerDead != "" {
                    newGame.firstPlayerDead = team2.playerTeamName[target-1]
                }
            }
            print("\(damage) to \(team1.playerTeamName[target-1]) ")
            if damage > newGame.bestAttack {
                newGame.bestAttack = damage
            }
        }
    }
    /// add heal point to the target
    /// - Parameters:
    /// - healer : number of the table .
    /// - target : number of the taarget
    func heal (healer: Int, target: Int) {
        let healpts: Int = wand.weaponHeal
        print("\(playerTeamName[healer-1])PV healed \(playerTeamName[target-1]) with \(healpts)PV !")
        self.playerTeamLife[target-1] += healpts
        if healpts>newGame.bestHeal {
            newGame.bestHeal = healpts
        }
    }
    // Ask if want to heal ? only for the healer ; return Y or N
    func wouldYouLikeToHeal () -> String {
        var answer: String = ""
        print("would you like to heal ? (Y or N) ")
        while answer == "" {
            if let wouldYouLikeToHeal = readLine() {
                switch wouldYouLikeToHeal {
                case "Y":
                        answer = "Y"
                case "N":
                        answer = "N"
                default:
                        print("wrong choice")
                }
            }
        }
        return answer
    }
    // Final function of realising 1 action
    func realizeAnAction () {
        // 1- Select an attacker
        self.printMyTeam()
        print("Select a fighter:")
        let teamAttacker = selectAttacker()
        // 2- Test Si veut soigner
        if playerTeamHeal[teamAttacker-1] == true {
            if self.wouldYouLikeToHeal() == "Y" {
                self.printMyTeam()
                print("Select someone to heal :")
                let teamHeal = selectHealer()
                self.heal(healer: teamAttacker, target: teamHeal)
            } else {
                self.printMyOpponentTeam()
                print("Select a target:")
                let teamOpponent = selectTarget()
                self.attack(attacker: teamAttacker, target: teamOpponent)
            }
        } else {
            self.printMyOpponentTeam()
            print("Select a target:")
            let teamOpponent = selectTarget()
            self.attack(attacker: teamAttacker, target: teamOpponent)
        }
    }
    init(playerTeamNumber: Int) {
        self.playerTeamNumber = playerTeamNumber
    }
}

var team1 = Team(playerTeamNumber: 1)
var team2 = Team(playerTeamNumber: 2)
