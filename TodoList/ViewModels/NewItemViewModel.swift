//
//  NewItemViewModel.swift
//  TodoList
//
//  Created by Husni Ramdani on 17/03/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemViewModel: ObservableObject {
	@Published var title = ""
	@Published var dueDate = Date()
	@Published var showAlert = false

	init() {}
	
	func save(){
		guard canSave else {
			return
		}
		
		// get currrent user id
		guard let uid = Auth.auth().currentUser?.uid else {
			return
		}
		
		// create model
		let newId = UUID().uuidString
		let newItem = TodoListItem(
			id: newId,
			title: title,
			dueDate: dueDate.timeIntervalSince1970,
			createdDate: Date().timeIntervalSince1970,
			isDone: false
		)
		
		// save model
		let db = Firestore.firestore()
		
		db.collection("users")
			.document(uid)
			.collection("todos")
			.document(newId)
			.setData(newItem.asDictionary())
		
	}
	
	var canSave: Bool {
		guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
			return false
		}
		
		guard dueDate >= Date().addingTimeInterval(-86400) else {
			return false
		}
		
		return true
	}
}
