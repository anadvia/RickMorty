//
//  MockAPIService.swift
//  RickMortyTests
//
//  Created by andrea viana aparisi on 26/4/25.
//

@testable import RickMorty

class MockAPIService: CharacterRepositoryProtocol {
	func getListCharacters(for page: Int) async throws -> Pagination {
		return Pagination(
			hasNextPage: true,
			characters: [
				Character(id: 1, name: "Rick Sanchez", image: "", status: .Alive, species: "", type: "", gender: ""),
				Character(id: 2, name: "Morty Smith", image: "", status: .Alive, species: "", type: "", gender: "")
			]
		)
	}
	
	func getCharacter(by characterID: Int) async throws -> Character {
		return Character(id: 1, name: "Rick Sanchez", image: "", status: .Alive, species: "", type: "", gender: "")
	}
	
	func getPaginationWhenSearching(this name: String, for page: Int) async throws -> Pagination {
		return Pagination(
			hasNextPage: true,
			characters: [
				Character(id: 1, name: "Rick Sanchez", image: "", status: .Alive, species: "", type: "", gender: ""),
				Character(id: 2, name: "Morty Smith", image: "", status: .Alive, species: "", type: "", gender: "")
			]
		)
	}
}
