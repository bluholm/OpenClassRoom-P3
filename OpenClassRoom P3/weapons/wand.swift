//
//  wand.swift
//  OpenClassRoom P3
//
//  Created by Marc-Antoine BAR on 2022-07-27.
//

class Wand: Weapon {
    let weaponHeal = Int.random(in: 30...60)

    init () {
    let weaponName = "wand"
        let weaponDamage = Int.random(in: 10...20)

        super.init(weaponName: weaponName, weaponDamage: weaponDamage)
    }
}

var wand = Wand()
