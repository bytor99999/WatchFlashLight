//
//  ColorPickerInterfaceController.swift
//  WatchLightFlash WatchKit Extension
//
//  Created by Mark Spritzler on 8/18/15.
//  Copyright © 2015 Perfect World Programming. All rights reserved.
//

import WatchKit
import Foundation


class ColorPickerInterfaceController: WKInterfaceController {
    
    
    @IBOutlet var colorPickerTable: WKInterfaceTable!
    let colorHolder = ColorHolder()
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        colorPickerTable.setNumberOfRows(colorHolder.colorOrder.count, withRowType: "rowForColor")
        
        for colorIndex in 0...(colorHolder.allTheColors.count-1) {
            let tableRow = colorPickerTable.rowControllerAtIndex(colorIndex) as! ColorRow
            let colorKey = colorHolder.colorOrder[colorIndex]
            tableRow.colorGroup.setBackgroundColor(colorHolder.allTheColors[colorKey])
            tableRow.colorRowLabel.setText(colorKey)
            if colorHolder.whiteTextColors.contains(colorKey) {
                tableRow.colorRowLabel.setTextColor(UIColor.whiteColor())
            } else {
                tableRow.colorRowLabel.setTextColor(UIColor.blackColor())
            }
        }
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        let keyValue = colorHolder.colorOrder[rowIndex]
        colorHolder.saveSettings(keyValue)
        popController()
    }
}
