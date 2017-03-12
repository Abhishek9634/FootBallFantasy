//
//  FFAvailableSeason.swift
//  FootBallFantasy
//
//  Created by Abhishek Thapliyal on 3/12/17.
//  Copyright © 2017 Abhishek Thapliyal. All rights reserved.
//

import UIKit

class FFAvailableSeason: NSObject {
    
    public var identifier : NSString?
    public var league_identifier : NSString?
    public var name : NSString?
    public var season_end : NSString?
    public var season_slug : NSString?
    public var season_start : NSString?
    
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
        
        self.identifier = dictionary["identifier"] as? NSString
        self.league_identifier = dictionary["league_identifier"] as? NSString
        self.name = dictionary["name"] as? NSString
        self.season_end = dictionary["season_end"] as? NSString
        self.season_slug = dictionary["season_slug"] as? NSString
        self.name = dictionary["name"] as? NSString
        self.season_start = dictionary["season_start"] as? NSString
    }
    
}
