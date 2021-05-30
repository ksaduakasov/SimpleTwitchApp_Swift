//
//  TableViewCell.swift
//  TwitchApp
//
//  Created by Kalbek Saduakassov on 28.05.2021.
//

import UIKit
import Kingfisher

class TableViewCell: UITableViewCell {
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var viewsLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    
    var videoData: TwitchEntity.Entities? {
        didSet {
            if let videoData = videoData {
                let posterURL = URL(string: (videoData.game?.box?.medium)!)
                ImageView.kf.setImage(with: posterURL)
                titleLabel.text = "\(videoData.game?.title ?? "")"
                viewsLabel.text = "\(videoData.viewers ?? 0)"
                userLabel.text = "\(videoData.channels ?? 0)"
            }
        }
    }

    
}
