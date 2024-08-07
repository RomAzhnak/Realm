//
//  ToDo.swift
//  ToDo_Realm
//
//  Created by Fusion Tech on 05.08.2024.
//

import Foundation
import RealmSwift

final class ToDo: Object {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String
    @Persisted var details: String
    @Persisted var date: Date
    @Persisted var priority: Int = 2
//    @Persisted var comments: List<Comment>
    
    convenience init(
    id: ObjectId,
    name: String,
    details: String,
    date: Date,
    priority: Int
    ) {
        self.init()
        self.id = id
        self.name = name
        self.details = details
        self.date = date
        self.priority = priority
    }
}

struct ToDoDTO: Identifiable {
    var id: ObjectId
    var name: String
    var details: String
    var date: Date
    var priority: Int
//    var comments: [CommentDTO]
}

extension ToDo {
    convenience init(_ dto: ToDoDTO) {
        self.init()
        id = dto.id
        name = dto.name
        details = dto.details
        date = dto.date
        priority = dto.priority
//        comments = convertArrayToList(dto.comments)
    }
}

//func convertArrayToList(_ comments: [CommentDTO]) -> List<Comment> {
//    let list = List<Comment>()
//    list.append(objectsIn: comments)
//    return list
//}

extension ToDoDTO {
    init(object: ToDo) {
        id = object.id
        name = object.name
        details = object.details
        date = object.date
        priority = object.priority
//        comments = Array(object.comments)
    }
}


