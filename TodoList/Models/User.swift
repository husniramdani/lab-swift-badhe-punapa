//
//  User.swift
//  TodoList
//
//  Created by Husni Ramdani on 17/03/24.
//

import Foundation

struct User: Codable {
	let id: String
	let name: String
	let email: String
	let joined: TimeInterval
}
