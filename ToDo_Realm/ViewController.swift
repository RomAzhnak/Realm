//
//  ViewController.swift
//  ToDo_Realm
//
//  Created by Fusion Tech on 05.08.2024.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableView: UITableView!
//    var items: [String] = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]
    var items: [ToDoDTO]!
    var todoRepository: ToDoRepository!
//    var storage: StorageService!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todoRepository = ToDoRepositoryImpl()
//        storage = StorageService()
        items = todoRepository.getToDoList()
        
        let sortImage  = UIImage(systemName: "arrow.up.arrow.down")
        navigationController?.navigationBar.prefersLargeTitles = true
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTodo))
        let sortButton = UIBarButtonItem(image: sortImage,  style: .plain, target: self, action: #selector(addTodo))
        navigationItem.rightBarButtonItems = [sortButton, addButton]
        title = "ToDo"

        tableView = UITableView(frame: view.bounds)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        tableView.isEditing = true  // Включаем режим редактирования
        view.addSubview(tableView)
    }
    
    @objc func addTodo() {
//        let todo = ToDo()
//        try? storage.saveOrUpdateObject(object: todo)
        let nextScreen = EditToDoViewController()
        nextScreen.todoRepository = todoRepository
//        nextScreen.todo = todo
//        nextScreen.title = "Edit ToDo"
        navigationController?.pushViewController(nextScreen, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        items = todoRepository.getToDoList()
//        print(">>>", items)
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.selectionStyle = .none
        cell.textLabel?.text = items[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        // Отключаем стандартные действия редактирования (например, удаление)
        return .delete
    }
    
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        // Отключаем индикацию при редактировании
        return true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextScreen = EditToDoViewController()
        nextScreen.todo = ToDo(items[indexPath.row])
        nextScreen.todoRepository = todoRepository
//        print("View Controller", todoRepository)
//        nextScreen.title = "Edit ToDo"
        navigationController?.pushViewController(nextScreen, animated: true)
    }
}

