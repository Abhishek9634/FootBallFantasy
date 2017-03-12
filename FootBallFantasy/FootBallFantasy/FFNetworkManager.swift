//
//  FFNetworkManager.swift
//  ScoreBoard
//
//  Created by Abhishek Thapliyal on 3/11/17.
//  Copyright © 2017 Abhishek Thapliyal. All rights reserved.
//

import UIKit

enum REQUEST_URL : NSString {
    case BASE_URL = "http://soccer.sportsopendata.net"
    case AVAILABLE_SEASON = "/v1/leagues/serie-a/seasons"
}

class FFNetworkManager: NSObject {
    
    public var responseArray : NSMutableArray?
    public var seasonList : NSArray?
    
    
    //====================================================================================================================================
    // GET PLAYERS METHOD
    //====================================================================================================================================
    
    public func getAvailableSeasons(sortType:NSString, completion : @escaping (_ articleArray:NSArray?, _ error:NSError?) -> Void) {
        
        let URLString : String = "http://api.football-data.org/v1/competitions/?season=2015"
//        let URLString : String = "http://soccer.sportsopendata.net/v1/leagues/serie-a/seasons"
        let request : NSMutableURLRequest = FFHTTPRequest.getServerRequest(urlString: URLString, paramString: nil)
        FFHTTPResponse.responseWithRequest(request: request, requestTitle: "FETCH_SEASONS", completion: { (json, error) in
            
            print("ERROR(IF-ANY) :: \(error?.localizedDescription)")
            self.responseArray = NSMutableArray()
            if (error == nil)
            {
//                let dictionary : [String:Any] = json as! [String : Any]
//                self.seasonList = NSArray(array: dictionary["seasons"] as! NSArray)
//                for seasonDict in self.seasonList as! [[String:Any]] {
//                
//                    let player = FFAvailableSeason(dictionary: seasonDict)
//                    self.responseArray?.add(player)
//                }
            }
            completion(self.responseArray!, error)
        })
    }
}
