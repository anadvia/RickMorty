//
//  RickMortyTests.swift
//  RickMortyTests
//
//  Created by andrea viana aparisi on 23/4/25.
//

import XCTest
@testable import RickMorty

final class RickMortyTests: XCTestCase {
	var apiService: CharacterRepositoryProtocol!

	override func setUp() {
		super.setUp()
		apiService = MockAPIService()
	}

	override func tearDown() {
		apiService = nil
		super.tearDown()
	}

	func testFetchCharacters() async throws {
		let pagination = try await apiService.getListCharacters(for: 1)
		let characters = pagination.characters
		
		XCTAssertEqual(characters.count, 2)
		XCTAssertEqual(characters[0].name, "Rick Sanchez")
		XCTAssertEqual(characters[1].name, "Morty Smith")
	}
	
	func testGetCharacterByID() async throws {
		let character = try await apiService.getCharacter(by: 1)
		
		XCTAssertEqual(character.name, "Rick Sanchez")
	}
	
	func testGetPaginationWhenSearching() async throws {
		let pagination = try await apiService.getPaginationWhenSearching(this: "Rick Sanchez", for: 1)
		let characters = pagination.characters
		
		XCTAssertEqual(characters[0].name, "Rick Sanchez")
	}
}
