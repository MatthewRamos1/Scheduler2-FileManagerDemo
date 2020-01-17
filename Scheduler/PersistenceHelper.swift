//
//  PersistenceHelper.swift
//  Scheduler
//
//  Created by Matthew Ramos on 1/17/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import Foundation

enum DataPersistenceError: Error {
    case savingError(Error)
}

class PersistenceHelper {
    // CRUD
    
    private static var events = [Event]()
    private static let filename = "schedules.plist"
    static func save(item: Event) throws {
        //get url path to file event will be saved to
        let url = FileManager.pathToDocumentDirectory(filename: filename)
        //append new event
        events.append(item)
        //events array will be converted to Data
        //we will use the Data object to write it to documents directory
        do {
            let data = try PropertyListEncoder().encode(events)
            try data.write(to: url, options: .atomic)
        } catch {
            throw DataPersistenceError.savingError(error)
        }
    }
}
