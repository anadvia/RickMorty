//
//  ListViewModel.swift
//  RickMorty
//
//  Created by andrea viana aparisi on 23/4/25.
//

import Foundation

@MainActor
class ListViewModel: ObservableObject {
	let repository = CharacterRepository()
	lazy var useCase: CharacterUseCaseProtocol = {
		CharacterUseCase(repository: repository)
	}()
	
	@Published var characters: [Character] = []
	
	var page: Int = 1
	var hasNextPage: Bool = true {
		didSet {
			page += hasNextPage ? 1 : 0
		}
	}
	
	func loadCharacters() async {
		do {
			let (characters, hasNextPage) = try await useCase.getCharactersAndNextPage(for: page)
			self.characters.append(contentsOf: characters)
			self.hasNextPage = hasNextPage
		} catch {
			print(error)
		}
	}
	
	func loadMoreCharacters() {
		Task {
			await loadCharacters()
		}
	}
}
