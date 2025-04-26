//
//  PaginationDTO.swift
//  RickMorty
//
//  Created by andrea viana aparisi on 23/4/25.
//

import Foundation

struct InfoDTO: Codable {
	var count: Int
	var pages: Int
	var next: String?
	var prev: String?
}

struct PaginationDTO: Codable {
	var info: InfoDTO?
	var results = [CharacterDTO]()
}

extension PaginationDTO {
	func toDomain() -> Pagination {
		.init(hasNextPage: self.info?.next != nil,
			  characters: self.results.map({ $0.toDomain() }))
	}
}
