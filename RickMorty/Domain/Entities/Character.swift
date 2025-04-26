//
//  Character.swift
//  RickMorty
//
//  Created by andrea viana aparisi on 23/4/25.
//

import Foundation

struct Character: Identifiable, Equatable {
	enum CharacterStatus: String {
		case Dead
		case Alive
		case unknown
	}

	var id: Int
	var image: String
	var name: String
	var status: CharacterStatus
	var species: String
	var type: String
	var gender: String
	var isFavorite: Bool = false

	init(
		id: Int,
		name: String,
		image: String,
		status: CharacterStatus,
		species: String,
		type: String,
		gender: String,
		isFavorite: Bool = false
	) {
		self.id = id
		self.image = image
		self.name = name
		self.status = status
		self.species = species
		self.type = type
		self.gender = gender
		self.isFavorite = isFavorite
	}

	init() {
		self.id = 0
		self.image = ""
		self.name = ""
		self.status = .unknown
		self.species = ""
		self.type = ""
		self.gender = ""
	}
}
