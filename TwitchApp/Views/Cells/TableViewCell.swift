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
    @IBOutlet weak var channelLabel: UILabel!
    
    var videoData: TwitchEntity.Entities? {
        didSet {
            if let videoData = videoData {
                let posterURL = URL(string: (videoData.game?.box?.medium)!)
                ImageView.kf.setImage(with: posterURL)
                titleLabel.text = "\(videoData.game?.title ?? "")"
                viewsLabel.text = "Viewers: \(videoData.viewers ?? 0)"
                channelLabel.text = "Channels: \(videoData.channels ?? 0)"
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        if let game = videoData?.game {
            CoreDataManager.shared.addGame(game)
        }
        
    }
}



