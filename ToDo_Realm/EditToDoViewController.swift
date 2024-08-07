//
//  EditToDoViewController.swift
//  ToDo_Realm
//
//  Created by Fusion Tech on 05.08.2024.
//

import UIKit
import SwiftUI

class EditToDoViewController: UIViewController {
    var todo: ToDo?
    var todoRepository: ToDoRepository?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        addToDoView()
    }

}

private extension EditToDoViewController {
    func addToDoView() {
        
//        paySlip.details.append(paySlip.details[0])
//        print("todoRepository Controller", todoRepository)
        let todoView = EditToDoView(todo: todo, navigationController: navigationController, todoRepository: todoRepository)
//        let todoView = EditToDoView()
        
        let controller = UIHostingController(rootView: todoView)
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        
        addChild(controller)
        view.addSubview(controller.view)
        controller.didMove(toParent: self)
//        controller.view.frame = view.bounds
        
        NSLayoutConstraint.activate([
//            controller.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            controller.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            controller.view.topAnchor.constraint(equalTo: view.topAnchor),
//            controller.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            controller.view.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -16),
            
            controller.view.widthAnchor.constraint(equalTo: view.widthAnchor),
            controller.view.heightAnchor.constraint(equalTo: view.heightAnchor),
//            controller.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            controller.view.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}
