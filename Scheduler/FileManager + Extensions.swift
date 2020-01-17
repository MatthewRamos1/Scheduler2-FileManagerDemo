//
//  FileManager + Extensions.swift
//  Scheduler
//
//  Created by Matthew Ramos on 1/17/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import Foundation

extension FileManager {
    static func getDocumentsDirectory() -> URL {
       return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    static func pathToDocumentDirectory(filename: String) -> URL {
        return getDocumentsDirectory().appendingPathComponent(filename)
    }
}
