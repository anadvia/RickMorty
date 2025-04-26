//
//  ListView.swift
//  RickMorty
//
//  Created by andrea viana aparisi on 23/4/25.
//

import SwiftUI

struct ListView: View {
	@StateObject var viewModel = ListViewModel()
	var body: some View {
		NavigationView {
			List {
				ForEach(viewModel.characters) { character in
					NavigationLink(destination: DetailCharacterView(characterID: character.id)) {
						RowView(character: character)
					}
				}
				.listRowSeparator(.hidden)
				Button {
					viewModel.loadMoreCharacters()
				} label: {
					HStack(alignment: .center) {
						Text("Cargar mas personajes")
					}
				}
			}
			.background(.clear)
			.scrollContentBackground(.hidden)
			.scrollIndicators(.hidden)
			.navigationTitle("Rick & Morty")
		}
		.task {
			await viewModel.loadCharacters()
		}
	}
}

#Preview {
	ListView()
}
