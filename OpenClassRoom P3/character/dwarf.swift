//
//  dwarf.swift
//  OpenClassRoom P3
//
//  Created by Marc-Antoine BAR on 2022-07-27.
//

class Dwarf: TypeOfCharacter {
    init () {
        let characterType = "dwarf"
        let characterMaxLifePoints = 100
        let characterHeal = false
        let characterWeapon = "axe"
        super.init(characterType: characterType, characterMaxLifePoints: characterMaxLifePoints, characterHeal: characterHeal, characterWeapon: characterWeapon)
    }
}

var dwarf = Dwarf()
