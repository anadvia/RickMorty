//
//  RickMortyTests.swift
//  RickMortyTests
//
//  Created by andrea viana aparisi on 23/4/25.
//

import XCTest
@testable import RickMorty

struct RickMortyTests {
	
	func load_characters() {
		let viewModel = MockListViewModel()
		Task {
			await viewModel.loadCharacters()
		}
		XCTAssert(viewModel.pagination.characters.count > 0)
	}
	
	func load_more_characters() {
		let viewModel = MockListViewModel()
		viewModel.loadMoreCharacters()
		XCTAssert(viewModel.pagination.characters.count > 0)
	}
}
