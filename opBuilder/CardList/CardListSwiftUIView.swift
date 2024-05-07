//
//  CardListSwiftUIView.swift
//  opBuilder
//
//  Created by Guilherme Tavares Shimamoto on 06/05/24.
//

import SwiftUI

struct CardListSwiftUIView: View {
    @ObservedObject var viewModel: CardListViewModel
    
    init(viewModel: CardListViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            Text("Card list")
                .font(.headline)

            ScrollView {
                VStack {
                    ForEach(viewModel.cards, id: \.id) { card in
                        Text(card.name)
                            .font(.body)
                    }
                }
            }
        }
    }
}

#Preview {
    CardListSwiftUIView(viewModel: .init())
}
