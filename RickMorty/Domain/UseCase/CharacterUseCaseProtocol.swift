//
//  CharacterUseCaseProtocol.swift
//  RickMorty
//
//  Created by andrea viana aparisi on 23/4/25.
//

import Foundation

protocol CharacterUseCaseProtocol {
	func getCharactersAndNextPage(for page: Int) async throws -> ([Character], Bool)
	func getCharacter(by characterID: Int) async throws -> Character
	func getCharactersRelatedTo(this character: Character) async throws -> [Character]
}
