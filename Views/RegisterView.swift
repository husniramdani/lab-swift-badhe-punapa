//
//  RegisterView.swift
//  TodoList
//
//  Created by Husni Ramdani on 17/03/24.
//

import SwiftUI

struct RegisterView: View {
	@StateObject var viewModel = RegisterViewModel()

	var body: some View {
		VStack {
			HeaderView(title: "Dhaptar", subtitle: "Lekas Ngatur Tindakan", angle: -15, background: .pink)
			
			Form {
				if !viewModel.errorMessage.isEmpty {
					Text(viewModel.errorMessage)
						.foregroundColor(.red)
				}
				
				TextField("Asma Nipun", text: $viewModel.name)
					.textFieldStyle(DefaultTextFieldStyle())
					.autocorrectionDisabled()
				TextField("Layang Setrum", text: $viewModel.email)
					.textFieldStyle(DefaultTextFieldStyle())
					.autocapitalization(.none)
					.autocorrectionDisabled()
				SecureField("Ssssttt", text: $viewModel.password)
					.textFieldStyle(DefaultTextFieldStyle())
				
				TLButton(title:"Nggawe Akun", background: .pink){
					viewModel.register()
				}
				.padding()
			}
			.offset(y: -30)
			
			Spacer()
		}
	}
}

#Preview {
    RegisterView()
}
