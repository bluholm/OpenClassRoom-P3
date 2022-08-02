//
//  debug.swift
//  OpenClassRoom P3
//
//  Created by Marc-Antoine BAR on 2022-07-29.
//


/// Class usefull to bypass the creating phase (a bit long)
class Debug {
    
    /// function who generate 2 players ; names and ready to fight 
    func debugSetTeams(){
        team1.playerName = "Paul"
        
        team1.playerTeamName.append("Bob")
        team1.playerTeamType.append(warrior.characterType)
        team1.playerTeamLife.append(warrior.characterMaxLifePoints)
        team1.playerTeamHeal.append(warrior.characterHeal)
        
        team1.playerTeamName.append("Henri")
        team1.playerTeamType.append(magus.characterType)
        team1.playerTeamLife.append(magus.characterMaxLifePoints)
        team1.playerTeamHeal.append(magus.characterHeal)
    
        team1.playerTeamName.append("Albert")
        team1.playerTeamType.append(dwarf.characterType)
        team1.playerTeamLife.append(dwarf.characterMaxLifePoints)
        team1.playerTeamHeal.append(dwarf.characterHeal)
        
        team2.playerName = "Jinna"
        
        team2.playerTeamName.append("Sarah")
        team2.playerTeamType.append(magus.characterType)
        team2.playerTeamLife.append(magus.characterMaxLifePoints)
        team2.playerTeamHeal.append(magus.characterHeal)
        
        team2.playerTeamName.append("Flora")
        team2.playerTeamType.append(warrior.characterType)
        team2.playerTeamLife.append(warrior.characterMaxLifePoints)
        team2.playerTeamHeal.append(warrior.characterHeal)
    
        team2.playerTeamName.append("tatiana")
        team2.playerTeamType.append(dwarf.characterType)
        team2.playerTeamLife.append(dwarf.characterMaxLifePoints)
        team2.playerTeamHeal.append(dwarf.characterHeal)
        
    }
    
}

var deboogageInProgess = Debug()
