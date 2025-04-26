//
//  DetailCharacterViewModel.swift
//  RickMorty
//
//  Created by andrea viana aparisi on 26/4/25.
//

import UIKit

@MainActor
class DetailCharacterViewModel: ObservableObject {
	let repository = CharacterRepository()
	lazy var useCase: CharacterUseCaseProtocol = {
		CharacterUseCase(repository: repository)
	}()
	
	@Published var character: Character = Character()
	@Published var errorOccurred: Bool = false
	@Published var relatedCharacters: [Character] = []
	
	func getRelatedCharacters() async {
			do {
				let relatedCharacters = try await useCase.getCharactersRelatedTo(this: character)
				self.relatedCharacters = relatedCharacters
			} catch {
				errorOccurred = true
			}
	}
	
	func getCharacter(for characterID: Int) async {
		do {
			let character = try await useCase.getCharacter(by: characterID)
			self.character = character
		} catch {
			errorOccurred = true
		}
	}
}
