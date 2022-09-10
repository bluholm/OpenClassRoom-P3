//
//  game.swift
//  OpenClassRoom P3
//
//  Created by Marc-Antoine BAR on 2022-07-27.
//

/// Class who manage the game

public class Game {
    
    /// if true = debug mod is active . please change to false to run the program
    var debugMod = false
    ///name of the winner
    var winner: String = ""
    /// how many player will play ( game is configure to run exactly 2 players
    let numberOfPlayer = 2
    var numberOfTurns =  0
    var bestHeal: Int = 0
    var bestAttack: Int = 0
    var firstPlayerDead: String = ""
    func startGame () {
        team1.setName ()
        team2.setName ()
        self.setTeam(team: team1)
        self.setTeam(team: team2)
    }
    func setTeam (team: Team) {
        print("\(team.playerName), \(message.selectHero) ")
        print(message.presentCharacter)
        addAcharacterToMyTeam(teamName: team)
    }
    func showStatBeforeFight () {
        terminal.clearTerminal()
        print(message.reviewTheTeam)
        print(team1.playerName)
        team1.printTeam()
        print(team2.playerName)
        team2.printTeam()
        terminal.pressAKeyToContinue()
    }
    /// start Battle do the alternate choice of each player ; it also incremente the numberOfTurns
    func startBattle() {
        var nextPlayer: Int = 1
        terminal.clearTerminal()
        print(message.fightBegin)
        while team1.isDead() == false && team2.isDead() == false {
            numberOfTurns += 1
            if nextPlayer == 1 && !team1.isDead() {
                nextPlayer = 2
                print("✳️1️⃣ \(team1.playerName) it is your time to Attack ! (turn=\(numberOfTurns))")
                realizeAnAction(teamName: team1)
            } else {
                nextPlayer = 1
                print("✳️2️⃣ \(team2.playerName) it is your time to Attack ! (turn=\(numberOfTurns))")
                realizeAnAction(teamName: team2)
            }
        }
    }
    func showWinner () {
        print(message.gameOver)
        print("number of turns : \(numberOfTurns) \n")
        print("best Attack : \(bestAttack) \n")
        print("best heal : \(bestHeal) \n")        
        
        print(team1.playerName)
        team1.printTeam()
        print(team2.playerName)
        team2.printTeam()
        terminal.pressAKeyToContinue()
    }
    
    
    
    /// Attack make the attack true and calculate
    func attack (attackerTeam: Team, defenderTeam: Team, attacker: Int, target: Int) {
        var damage: Int = 0
        if attackerTeam.playerTeamType[attacker-1] == "magus" {
            damage = wand.weaponDamage
        } else if attackerTeam.playerTeamType[attacker-1] == "warrior" {
            damage = sword.weaponDamage
        } else if attackerTeam.playerTeamType[attacker-1] == "dwarf" {
            damage = axe.weaponDamage
        }
            defenderTeam.playerTeamLife[target-1] -= damage
            if defenderTeam.playerTeamLife[target-1] < 0 {
                defenderTeam.playerTeamLife[target-1] = 0
                if newGame.firstPlayerDead != "" {
                    newGame.firstPlayerDead = defenderTeam.playerTeamName[target-1]
                }
            }
        terminal.clearTerminal()
        print(message.fightBegin)
        print("--------------------")
        print("⚠️\(attackerTeam.playerTeamName[attacker-1]) damage \(damage)PV to \(defenderTeam.playerTeamName[target-1]) ")
        print("--------------------")
        if damage > newGame.bestAttack {
            newGame.bestAttack = damage
        }
    }
    /// add heal point to the target
    /// - Parameters:
    /// - healer : number of the table .
    /// - target : number of the taarget
    func heal (teamName: Team, healer: Int, target: Int) {
        let healpts: Int = wand.weaponHeal
        terminal.clearTerminal()
        print(message.fightBegin)
        print("--------------------")
        print("⚠️\(teamName.playerTeamName[healer-1])PV heal to \(teamName.playerTeamName[target-1]) with \(healpts)PV !")
        print("--------------------")
        teamName.playerTeamLife[target-1] += healpts
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
    func realizeAnAction (teamName: Team) {
        // 1- Select an attacker
        teamName.printTeam()
        print("Select a fighter:")
        let teamAttacker = teamName.selectAttacker()
        // 2- Test if want heal
        if teamName.playerTeamHeal[teamAttacker-1] == true && wouldYouLikeToHeal() == "Y" {
            teamName.printTeam()
            print("Select someone to heal :")
            let teamHeal = teamName.selectHealer()
            heal(teamName: teamName, healer: teamAttacker, target: teamHeal)
            } else {
                returnMyOpponent(myTeam: teamName).printTeam()
                print("Select a target:")
                let teamOpponent = teamName.selectTarget(targetTeam: returnMyOpponent(myTeam: teamName))
                attack(attackerTeam: teamName,
                            defenderTeam: returnMyOpponent(myTeam: teamName),
                            attacker: teamAttacker,
                            target: teamOpponent)
            }
    }
    func returnMyOpponent(myTeam: Team) -> Team {
        if myTeam.playerTeamNumber == 1 {
            return team2
        } else {
            return team1
        }
    }
    func addAcharacterToMyTeam (teamName: Team) {
        for _ in 1...teamName.numberMaxOfHerosPerTeam {
            teamName.checkNameCharacter(firstTeam: teamName, secondTeam: returnMyOpponent(myTeam: teamName))
            teamName.appendAcharacterToMyTeam()
            }
        }
    
    
    init () {
        print (message.welcome)
    }
}
var newGame = Game()
