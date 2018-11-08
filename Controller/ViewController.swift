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

    func parseJSONVar_1() {
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
    
    func pasreJSONVar_2() {
        let task = URLSession.shared.dataTask(with: baseURL.withQueries(query)!) { (data, responce, error) in
            if let data = data, let string = String(data: data, encoding: .utf8) {
//                print(string);
                
                let jsonDecoder = JSONDecoder()
                do {
                    let jsonArtists = try jsonDecoder.decode(Artists.self, from: data)
                    self.artists = jsonArtists.results
//                    DispatchQueue.main.async {
////                        self.tableView.reloadData()
//                    }
                    print(self.artists)
                }catch let error {
                    print(error)
                }
            }
        }
        
        task.resume()
    }
    
    @IBAction func parseJsonButtonTapped(_ sender: UIBarButtonItem) {
        pasreJSONVar_2()
        
    }

}

