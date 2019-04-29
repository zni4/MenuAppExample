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
        if testLabel.stringValue == "Cambio" {
            testLabel.stringValue = "TEST POPOVER"
            testLabel.textColor = NSColor(deviceRed: 0, green: 0, blue: 0, alpha: 100)
        } else {
            testLabel.stringValue = "Cambio"
            testLabel.textColor = NSColor(deviceRed: 255, green: 255, blue: 0, alpha: 100)
        }
        
    }
}
