//
//  Extentions.swift
//  TodoList
//
//  Created by Husni Ramdani on 18/03/24.
//

import Foundation

extension Encodable {
	func asDictionary() -> [String: Any] {
		guard let data = try? JSONEncoder().encode(self) else {
			return [:]
		}
		
		do {
			let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
			return json ?? [:]
		} catch {
			return [:]
		}
	}
}
