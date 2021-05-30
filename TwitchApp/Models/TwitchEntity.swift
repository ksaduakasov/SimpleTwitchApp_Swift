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
            let id: Int?
            let title: String?
            let box: Box?
            
            struct Box: Decodable {
                let large: String?
                let medium: String?
                let small: String?
                let template: String?
            }
        }
    }
    
}
