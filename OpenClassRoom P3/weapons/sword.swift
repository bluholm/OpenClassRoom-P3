//
//  sword.swift
//  OpenClassRoom P3
//
//  Created by Marc-Antoine BAR on 2022-07-27.
//

class Sword: Weapon {
    
    init () {
    let weaponName = "sword"
    let weaponDamage = 20
        super.init(weaponName: weaponName, weaponDamage: weaponDamage)
    }
}

var sword = Sword()
