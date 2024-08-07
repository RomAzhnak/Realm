//
//  Comment.swift
//  ToDo_Realm
//
//  Created by Fusion Tech on 05.08.2024.
//

import Foundation
import RealmSwift

final class Comment: Object {
//    @Persisted(primaryKey: true) var id: String
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String
    
    convenience init(
    id: ObjectId,
    name: String
    ) {
        self.init()
        self.id = id
        self.name = name
    }
}

struct CommentDTO: Identifiable {
    var id: ObjectId
    let name: String
}

extension Comment {
    convenience init(_ dto: ToDoDTO) {
        self.init()
        id = dto.id
        name = dto.name
    }
}

extension CommentDTO {
    init(object: ToDo) {
        id = object.id
        name = object.name
    }
}
