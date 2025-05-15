//
//  ListViewModelProtocol.swift
//  RickMorty
//
//  Created by andrea viana aparisi on 15/5/25.
//

import Foundation

protocol ListViewModelProtocol {
	func loadMoreCharacters()
	func loadCharacters() async
}
