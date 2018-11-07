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
    
    var artists = [Artist]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func parseJson(_ sender: UIBarButtonItem) {
        if let urlArtist = baseURL.withQueries(query) {
            if let data = try? Data(contentsOf: urlArtist) {
                
                let decoder = JSONDecoder()

                do {
                    let jsonArtists = try decoder.decode(Artists.self, from: data)
                    artists = jsonArtists.results
                    print(artists)
                }catch let error {
                    print(error)
                }
            }
        }
        
        
    }

}

