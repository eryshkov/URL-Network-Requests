//
//  ViewController.swift
//  URL Network Requests
//
//  Created by Evgeniy Ryshkov on 05/11/2018.
//  Copyright © 2018 Evgeniy Ryshkov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let url = URL(string: "https://itunes.apple.com/search")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let task = URLSession.shared.dataTask(with: url) { (data, responce, error) in
            if let data = data, let string = String(data: data, encoding: .utf8) {
                print(string);
            }
        }
        
        task.resume()
    }


}

