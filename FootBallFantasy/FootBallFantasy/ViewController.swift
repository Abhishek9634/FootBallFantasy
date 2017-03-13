//
//  ViewController.swift
//  FootBallFantasy
//
//  Created by Abhishek Thapliyal on 3/12/17.
//  Copyright © 2017 Abhishek Thapliyal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        FFNetworkManager().getAvailableSeasons() { (array, error) in
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

