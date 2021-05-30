//
//  ViewController.swift
//  TwitchApp
//
//  Created by Kalbek Saduakassov on 28.05.2021.
//

import UIKit
import SwiftTwitch
import Alamofire

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var videos = [TwitchEntity.Entities]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        print(videos.count)
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        let headers: HTTPHeaders = [
            "Accept": "application/vnd.twitchtv.v5+json",
            "Client-ID": "hexqp402sjranlfhpteutjlmabyfar"
        ]

        AF.request("https://api.twitch.tv/kraken/games/top", headers: headers).responseJSON { response in
            switch response.result {
            case .success:
                if let data = response.data {
                    do {
                        let videosJSON = try JSONDecoder().decode(TwitchEntity.self, from: data)
                        self.videos += videosJSON.top!
                    } catch {
                        print(error)
                    }
                }
            case .failure:
                print("fail!")
            }
        }
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(videos.count)
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
        cell.videoData = videos[indexPath.row]
        
        return cell
    }
    
    
}

