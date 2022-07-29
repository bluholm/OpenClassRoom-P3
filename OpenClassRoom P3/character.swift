//
//  character.swift
//  OpenClassRoom P3
//
//  Created by Marc-Antoine BAR on 2022-07-27.


class TypeOfCharacter {
    var characterType: String
    var characterMaxLifePoints: Int
    var characterHeal: Bool
    var characterWeapon: String
    
    init(characterType: String, characterMaxLifePoints: Int, characterHeal: Bool,characterWeapon: String){
        self.characterType = characterType
        self.characterMaxLifePoints = characterMaxLifePoints
        self.characterHeal = characterHeal
        self.characterWeapon = characterWeapon
    }
}
