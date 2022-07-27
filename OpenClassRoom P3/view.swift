//
//  view.swift
//  OpenClassRoom P3
//
//  Created by Marc-Antoine BAR on 2022-07-27.
//

class ViewTerminal {
    func clearTerminal () {
        for _ in 0...50{
            print("\n")
        }
    }
    
    func pressAKeyToContinue () {
        if let _ = readLine() {
            print ("press a key to continue ")
        }
    }
    
}

var terminal = ViewTerminal()
