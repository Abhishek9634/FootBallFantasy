//
//  FFTeamPlayer.swift
//  FootBallFantasy
//
//  Created by Abhishek Thapliyal on 3/13/17.
//  Copyright © 2017 Abhishek Thapliyal. All rights reserved.
//

import UIKit

class FFTeamPlayer: NSObject {

    public var pl_position : NSString?
    public var pl_shortName : NSString?
    public var pl_number : NSNumber?
    public var pl_name : NSString?
    public var pl_dbid : NSNumber?
    
    override init() {
        
    }
    
    /********************************************************
     CUSTOM INTIALIZATION : INIT WITH DICTIONARY
     ********************************************************/
    
    init(dictionary : [String:Any]) {
        super.init()
        self.parseDictionary(player: dictionary)
    }
    
    /********************************************************
     PARSING DICTIONARY : MAPPING DATA TO CLASS PROPERTIES
     ********************************************************/
    
    public func parseDictionary(player : [String:Any]) {
        
        self.pl_position = player["position"] as? NSString
        self.pl_shortName = player["shortName"] as? NSString
        self.pl_number = player["number"] as? NSNumber
        self.pl_name = player["name"] as? NSString
        self.pl_dbid = player["dbid"] as? NSNumber
    }
    
}
