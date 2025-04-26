//
//  CaharacterRepository.swift
//  RickMorty
//
//  Created by andrea viana aparisi on 23/4/25.
//

import Foundation

class CharacterRepository: CharacterRepositoryProtocol {
	var networkManager: NetworkManagerProtocol = NetworkManager()
	
	func getListCharacters(for page: Int) async throws -> PaginationDTO {
		guard let url = URL(string: "https://rickandmortyapi.com/api/character/?page=\(page)") else {
			throw NetworkError.badURL
		}
		let request = URLRequest(url: url)
		var paginationDTO = try await networkManager.call(this: request,
														  of: PaginationDTO.self)
		let charactersWithPage = paginationDTO.results
		for var character in charactersWithPage {
			character.page = page
		}
		paginationDTO.results = charactersWithPage
		return paginationDTO
	}
	
	func getCharacter(by characterID: Int) async throws -> CharacterDTO {
		guard let url = URL(string: "https://rickandmortyapi.com/api/character/\(characterID)") else {
			throw NetworkError.badURL
		}
		let request = URLRequest(url: url)
		let characterDTO = try await networkManager.call(this: request, of: CharacterDTO.self)
		return characterDTO
	}
	
	func getPaginationWhenSearching(this name: String, for page: Int) async throws -> PaginationDTO {
		guard let url = URL(string: "https://rickandmortyapi.com/api/character/?name=\(name)&page=\(page)") else {
			throw NetworkError.badURL
		}
		let request = URLRequest(url: url)
		let paginationDTO = try await networkManager.call(this: request,
														  of: PaginationDTO.self)
		return paginationDTO
	}
}
