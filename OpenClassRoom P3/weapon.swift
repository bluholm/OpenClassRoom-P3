//
//  weapon.swift
//  OpenClassRoom P3
//
//  Created by Marc-Antoine BAR on 2022-07-27.
//

class Weapon {
    var weaponName: String = ""
    var weaponDamage: Int = 0
    
    init (weaponName: String, weaponDamage: Int){
        self.weaponName = weaponName
        self.weaponDamage = weaponDamage
    }
}

var sword = Weapon(weaponName: "sword", weaponDamage:10)
var axe = Weapon(weaponName: "axe", weaponDamage:20)
var wand = Weapon(weaponName: "wand", weaponDamage:20)
