//
//  wand.swift
//  OpenClassRoom P3
//
//  Created by Marc-Antoine BAR on 2022-07-27.
//

class Wand: Weapon {
    
    init () {
    let weaponName = "wand"
    let weaponDamage = 30
        super.init(weaponName: weaponName, weaponDamage: weaponDamage)
    }
}

var wand = Wand()
