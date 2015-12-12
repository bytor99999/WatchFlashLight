//
//  InterfaceController.swift
//  WatchLightFlash WatchKit Extension
//
//  Created by Mark Spritzler on 8/19/15.
//  Copyright © 2015 Perfect World Programming. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {
    
    @IBOutlet var flashlightButton: WKInterfaceButton!
    
    let colorHolder = ColorHolder()
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        flashlightButton.setBackgroundColor(colorHolder.getUIColorForCurrentColor())
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        flashlightButton.setBackgroundColor(colorHolder.getUIColorForCurrentColor())
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
