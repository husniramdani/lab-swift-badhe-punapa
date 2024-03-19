//
//  NewItemView.swift
//  TodoList
//
//  Created by Husni Ramdani on 17/03/24.
//

import SwiftUI

struct NewItemView: View {
	@StateObject var viewModel = NewItemViewModel()
	@Binding var newItemPresented: Bool
	
    var body: some View {
			VStack {
				Text("Anyaran")
					.font(.system(size: 32))
					.bold()
					.padding(.top, 30)
				
				Form {
					TextField("Iki Opo", text: $viewModel.title)
						.textFieldStyle(DefaultTextFieldStyle())
					
					DatePicker("Due Date", selection: $viewModel.dueDate)
						.datePickerStyle(GraphicalDatePickerStyle())
					
					TLButton(title: "Nggih", background: .pink){
						if viewModel.canSave {
							viewModel.save()
							newItemPresented = false
						} else {
							viewModel.showAlert = true
						}
					}
					.padding()
				}
				.alert(isPresented: $viewModel.showAlert) {
					Alert(title: Text("Allahuakbar"), message: Text("Kudu diisi kabeh lan dinone kudu bener"))
				}
			}
    }
}

#Preview {
	NewItemView(newItemPresented: Binding(
		get: {
			return true
		}, set: {
			_ in
		}
	))
}
