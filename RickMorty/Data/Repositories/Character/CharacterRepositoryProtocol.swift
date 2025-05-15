//
//  CharacterRepositoryProtocol.swift
//  RickMorty
//
//  Created by andrea viana aparisi on 23/4/25.
//

import Foundation

protocol CharacterRepositoryProtocol {
	func getListCharacters(for page: Int) async throws -> Pagination
	func getCharacter(by characterID: Int) async throws -> Character
	func getPaginationWhenSearching(this name: String, for page: Int) async throws -> Pagination
}
