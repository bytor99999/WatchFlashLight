//
//  GlanceController.swift
//  WatchLightFlash WatchKit Extension
//
//  Created by Mark Spritzler on 8/19/15.
//  Copyright © 2015 Perfect World Programming. All rights reserved.
//

import WatchKit
import Foundation


class GlanceController: WKInterfaceController {

    let colorHolder = ColorHolder()
    
    @IBOutlet var glanceFlashLightGroup: WKInterfaceGroup!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        //glanceFlashLightGroup.setBackgroundColor(colorHolder.getUIColorForCurrentColor())
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        glanceFlashLightGroup.setBackgroundColor(colorHolder.getUIColorForCurrentColor())
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
