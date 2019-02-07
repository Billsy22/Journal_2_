//
//  EntryController.swift
//  Journal_2_
//
//  Created by Taylor Bills on 2/7/19.
//  Copyright © 2019 Taylor Bills. All rights reserved.
//

import Foundation

class EntryController {
    
    // MARK: -  Properties
    var entries: [Entry] = []
    static let shared = EntryController()
    
    
    // MARK: -  Initializer
    init() {
        loadFromPersistentStorage()
    }
    // MARK: -  CRUD
    func addNewEntry(title: String, body: String) {
        let entry = Entry(title: title, body: body)
        self.entries.insert(entry, at: 0)
    }
    
    // MARK: -  Persistence
    func fileURL() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = paths[0]
        let fileName = "journal_2_.json"
        let url = documentDirectory.appendingPathComponent(fileName)
        return url
    }
    
    // Save Files
    func saveToPersistence() {
        let jsonEncoder = JSONEncoder()
        do {
            let data = try jsonEncoder.encode(entries)
            try data.write(to: fileURL())
        } catch let error {
            print("Error saving to disk: \(error.localizedDescription)")
        }
    }
    
    // Load Files
    func loadFromPersistentStorage() {
        let jsonDecoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: fileURL())
            let loadedEntries = try jsonDecoder.decode([Entry].self, from: data)
            self.entries = loadedEntries
        } catch let error {
            print("Error loading from disk \(error.localizedDescription)")
        }
    }
}
