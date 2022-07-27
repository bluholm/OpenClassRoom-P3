//
//  view.swift
//  OpenClassRoom P3
//
//  Created by Marc-Antoine BAR on 2022-07-27.
//

class ViewTerminal {
    func clearScreen () {
        print("\u{001B}[2J")
    }
    
    func pressAKeyToContinue () {
        if let _ = readLine() {
            print ("press a key to continue ")
        }
    }
    
}

var terminal = ViewTerminal()
