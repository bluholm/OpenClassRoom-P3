//
//  axe.swift
//  OpenClassRoom P3
//
//  Created by Marc-Antoine BAR on 2022-07-27.
//

class Axe: Weapon {

    init () {
    let weaponName = "axe"
        let weaponDamage = Int.random(in: 40...70)
        super.init(weaponName: weaponName, weaponDamage: weaponDamage)
    }
}

var axe = Axe()
