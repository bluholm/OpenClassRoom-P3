//
//  view.swift
//  OpenClassRoom P3
//
//  Created by Marc-Antoine BAR on 2022-07-27.
//

/// This class is used to interface between the user and the terminal.
class ViewTerminal {
    
    /// clear and reset the terminal
    func clearTerminal () {
        for _ in 0...50{
            print("\n")
        }
    }
    
    /// Allow useer to push a key to continue
    func pressAKeyToContinue () {
        print(message.pressAkeyToContinue)
        if let _ = readLine() {
        }
    }
    
}

var terminal = ViewTerminal()
