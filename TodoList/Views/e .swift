//
//  ProfileView.swift
//  TodoList
//
//  Created by Husni Ramdani on 17/03/24.
//

import SwiftUI

struct ProfileView: View {
	@StateObject var viewModel = ProfileViewModel()
	
	var body: some View {
		NavigationView {
			VStack {
				if let user = viewModel.user {
					profile(user: user)
				} else {
					Text("Nunggu kulo...")
				}
			}
			.navigationTitle("Kulo")
		}
		.onAppear {
			viewModel.fetchUser()
		}
	}
	
	@ViewBuilder
	func profile(user: User) -> some View {
		Image(systemName: "person.circle")
			.resizable()
			.aspectRatio(contentMode: .fit)
			.foregroundColor(.blue)
			.frame(width: 125, height: 125)
		
		VStack(alignment: .leading) {
			HStack {
				Text("Asmanipun: ")
				Text(user.name)
			}
			HStack {
				Text("Layang Setrum: ")
				Text(user.email)
			}
			HStack {
				Text("Ngetotke Kat: ")
				Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
			}
		}
		.padding()
		
		Button("Metu") {
			viewModel.logout()
		}
		.tint(.red)
		.padding()
		
		Spacer()
	}
}

#Preview {
    ProfileView()
}
