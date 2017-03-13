//
//  FFNetworkManager.swift
//  ScoreBoard
//
//  Created by Abhishek Thapliyal on 3/11/17.
//  Copyright © 2017 Abhishek Thapliyal. All rights reserved.
//

import UIKit

enum REQUEST_URL : NSString {
    case BASE_URL = "https://api.crowdscores.com/v1"
    case TEAMS = "/teams"
}

class FFNetworkManager: NSObject {
    
    public var responseArray : NSMutableArray?
    public var teamList : NSArray?
    
    
    //====================================================================================================================================
    // GET PLAYERS METHOD
    //====================================================================================================================================
    
    public func getAvailableSeasons(completion : @escaping (_ articleArray:NSArray?, _ error:NSError?) -> Void) {
        
        let URLString : String = NSString(format: "%@%@", REQUEST_URL.BASE_URL.rawValue, REQUEST_URL.TEAMS.rawValue) as String
        
        let request : NSMutableURLRequest = FFHTTPRequest.getServerRequest(urlString: URLString, paramString: nil)
        FFHTTPResponse.responseWithRequest(request: request, requestTitle: "FETCH_SEASONS", completion: { (json, error) in
            
            print("ERROR(IF-ANY) :: \(error?.localizedDescription)")
            self.responseArray = NSMutableArray()
            if (error == nil)
            {
                let teamList : [Any] = json as! [Any]
                self.teamList = NSArray(array: teamList as NSArray)
                for teamObject in self.teamList as! [[String:Any]] {
                
                    let team = FFTeams(dictionary: teamObject)
                    print("TEAM_NAME : \(team.name!)")
                    self.responseArray?.add(team)
                }
            }
            completion(self.responseArray!, error)
        })
    }
}
