//
//  FFHTTPRequest.swift
//  ScoreBoard
//
//  Created by Abhishek Thapliyal on 3/11/17.
//  Copyright © 2017 Abhishek Thapliyal. All rights reserved.
//

import UIKit

var AUTH_KEY : NSString = "00bb66dbb7a84e179b7307cc5ef3c79d"

class FFHTTPRequest: NSObject {

    //====================================================================================================================================
    // POST REQUEST METHOD
    //====================================================================================================================================
    
    class func postServerRequest(urlString:String, paramString:String?) -> NSMutableURLRequest {
        
        let requestURL = URL(string:urlString)!
        let request = NSMutableURLRequest(url:requestURL)
        request.httpMethod = "POST"
        self.setHeader(request: request)
        request.httpBody = paramString?.data(using: String.Encoding.utf8)
        
        return request
    }
    
    //====================================================================================================================================
    // GET REQUEST METHOD
    //====================================================================================================================================
    
    class func getServerRequest(urlString:String, paramString:String?) -> NSMutableURLRequest {
        
        var URLString : String = urlString
        if paramString != nil {
            URLString = String(format:"%@?%@", urlString, paramString!)
        }
        let requestURL = URL(string:URLString)!
        let request = NSMutableURLRequest(url:requestURL)
        self.setHeader(request: request)
        request.httpMethod = "GET"
        
        return request
    }
    
    class func setHeader(request: NSMutableURLRequest) {
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(AUTH_KEY as String, forHTTPHeaderField: "x-crowdscores-api-key")
    }
    
}
