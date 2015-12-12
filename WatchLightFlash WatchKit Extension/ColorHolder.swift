//
//  ColorHolder.swift
//  WatchLightFlash WatchKit Extension
//
//  Created by Mark Spritzler on 8/19/15.
//  Copyright © 2015 Perfect World Programming. All rights reserved.
//

import UIKit

class ColorHolder: NSObject {
    
    override init() {
    }
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    let allTheColors = ["White": UIColor.whiteColor(),
        "Gray": UIColor.lightGrayColor(),
        "Blue": UIColor.blueColor(),
        "Yellow": UIColor.yellowColor(),
        "Red": UIColor.redColor(),
        "Purple": UIColor.purpleColor(),
        "Orange": UIColor.orangeColor(),
        "Magenta": UIColor.magentaColor(),
        "Cyan": UIColor.cyanColor(),
        "Green": UIColor.greenColor()]
    
    let currentColorKey = "currentColor"
    
    let whiteTextColors = ["Blue", "Purple", "Orange", "Magenta", "Red"]
    let colorOrder = ["White","Gray","Yellow","Orange","Cyan","Red","Magenta","Green","Blue","Purple"]
    
    final func saveSettings(saveColor: String) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(saveColor, forKey: "currentColor")
        defaults.synchronize()
    }
    
    final func getUIColorForCurrentColor() -> UIColor! {
        let currentColor = defaults.stringForKey(currentColorKey) ?? "White"
        return allTheColors[currentColor]
    }
    
    final func getUIColorForColor(colorKey: String!) -> UIColor! {
        return allTheColors[colorKey]
    }
}
