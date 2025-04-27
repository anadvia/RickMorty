//
//  CharacterUseCase.swift
//  RickMorty
//
//  Created by andrea viana aparisi on 23/4/25.
//

import Foundation

class CharacterUseCase {
	let repository: CharacterRepositoryProtocol
	
	init(repository: CharacterRepositoryProtocol) {
		self.repository = repository
	}
}

extension CharacterUseCase: CharacterUseCaseProtocol {
	func getCharactersAndNextPage(for page: Int) async throws -> ([Character], Bool) {
		let result = try await repository.getListCharacters(for: page)
		return (result.characters, result.hasNextPage)
	}
	
	func getCharacter(by characterID: Int) async throws -> Character {
		return try await repository.getCharacter(by: characterID)
	}
	
	func getCharactersRelatedTo(this character: Character) async throws -> [Character] {
		let name = character.name.split(separator: " ")
		guard let first_name = name.first else { return [] }
		let pagination = try await repository.getPaginationWhenSearching(this: String(first_name), for: 1)
		return pagination.characters.filter({$0.name != character.name})
	}
}
