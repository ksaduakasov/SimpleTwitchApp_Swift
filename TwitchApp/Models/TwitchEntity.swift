//
//  TwitchModel.swift
//  TwitchApp
//
//  Created by Kalbek Saduakassov on 29.05.2021.
//

import Foundation

struct TwitchEntity: Decodable {
    let top: [Entities]?
    
    struct Entities: Decodable {
        let game: Game?
        let viewers: Int?
        let channels: Int?
        
        struct Game: Decodable {
            let id: Int
            let title: String
            let box: Box?
            
            enum CodingKeys: String, CodingKey {
                case id = "_id"
                case title = "name"
                case box = "box"
            }
            
            init(_ game: CoreDataEntity) {
                self.id = Int(game.id)
                self.title = game.title ?? ""
                self.box = nil
            }
            
            struct Box: Decodable {
                let large: String?
                let medium: String?
                let small: String?
                let template: String?
            }
            
            
        }
    }
    
}
