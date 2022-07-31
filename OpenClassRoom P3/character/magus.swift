//
//  magus.swift
//  OpenClassRoom P3
//
//  Created by Marc-Antoine BAR on 2022-07-27.
//

class Magus: TypeOfCharacter {
    
    
    init () {
        let characterType = "magus"
        let characterMaxLifePoints = 70
        let characterHeal = true
        let characterWeapon = "wand"
        super.init(characterType: characterType, characterMaxLifePoints: characterMaxLifePoints, characterHeal: characterHeal, characterWeapon: characterWeapon)
    }
}

var magus = Magus()
