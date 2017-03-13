//
//  FFNetworkManager.swift
//  ScoreBoard
//
//  Created by Abhishek Thapliyal on 3/11/17.
//  Copyright © 2017 Abhishek Thapliyal. All rights reserved.
//

import UIKit

var BASE_URL: NSString = "https://api.crowdscores.com/v1"
var TEAMS: NSString  = "/teams"

class FFNetworkManager: NSObject {
    
    public var responseArray : NSMutableArray?
    public var teamList : NSArray?
    
    
    //====================================================================================================================================
    // FETCH ALL TEAMS
    //====================================================================================================================================
    
    public func getTeams(completion : @escaping (_ articleArray:NSArray?, _ error:NSError?) -> Void) {
        
        let URLString = NSString(format: "%@%@", BASE_URL, TEAMS) as String
        
        let request : NSMutableURLRequest = FFHTTPRequest.getServerRequest(urlString: URLString, paramString: nil)
        FFHTTPResponse.responseWithRequest(request: request, requestTitle: "FETCH_TEAMS", completion: { (json, error) in
            
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
    
    //====================================================================================================================================
    // FETCH TEAM DETAILS
    //====================================================================================================================================
    
    public func getTeamDetails(teamId: NSNumber, completion : @escaping ( _ teamDetail: FFTeams?, _ playerList: NSMutableArray?, _ error: NSError?) -> Void) {
        
        let URLString = NSString(format: "%@%@/%@", BASE_URL, TEAMS, teamId) as String
        
        let request : NSMutableURLRequest = FFHTTPRequest.getServerRequest(urlString: URLString, paramString: nil)
        FFHTTPResponse.responseWithRequest(request: request, requestTitle: "FETCH_TEAM_PLAYER", completion: { (json, error) in
            
            var teamDetail : FFTeams? = nil
            let playersArray = NSMutableArray()
            
            print("ERROR(IF-ANY) :: \(error?.localizedDescription)")
            if (error == nil)
            {
                let teamDict : [String:Any] = json as! [String:Any]
                teamDetail = FFTeams(dictionary: teamDict)
                let playersList = teamDict["players"] as! [[String:Any]]
                
                for player in playersList {
                    
                    let teamPlayer = FFTeamPlayer(dictionary: player)
                    print("XX_NAME \(teamPlayer.pl_name!)")
                    playersArray.add(teamPlayer)
                }
            }
            
            completion(teamDetail, playersArray, error)
        })
    }
}
