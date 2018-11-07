//
//  ViewController.swift
//  URL Network Requests
//
//  Created by Evgeniy Ryshkov on 05/11/2018.
//  Copyright © 2018 Evgeniy Ryshkov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let baseURL = URL(string: "https://itunes.apple.com/search")!
    
    let query = [
        "term":"lana",
        "country":"ru",
        "callback":"",
        "limit":"3",
        "lang":"ru_ru",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let task = URLSession.shared.dataTask(with: baseURL.withQueries(query)!) { (data, responce, error) in
            if let data = data, let string = String(data: data, encoding: .utf8) {
                print(string);
            }
        }
        
        task.resume()
    }


}

