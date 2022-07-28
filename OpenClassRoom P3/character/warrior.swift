//
//  warrior.swift
//  OpenClassRoom P3
//
//  Created by Marc-Antoine BAR on 2022-07-27.
//
class Warrior: TypeOfCharacter {
    init () {
        let characterType = "warrior"
        let characterMaxLifePoints = 150
        let characterHeal = false
        let characterWeapon = "sword"
        super.init(characterType: characterType, characterMaxLifePoints: characterMaxLifePoints, characterHeal: characterHeal, characterWeapon: characterWeapon)
    }
}

var warrior = Warrior()
