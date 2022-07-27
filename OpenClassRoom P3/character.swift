//
//  character.swift
//  OpenClassRoom P3
//
//  Created by Marc-Antoine BAR on 2022-07-27.


class TypeOfCharacter {
    var characterType: String = ""
    var characterMaxLifePoints: Int = 0
    var characterHeal: Bool = false
    var characterWeapon: String = ""
    
    init(characterType: String, characterMaxLifePoints: Int, characterHeal: Bool,characterWeapon: String){
        self.characterType = characterType
        self.characterMaxLifePoints = characterMaxLifePoints
        self.characterHeal = characterHeal
        self.characterWeapon = characterWeapon
    }
}

var warrior = TypeOfCharacter(characterType: "warrior", characterMaxLifePoints: 150, characterHeal: false,characterWeapon: "sword")
var magus = TypeOfCharacter(characterType: "magus", characterMaxLifePoints: 70, characterHeal: true,characterWeapon: "wand")
var dwarf = TypeOfCharacter(characterType: "dwarf", characterMaxLifePoints: 100, characterHeal: false,characterWeapon: "axe")
