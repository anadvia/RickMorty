//
//  MockCharacterDTO.swift
//  RickMorty
//
//  Created by andrea viana aparisi on 15/5/25.
//

import XCTest
@testable import RickMorty

class MockListViewModel: ListViewModelProtocol {
	let useCase = MockCharacterUseCase()
	var pagination = Pagination(hasNextPage: false, characters: [])
	
	func loadCharacters() async {
		do {
			let (character, hasNextPage) = try await useCase.getCharactersAndNextPage(for: 1)
			pagination.characters = character
		} catch {
			NSError(domain: "API Error", code: 2)
			pagination.characters = []
		}
	}
	
	func loadMoreCharacters() {
		Task {
			await loadCharacters()
		}
	}
}
