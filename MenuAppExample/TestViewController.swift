//
//  TestViewController.swift
//  MenuAppExample
//
//  Created by Ignacio on 29/04/2019.
//  Copyright © 2019 Ignacio. All rights reserved.
//

import Cocoa

class TestViewController: NSViewController {
    
    @IBOutlet weak var testLabel: NSTextField! //Asociamos la etiqueta a su nombre
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}

// Actions
extension TestViewController {
    @IBAction func closePopover(_ sender: NSButton) {
        dismiss(self)
    }
    
    @IBAction func changeLabel(_ sender: NSButton) {
        
        globalVariables.sharedManager.osxMode = UserDefaults.standard.string(forKey: "AppleInterfaceStyle") ?? "Light"
        
        print("varTest (antes del cambio) = \(globalVariables.sharedManager.varTest)")
        
        globalVariables.sharedManager.varTest = 3
        
        print("varTest (despues del cambio) = \(globalVariables.sharedManager.varTest)")
        
        if (testLabel.stringValue == "Claro" || testLabel.stringValue == "Oscuro") {
            testLabel.stringValue = "TEST POPOVER"
            testLabel.textColor = NSColor(deviceRed: 0, green: 0, blue: 0, alpha: 100)
            testLabel.font = NSFont(name: testLabel.font!.fontName, size: 12)
        } else {
            if globalVariables.sharedManager.osxMode == "Light" {
                testLabel.stringValue = "Claro"
                testLabel.textColor = NSColor(deviceRed: 255, green: 0, blue: 0, alpha: 100)
                testLabel.font = NSFont(name: testLabel.font!.fontName, size: 18)
            } else {
                testLabel.stringValue = "Oscuro"
                testLabel.textColor = NSColor(deviceRed: 0, green: 0, blue: 255, alpha: 100)
                testLabel.font = NSFont(name: testLabel.font!.fontName, size: 18)
            }
        }
        
    }
}
