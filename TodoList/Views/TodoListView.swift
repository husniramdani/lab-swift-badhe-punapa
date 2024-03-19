//
//  TodoListView.swift
//  TodoList
//
//  Created by Husni Ramdani on 17/03/24.
//

import FirebaseFirestoreSwift
import SwiftUI

struct TodoListView: View {
	@StateObject var viewModel: TodoListViewModel
	@FirestoreQuery var items: [TodoListItem]
	
	init(userId: String) {
		self._items = FirestoreQuery(
			collectionPath: "users/\(userId)/todos"
		)
		self._viewModel = StateObject(
			wrappedValue: TodoListViewModel(userId: userId)
		)
	}
	
	var body: some View {
		NavigationView {
			VStack {
				List(items) {
					item in 
					TodoListItemView(item: item)
						.swipeActions {
							Button("Delete") {
								viewModel.delete(id: item.id)
							}
							.tint(.red)
						}
				}
				.listStyle(PlainListStyle())
			}
			.navigationTitle("Badhe Punapa")
			.toolbar {
				Button {
					viewModel.showingNewItemView = true
				} label: {
					Image(systemName: "plus")
				}
			}
			.sheet(isPresented: $viewModel.showingNewItemView){
				NewItemView(newItemPresented: $viewModel.showingNewItemView)
			}
		}
	}
}

#Preview {
    TodoListView(userId: "1WXHYCjGXEOoS7ajKr0ymEO8YNu1")
}
