//
//  EditToDoView.swift
//  ToDo_Realm
//
//  Created by Fusion Tech on 05.08.2024.
//

import SwiftUI

struct ToDoTemp {
    var name: String = "12345"
    var details: String = "qwerty"
    var date: Date = .now
    var priority: Int = 2
}

struct EditToDoView: View {
    @State private var todoTemp: ToDoDTO
//    @Binding var todo: ToDo
    @Environment(\.dismiss) var dismiss
//    @Environment(\.managedObjectContext) var modelContext
    @State private var newCommentName = ""
    
//    var storage = StorageService()
    var todo: ToDo?
    var navigationController: UINavigationController?
    var todoRepository: ToDoRepository?
    var title = "New ToDo"

    init(todo: ToDo? = nil, navigationController: UINavigationController?, todoRepository: ToDoRepository?) {
        self.navigationController = navigationController
        self.todoRepository = todoRepository
//    init() {
        if let todo = todo {
            title = "Edit ToDo"
//            print("OLD TODO")
            //        let todo = ToDo()
            //        try? storage.saveOrUpdateObject(object: todo)
            _todoTemp = State<ToDoDTO>(initialValue: ToDoDTO(object: todo))
        } else {
//            print("NEW TODO")
            let todo = ToDo()
//            print("TODO", todo)
//            todoRepository?.saveToDo(ToDoDTO(object: todo))
            _todoTemp = State<ToDoDTO>(initialValue: ToDoDTO(object: todo))
        }
        
        if let topViewController = navigationController?.topViewController {
            topViewController.title = title
        }
    }

    var body: some View {
        VStack {
            Form {
                TextField("Name", text: $todoTemp.name)
                TextField("Details", text: $todoTemp.details, axis: .vertical)
                DatePicker("Date", selection: $todoTemp.date)
                
                Section("Priority") {
                    Picker("Priority", selection: $todoTemp.priority) {
                        Text("Low").tag(Int(1))
                        Text("Mid").tag(Int(2))
                        Text("High").tag(Int(3))
                    }
                    .pickerStyle(.segmented)
                }
                
//                Section("Comments") {
////                    ForEach((todoTemp.comments).sorted { $0.name ?? "" < $1.name ?? "" }) { comment in
//                    ForEach(todoTemp.comments) { comment in
//                        Text(comment.name ?? "")
//                    }
//    
//                    HStack {
//                        TextField("Add a new comment in \(todo.name)", text: $newCommentName)
//    
//                        Button("Add", action: addComment)
//                    }
//                }
            }
            
            Button("SAVE") {
                addData()
            }
        }
//        .onAppear() {
////            navigationController?.navigationItem.title = "12345"
//            if let topViewController = navigationController?.topViewController {
//                topViewController.title = title
//            }
//        }
//        .navigationTitle("Edit ToDo!!!!!")
//        .navigationBarTitleDisplayMode(.inline)
//        .toolbar {
//            ToolbarItemGroup(placement: .navigationBarTrailing) {
//                Button(action: {
//                    addData()
//                }) {
//                    HStack {
//                        Text("Remove template")
//                        Image(systemName: "trash")
//                    }
//                }
////                Button("Save") {
////                    addData()
////                }
//            }
//        }
//        .onDisappear() {
//            try? storage.saveOrUpdateObject(object: ToDo(todoTemp))
//        }
    }
    
    func addData() {
        let todo = ToDo(todoTemp)
        print("SAVE TODO", todo)
//        print("todoRepository", todoRepository)
        todoRepository?.saveToDo(todoTemp)
        dismiss()
    }
    
    func addComment() {
        guard newCommentName.isEmpty == false else { return }

//        withAnimation {
//            let comment = Comment(context: modelContext)
//            comment.name = newCommentName
//            comment.todo = todo
//            let set: NSMutableSet? = todo.comments as? NSMutableSet
//            set?.add(comment)
//            todo.comments = set
//            newCommentName = ""
//        }
    }
}

#Preview {
//    EditToDoView(todo: ToDo())
    EditToDoView(navigationController: UINavigationController(), todoRepository: ToDoRepositoryImpl())
}
