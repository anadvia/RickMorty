//
//  MockCharacterService.swift
//  RickMorty
//
//  Created by andrea viana aparisi on 15/5/25.
//

import XCTest
@testable import RickMorty

class MockCharacterService: CharacterRepositoryProtocol {
	var shouldReturnError = false
	func getListCharacters(for page: Int) async throws -> PaginationDTO {
		if shouldReturnError {
			throw NSError(domain: "API error", code: 0)
		} else {
			return MockPaginationDTO().paginationDTO
		}
	}
	
	func getCharacter(by characterID: Int) async throws -> CharacterDTO {
		if shouldReturnError {
			throw NSError(domain: "API error", code: 0)
		} else {
			return MockPaginationDTO().paginationDTO.results[0]
		}
	}
	
	func getPaginationWhenSearching(this name: String, for page: Int) async throws -> PaginationDTO {
		if shouldReturnError {
			throw NSError(domain: "API error", code: 0)
		} else {
			return MockPaginationDTO().paginationDTO
		}
	}
}
