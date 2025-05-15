//
//  MockCharacter.swift
//  RickMorty
//
//  Created by andrea viana aparisi on 15/5/25.
//

@testable import RickMorty

class MockCharacterDTO {
	var character = CharacterDTO(
		id: 1,
		image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
		name: "Ricky",
		status: "Alive",
		species: "Human",
		type: "",
		gender: "Male"
	)
}
