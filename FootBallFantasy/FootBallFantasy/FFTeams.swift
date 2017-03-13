//
//  FFTeams.swift
//  FootBallFantasy
//
//  Created by Abhishek Thapliyal on 3/12/17.
//  Copyright © 2017 Abhishek Thapliyal. All rights reserved.
//

import UIKit

class FFTeams: NSObject {
    
    public var dbid : NSNumber?
    public var showLeagueTables: Bool?
    public var name : NSString?
    public var defaultHomeVenue : NSDictionary?
    
    public var showAssistStats: Bool?
    public var showCardStats: Bool?
    public var isNational: Bool?
    public var showGoalStats: Bool?
    public var shirtUrl : NSString?
    
    public var shortName : NSString?
    public var shortCode : NSString?
    
    override init() {
        
    }
    
    /********************************************************
     CUSTOM INTIALIZATION : INIT WITH DICTIONARY
     ********************************************************/
    
    init(dictionary : [String:Any]) {
        super.init()
        self.parseDictionary(dictionary: dictionary)
    }
    
    /********************************************************
     PARSING DICTIONARY : MAPPING DATA TO CLASS PROPERTIES
     ********************************************************/
    
    public func parseDictionary(dictionary : [String:Any]) {
        
        self.dbid = dictionary["identifier"] as? NSNumber
        
        self.showLeagueTables = (dictionary["league_identifier"] as? NSNumber)?.boolValue
        
        self.name = dictionary["name"] as? NSString
        
        self.defaultHomeVenue = dictionary["defaultHomeVenue"] as? NSDictionary
        
        self.showAssistStats = (dictionary["showAssistStats"] as? NSNumber)?.boolValue
        
        self.showCardStats = (dictionary["showCardStats"] as? NSNumber)?.boolValue
        
        self.isNational = (dictionary["isNational"] as? NSNumber)?.boolValue
        
        self.showGoalStats = (dictionary["showGoalStats"] as? NSNumber)?.boolValue
        
        self.shirtUrl = dictionary["shirtUrl"] as? NSString
        
        self.shortName = dictionary["shortName"] as? NSString
        
        self.shortCode = dictionary["shortCode"] as? NSString
        
    }
    
}
