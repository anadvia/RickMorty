//
//  MockCharacterUseCase.swift
//  RickMorty
//
//  Created by andrea viana aparisi on 15/5/25.
//

@testable import RickMorty

class MockCharacterUseCase: CharacterUseCaseProtocol {
	let mockService = MockCharacterService()
	
	func getCharactersAndNextPage(for page: Int) async throws -> ([Character], Bool) {
		let result = try await mockService.getListCharacters(for: page)
		let pagination = result.toDomain()
		return (pagination.characters, pagination.hasNextPage)
	}
	
	func getCharacter(by characterID: Int) async throws -> Character {
		let result = try await mockService.getCharacter(by: characterID)
		return result.toDomain()
	}
	
	func getCharactersRelatedTo(this character: Character) async throws -> [Character] {
		let result = try await mockService.getPaginationWhenSearching(this: character.name, for: 1)
		return result.toDomain().characters
	}
}
