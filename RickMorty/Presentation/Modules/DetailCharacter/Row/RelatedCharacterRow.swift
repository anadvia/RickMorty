//
//  RelatedCharacterRow.swift
//  RickMorty
//
//  Created by andrea viana aparisi on 26/4/25.
//

import SwiftUI

struct RelatedCharacterRow: View {
	var character: Character
	
	var body: some View {
		if let imageURL = URL(string: character.image) {
			AsyncImage(url: imageURL) { image in
				withAnimation(.easeInOut(duration: 1.0)) {
					image
						.resizable()
						.frame(width: 80, height: 80)
						.aspectRatio(contentMode: .fill)
						.clipShape(Circle())
				}
			} placeholder: {
				ProgressView()
					.frame(width: 80, height: 80, alignment: .center)
					.foregroundColor(.white)
					.background(.gray)
					.opacity(0.5)
					.clipShape(Circle())
			}
		}
	}
}

#Preview {
	RelatedCharacterRow(character: Character())
}
