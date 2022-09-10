//
//  debug.swift
//  OpenClassRoom P3
//
//  Created by Marc-Antoine BAR on 2022-07-29.
//

/// Class usefull to bypass the creating phase (a bit long)
class Debug {
    /// function who generate 2 players ; names and ready to fight 
    func debugSetTeams(firstTeam: Team, secondTeam: Team) {
        firstTeam.playerName = "Paul"
        firstTeam.playerTeamName.append("Bob")
        firstTeam.playerTeamType.append(warrior.characterType)
        firstTeam.playerTeamLife.append(warrior.characterMaxLifePoints)
        firstTeam.playerTeamHeal.append(warrior.characterHeal)
        firstTeam.playerTeamName.append("Henri")
        firstTeam.playerTeamType.append(magus.characterType)
        firstTeam.playerTeamLife.append(magus.characterMaxLifePoints)
        firstTeam.playerTeamHeal.append(magus.characterHeal)
        firstTeam.playerTeamName.append("Albert")
        firstTeam.playerTeamType.append(dwarf.characterType)
        firstTeam.playerTeamLife.append(dwarf.characterMaxLifePoints)
        firstTeam.playerTeamHeal.append(dwarf.characterHeal)
        secondTeam.playerName = "Jinna"
        secondTeam.playerTeamName.append("Sarah")
        secondTeam.playerTeamType.append(magus.characterType)
        secondTeam.playerTeamLife.append(magus.characterMaxLifePoints)
        secondTeam.playerTeamHeal.append(magus.characterHeal)
        secondTeam.playerTeamName.append("Flora")
        secondTeam.playerTeamType.append(warrior.characterType)
        secondTeam.playerTeamLife.append(warrior.characterMaxLifePoints)
        secondTeam.playerTeamHeal.append(warrior.characterHeal)
        secondTeam.playerTeamName.append("tatiana")
        secondTeam.playerTeamType.append(dwarf.characterType)
        secondTeam.playerTeamLife.append(dwarf.characterMaxLifePoints)
        secondTeam.playerTeamHeal.append(dwarf.characterHeal)
    }
}

var deboogageInProgess = Debug()
