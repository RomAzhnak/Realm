//
//  ToDoRepository.swift
//  ToDo_Realm
//
//  Created by Fusion Tech on 05.08.2024.
//

import Foundation
import RealmSwift

protocol ToDoRepository {
    func getToDoList() -> [ToDoDTO]
    func saveToDoList(_ data: [ToDoDTO])
    func clearToDoList()
    func saveToDo(_ data: ToDoDTO) 
}

final class ToDoRepositoryImpl: ToDoRepository {
    private let storage: StorageService
    
    init(storage: StorageService = StorageService()) {
        self.storage = storage
    }
    
    func getToDoList() -> [ToDoDTO] {
        let data = storage.fetch(by: ToDo.self)
        return data.map(ToDoDTO.init)
    }
    
    func saveToDoList(_ data: [ToDoDTO]) {
        let objects = data.map(ToDo.init)
        try? storage.saveOrUpdateAllObjects(objects: objects)
    }
    
    func clearToDoList() {
        try? storage.deleteAll()
    }
    
    func saveToDo(_ data: ToDoDTO) {
        let object = ToDo(data)
        try? storage.saveOrUpdateObject(object: object)
    }
}
