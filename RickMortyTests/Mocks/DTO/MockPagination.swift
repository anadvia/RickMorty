//
//  MockPagination.swift
//  RickMorty
//
//  Created by andrea viana aparisi on 15/5/25.
//

@testable import RickMorty

class MockPaginationDTO {
	var paginationDTO = PaginationDTO(
		info: InfoDTO(
			count: 1,
			pages: 1,
			next: nil,
			prev: nil
		),
		results: [
			MockCharacterDTO().character,
			MockCharacterDTO().character,
			MockCharacterDTO().character,
		]
	)
}
