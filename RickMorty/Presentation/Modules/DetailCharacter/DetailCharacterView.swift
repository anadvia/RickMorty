//
//  DetailCharacterView.swift
//  RickMorty
//
//  Created by andrea viana aparisi on 26/4/25.
//

import SwiftUI

struct DetailCharacterView: View {
	@StateObject var viewModel = DetailCharacterViewModel()
	var characterID: Int
	
	var body: some View {
		VStack {
			if let url = URL(string: viewModel.character.image) {
				AsyncImage(url: url) { image in
					image
						.resizable()
						.scaledToFill()
				} placeholder: {
					ProgressView()
				}
			}
			
			Spacer()
			
			if viewModel.errorOccurred {
				HStack {
					Text("Error")
				}.padding(16)
					.frame(maxWidth: .infinity, idealHeight: 80)
					.background(.red)
			} else {
				VStack(alignment: .leading) {
					Text("Personajes relacionados")
						.frame(maxWidth: .infinity)
						.padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
						.fontWeight(.bold)
					if viewModel.relatedCharacters.count == 0 {
						Text("Personajes no encontrados")
							.padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
							.frame(maxWidth: .infinity)
					} else {
						ScrollView(.horizontal, showsIndicators: false) {
							HStack {
								ForEach(viewModel.relatedCharacters) { character in
									RelatedCharacterRow(character: character)
								}
							}.padding(16)
						}
					}
				}.frame(maxWidth: .infinity)
					.task {
						await viewModel.getRelatedCharacters()
					}
			}
		}
		.task {
			await viewModel.getCharacter(for: characterID)
			await viewModel.getRelatedCharacters()
		}
		.navigationTitle(viewModel.character.name)
		.navigationBarItems(trailing:
								Image(systemName: "circle.fill")
			.foregroundColor(getStatusColor(for: viewModel.character.status))
			.frame(width: 24, height: 24)
		)
	}
	
	func getStatusColor(for status: Character.CharacterStatus) -> Color {
		switch status {
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
	DetailCharacterView(characterID: 1)
}
