//
//  ContentView.swift
//  TodoList
//
//  Created by Husni Ramdani on 16/03/24.
//

import SwiftUI

struct MainView: View {
	@StateObject var viewModel = MainViewModel()
	
	@ViewBuilder
	var accountView: some View {
		TabView {
			TodoListView(userId: viewModel.currentUserId)
				.tabItem {
					Label("Griya", systemImage: "house")
				}
			
			ProfileView()
				.tabItem {
					Label("Kulo", systemImage: "person.circle")
				}
		}
	}
	
	var body: some View {
		if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
			accountView
		} else {
			LoginView()
		}
		
	}
}

#Preview {
	MainView()
}
