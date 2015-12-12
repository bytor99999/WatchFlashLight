//
//  ComplicationController.swift
//  WatchLightFlash WatchKit Extension
//
//  Created by Mark Spritzler on 8/19/15.
//  Copyright © 2015 Perfect World Programming. All rights reserved.
//

import ClockKit

let flashlightImage = UIImage(named: "flashlight")!
let flashLightImageProvider = CLKImageProvider(onePieceImage: flashlightImage)

class ComplicationController: NSObject, CLKComplicationDataSource {
    
    // MARK: - Timeline Configuration
    
    func getSupportedTimeTravelDirectionsForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationTimeTravelDirections) -> Void) {
        handler([.None])
    }
    
    func getTimelineStartDateForComplication(complication: CLKComplication, withHandler handler: (NSDate?) -> Void) {
        handler(nil)
    }
    
    func getTimelineEndDateForComplication(complication: CLKComplication, withHandler handler: (NSDate?) -> Void) {
        handler(nil)
    }
    
    func getPrivacyBehaviorForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationPrivacyBehavior) -> Void) {
        handler(.ShowOnLockScreen)
    }
    
    // MARK: - Timeline Population
    
    func getCurrentTimelineEntryForComplication(complication: CLKComplication, withHandler handler: ((CLKComplicationTimelineEntry?) -> Void)) {
        // Call the handler with the current timeline entry
        let entry = CLKComplicationTimelineEntry()
        switch complication.family {
        case CLKComplicationFamily.CircularSmall :
            let template = CLKComplicationTemplateCircularSmallSimpleImage()
            template.imageProvider = flashLightImageProvider
            entry.complicationTemplate = template
            
        case CLKComplicationFamily.ModularSmall :
            let template = CLKComplicationTemplateModularSmallSimpleImage()
            template.imageProvider = flashLightImageProvider
            entry.complicationTemplate = template
            
        case CLKComplicationFamily.UtilitarianLarge :
            let template = CLKComplicationTemplateUtilitarianLargeFlat()
            template.imageProvider = flashLightImageProvider
            entry.complicationTemplate = template
            
        default:
            let template = CLKComplicationTemplateUtilitarianSmallFlat()
            template.imageProvider = flashLightImageProvider
            entry.complicationTemplate = template
            
        }
        entry.date = NSDate()
        handler(entry)
        
    }
    
    func getTimelineEntriesForComplication(complication: CLKComplication, beforeDate date: NSDate, limit: Int, withHandler handler: (([CLKComplicationTimelineEntry]?) -> Void)) {
        // Call the handler with the timeline entries prior to the given date
        handler(nil)
    }
    
    func getTimelineEntriesForComplication(complication: CLKComplication, afterDate date: NSDate, limit: Int, withHandler handler: (([CLKComplicationTimelineEntry]?) -> Void)) {
        // Call the handler with the timeline entries after to the given date
        handler(nil)
    }
    
    // MARK: - Update Scheduling
    
    func getNextRequestedUpdateDateWithHandler(handler: (NSDate?) -> Void) {
        // Call the handler with the date when you would next like to be given the opportunity to update your complication content
        handler(nil);
    }
    
    // MARK: - Placeholder Templates
    
    func getPlaceholderTemplateForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationTemplate?) -> Void) {
        
        switch complication.family {
            
        case CLKComplicationFamily.CircularSmall :
            let template = CLKComplicationTemplateCircularSmallSimpleImage()
            template.imageProvider = flashLightImageProvider
            handler(template)
            
        case CLKComplicationFamily.ModularSmall :
            let template = CLKComplicationTemplateModularSmallSimpleImage()
            template.imageProvider = flashLightImageProvider
            handler(template)
            
        case CLKComplicationFamily.UtilitarianLarge :
            let template = CLKComplicationTemplateUtilitarianLargeFlat()
            template.imageProvider = flashLightImageProvider
            template.textProvider = CLKSimpleTextProvider(text: "Flash Light")
            handler(template)
            
        default:
            let template = CLKComplicationTemplateUtilitarianSmallFlat()
            template.imageProvider = flashLightImageProvider
            template.textProvider = CLKSimpleTextProvider(text: "Flash Light")
            handler(template)
            
        }
        
    }

    
}
