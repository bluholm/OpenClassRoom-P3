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
    func checkNameCharacter (firstTeam: Team, secondTeam: Team) {
        print("Please Enter a name for your Hero ?")
        var isNameUnique = true
        while isNameUnique == true {
            if let pname = readLine() {
                if firstTeam.playerTeamName.contains(pname) ||
                    secondTeam.playerTeamName.contains(pname) ||
                    pname == "" {
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
     /// print in the terminal my team
    func printTeam () {
        var myTeam: String = ""
        for number in 0..<self.playerTeamName.count {
            if self.playerTeamLife[number] > 0 {
                myTeam += "[\(number+1)] "
            } else {
                myTeam += "[D] "
            }
            myTeam += self.playerTeamName[number]
            myTeam += " the \(self.playerTeamType[number])"
            myTeam += "  (\(self.playerTeamLife[number]) PV)"
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
                if Int(choice) == nil || choice == "" {
                    print("wrong choice cannot be empty")
                } else {
                    if !rangeCharactereStillAlive.contains(Int(choice)!) {
                        print("wrong choice not in interval")
                    } else {
                        if self.playerTeamLife[Int(choice)!-1]<=0 {
                            print("wrong choice cannot be a ded people")
                        } else {
                            attacker = Int(choice)!
                            keepGoing = false
                        }
                    }
                }
            }
        }
        return attacker
    }
    /// ask to select a Target and check the alive people !
    func selectTarget(targetTeam: Team) -> Int {
        var keepGoing = true
        var target = 0
        var life = 0
        let rangeCharactereStillAlive = 1...targetTeam.playerTeamName.count
        while keepGoing == true {
            if let choice = readLine() {
                if Int(choice) == nil || choice == "" {
                    print("wrong choice cannot be empty")
                } else {
                    if !rangeCharactereStillAlive.contains(Int(choice)!) {
                        print("wrong choice")
                    } else {
                        life = targetTeam.playerTeamLife[Int(choice)!-1]
                        if life <= 0 {
                            print("wrong choice : character is dead ! ")
                        } else {
                            target = Int(choice)!
                            keepGoing = false
                        }
                    }
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
    init(playerTeamNumber: Int) {
        self.playerTeamNumber = playerTeamNumber
    }
}
