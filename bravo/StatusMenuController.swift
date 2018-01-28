//
//  StatusMenuController.swift
//  bravo
//
//  Created by Brian Toal on 1/27/18.
//  Copyright © 2018 Brian Toal. All rights reserved.
//

import Cocoa

class StatusMenuController: NSObject {
    
    @IBOutlet weak var statusMenu: NSMenu!
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    
    
    override func awakeFromNib() {
        // Insert code here to initialize your application
        statusItem.title = "Bravo"
        statusItem.menu = statusMenu
        
        
        
        let icon = NSImage(named: NSImage.Name(rawValue : "statusIcon"))
        statusItem.image = icon
        statusItem.menu = statusMenu
    }
    
    @IBAction func quitClicked(_ sender: Any) {
        NSApplication.shared.terminate(self)
    }
}
