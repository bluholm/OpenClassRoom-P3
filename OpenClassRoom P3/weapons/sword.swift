//
//  sword.swift
//  OpenClassRoom P3
//
//  Created by Marc-Antoine BAR on 2022-07-27.
//

/// Class sword who is depending of weapon
class Sword: Weapon {

    init () {
    let weaponName = "sword"
        let weaponDamage = Int.random(in: 30...40)
        super.init(weaponName: weaponName, weaponDamage: weaponDamage)
    }
}

var sword = Sword()
