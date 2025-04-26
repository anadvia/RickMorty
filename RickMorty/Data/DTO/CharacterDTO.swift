//
//  CharacterDTO.swift
//  RickMorty
//
//  Created by andrea viana aparisi on 23/4/25.
//

import Foundation

struct CharacterDTO: Codable {
	var id: Int
	var image: String?
	var name: String?
	var status: String?
	var species: String?
	var type: String?
	var gender: String?
	var isFavorite: Bool? = false
	var page: Int? = 0
}

extension CharacterDTO {
	func toDomain() -> Character {
		let status = Character.CharacterStatus(rawValue: self.status ?? "unknown") ?? .unknown
		let isFavorite = self.isFavorite != nil ? self.isFavorite : false
			return .init(id: self.id,
						 name: self.name ?? "",
						 image: self.image ?? "",
						 status: status,
						 species: self.species ?? "",
						 type: self.type ?? "",
						 gender: self.gender ?? "",
						 isFavorite: isFavorite ?? false
		)
	}
}
