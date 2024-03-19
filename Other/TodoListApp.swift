//
//  TodoListApp.swift
//  TodoList
//
//  Created by Husni Ramdani on 16/03/24.
//

import FirebaseCore
import SwiftUI

@main
struct TodoListApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
