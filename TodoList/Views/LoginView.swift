//
//  LoginView.swift
//  TodoList
//
//  Created by Husni Ramdani on 17/03/24.
//

import SwiftUI

struct LoginView: View {
	@StateObject var viewModel = LoginViewModel()
	
	var body: some View {
		NavigationView {
			VStack {
				HeaderView(title: "Badhe Punapa", subtitle: "Nindakake Samubarang", angle: 15, background: .indigo)

				Form {
					TextField("Layang Setrum", text: $viewModel.email)
						.textFieldStyle(DefaultTextFieldStyle())
						.autocapitalization(.none)
					
					SecureField("Ssssttt", text: $viewModel.password)
						.textFieldStyle(DefaultTextFieldStyle())
					
					TLButton(title:"Mlebet", background: .indigo){
						viewModel.login()
					}
					.padding()
				}
				.offset(y: -30)
				
				// Create account
				VStack {
					Text("Wong Anyaran")
					NavigationLink("Nggawe Akun", destination: RegisterView())
				}
				.padding(.bottom, 50)
				
				
				Spacer()
			}
		}
	}
}

#Preview {
	LoginView()
}
