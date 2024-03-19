//
//  TodoListItemsView.swift
//  TodoList
//
//  Created by Husni Ramdani on 17/03/24.
//

import SwiftUI

struct TodoListItemView: View {
	@StateObject var viewModel = TodoListItemViewModel()
	let item: TodoListItem
	
    var body: some View {
			HStack {
				VStack(alignment: .leading) {
					Text(item.title)
						.font(.body)
					
					Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
						.font(.footnote)
						.foregroundColor(Color(.secondaryLabel))
				}
				
				Spacer()
				
				Button {
					viewModel.toggleIsDone(item: item)
				} label : {
					Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
						.foregroundColor(.blue)
				}
			}
    }
}

#Preview {
	TodoListItemView(item: .init(
		id: "123",
		title: "Get milk",
		dueDate: Date().timeIntervalSince1970,
		createdDate: Date().timeIntervalSince1970,
		isDone: true
	))
}
