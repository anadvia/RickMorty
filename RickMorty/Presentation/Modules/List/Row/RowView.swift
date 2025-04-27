//
//  RowView.swift
//  RickMorty
//
//  Created by andrea viana aparisi on 23/4/25.
//

import SwiftUI

struct RowView: View {
	var character: Character
	
	var body: some View {
		HStack {
			if let imageURL = URL(string: character.image) {
				AsyncImage(url: imageURL) { image in
					image
						.resizable()
						.frame(width: 80, height: 80, alignment: .top)
						.aspectRatio(contentMode: .fill)
						.clipShape(Circle())
						.transition(.scale(scale: 0.1, anchor: .center))
				} placeholder: {
					ProgressView()
						.frame(width: 80, height: 80, alignment: .center)
						.foregroundColor(.white)
						.background(.gray)
						.clipShape(Circle())
				}
			}
			VStack(alignment: .leading) {
				Text(character.name)
				HStack {
					Circle()
						.fill(statusColor)
						.frame(width: 10, height: 10)
					Text(character.status.rawValue)
				}
			}
			Spacer()
		}
		.padding()
		.frame(maxWidth: .infinity, alignment: .leading)
		.background(
			RoundedRectangle(cornerRadius: 12)
				.fill(Color.white)
				.shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
		)
	}
	
	var statusColor: Color {
		switch character.status {
			case .Dead:
				return .red
			case .Alive:
				return .green
			case .unknown:
				return .gray
		}
	}
}

#Preview {
	RowView(
		character: Character(
			id: 1,
			name: "Ricky",
			image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
			status: .Alive,
			species: "Human",
			type: "",
			gender: "Male"
		)
	)
}
