//
//  CoreDataManager.swift
//  TwitchApp
//
//  Created by Kalbek Saduakassov on 30.05.2021.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    
    private lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "TwitchApp")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    private init() {}
    
    func save() {
        let context = persistentContainer.viewContext
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
    
    func addGame(_ game: TwitchEntity.Entities.Game) {
        let context = persistentContainer.viewContext
        context.perform {
            let newGame = CoreDataEntity(context: context)
            newGame.id = Int64(game.id)
            newGame.title = game.title
        }
        save()
    }
    
    func findGame(with id: Int) -> CoreDataEntity? {
        let context = persistentContainer.viewContext
        let requestResult: NSFetchRequest<CoreDataEntity> = CoreDataEntity.fetchRequest()
        requestResult.predicate = NSPredicate(format: "id == %d", id)
        do {
            let games = try context.fetch(requestResult)
            if games.count > 0 {
                assert(games.count == 1, "Dubplicate found in DB!")
                return games[0]
            }
        } catch {
            print(error)
        }
        return nil
    }

//    
//    func allGames() -> [TwitchEntity.Entities.Game?] {
//        let context = persistentContainer.viewContext
//        let requestResult: NSFetchRequest<CoreDataEntity> = CoreDataEntity.fetchRequest()
//        let games = try? context.fetch(requestResult)
//        return games?.map {( TwitchEntity.Entities.Game?(game: $0) )} ?? []
//    }
    
    
}

