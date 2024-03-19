//
//  LoginViewModel.swift
//  TodoList
//
//  Created by Husni Ramdani on 17/03/24.
//

import Firebase
import Foundation

class LoginViewModel: ObservableObject {
	@Published var email = ""
	@Published var password = ""
	@Published var errorMessage = ""

	init(){}
	
	func login(){
		guard validate() else {
			return
		}
		
		// Try log in
		Auth.auth().signIn(withEmail: email, password: password)
	}
	
	private func  validate() -> Bool {
		errorMessage = ""
		guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
			errorMessage = "Kudu diisi kabeh"
			return false
		}
		
		guard email.contains("@") && email.contains(".") else {
			errorMessage = "Please enter valid email."
			return false
		}
		
		return true
	}
}
