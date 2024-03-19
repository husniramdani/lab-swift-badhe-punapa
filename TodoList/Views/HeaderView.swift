//
//  HeaderView.swift
//  TodoList
//
//  Created by Husni Ramdani on 18/03/24.
//

import SwiftUI

struct HeaderView: View {
	let title: String
	let subtitle: String
	let angle: Double
	let background: Color
	
	var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: 0)
				.foregroundColor(background)
				.rotationEffect(Angle(degrees: angle))
			
			VStack {
				Text(title)
					.font(.system(size: 50))
					.foregroundStyle(.white)
					.bold()
					
				Text(subtitle)
					.font(.system(size: 30))
					.foregroundStyle(.white)
			}
			.padding(.top, 60)
		}
		.frame(width: UIScreen.main.bounds.width * 3, height: 330)
		.offset(y: -130)
	}
}

#Preview {
	HeaderView(title: "Title", subtitle: "Subtitle", angle: 15, background: .blue)
}
