//
//  TodoListItem.swift
//  TodoList
//
//  Created by Husni Ramdani on 17/03/24.
//

import Foundation

struct TodoListItem: Codable, Identifiable {
	let id: String
	let title: String
	let dueDate: TimeInterval
	let createdDate: TimeInterval
	var isDone: Bool
	
	mutating func setDone(_ state: Bool){
		isDone = state
	}
}
