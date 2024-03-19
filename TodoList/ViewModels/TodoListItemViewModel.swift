//
//  TodoListItemViewModel.swift
//  TodoList
//
//  Created by Husni Ramdani on 17/03/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class TodoListItemViewModel: ObservableObject {
	init() {}
	
	func toggleIsDone(item: TodoListItem){
		var selectedItem = item
		selectedItem.setDone(!item.isDone)
		
		guard let uid = Auth.auth().currentUser?.uid else {
			return
		}
		
		let db = Firestore.firestore()
		db.collection("users")
			.document(uid)
			.collection("todos")
			.document(selectedItem.id)
			.setData(selectedItem.asDictionary())
	}
}
