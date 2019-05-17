//
//  QuotesViewController.swift
//  MenuAppExample
//
//  Created by Ignacio on 25/04/2019.
//  Copyright © 2019 Ignacio. All rights reserved.
//

import Cocoa

class QuotesViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        currentQuoteIndex = 0
    }
    
    func updateQuote() {
        textLabel.stringValue = String(describing: quotes[currentQuoteIndex])
    }

    
    @IBOutlet var textLabel: NSTextField!
    
    let quotes = Quote.all
    
    var currentQuoteIndex: Int = 0 {
        didSet {
            updateQuote()
        }
    }


}

extension QuotesViewController {
    // Storyboard instantiation
    static func freshController() -> QuotesViewController {
        //1.
        let storyboard = NSStoryboard(name: NSStoryboard.Name(/*rawValue: */"Main"), bundle: nil)
        //2.
        let identifier = NSStoryboard.SceneIdentifier(/*rawValue: */"QuotesViewController")
        //3.
        guard let viewcontroller = storyboard.instantiateController(withIdentifier: identifier) as? QuotesViewController else {
            fatalError("Why cant i find QuotesViewController? - Check Main.storyboard")
        }
        return viewcontroller
    }
}

// Actions

extension QuotesViewController {
    @IBAction func previous(_ sender: NSButton) {
        currentQuoteIndex = (currentQuoteIndex - 1 + quotes.count) % quotes.count
    }
    
    @IBAction func next(_ sender: NSButton) {
        currentQuoteIndex = (currentQuoteIndex + 1) % quotes.count
    }
    
    @IBAction func quit(_ sender: NSButton) {
        NSApplication.shared.terminate(sender)
    }

    @IBAction func closeMainWindow(_ sender: NSButton) { //Cierra la ventana principal
       self.view.window!.close()
        
        let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
        let identifier = NSStoryboard.SceneIdentifier("TestViewController")
        guard let viewController = storyboard.instantiateController(withIdentifier: identifier) as? TestViewController else {
            fatalError("Error no aparece TestViewController")
        }
        
        let myWindow = NSWindow(contentViewController: viewController)
        let controller = NSWindowController(window: myWindow)
        
        controller.showWindow(self)
    }
    
    @IBAction func closeCurrent (_sender: NSButton) { //Cierra la ventana actual
        self.view.window!.close()
    }
}

