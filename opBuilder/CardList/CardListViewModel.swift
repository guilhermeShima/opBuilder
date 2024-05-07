//
//  CardListViewModel.swift
//  opBuilder
//
//  Created by Guilherme Tavares Shimamoto on 06/05/24.
//

import Foundation
import SwiftUI

public class CardListViewModel: ObservableObject {

    @Published var cards: [CardModel] = []

    func getCards() async {
        let url = URL(string: "https://onepiece-cardgame.dev/cards.json")!

        do {
            let (data, response) = try await URLSession.shared.data(from: url)

            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("ERROR")
                return
            }

            let decoder = JSONDecoder()
            let cards = try decoder.decode([CardModel].self, from: data)
            await MainActor.run {
                self.cards = cards
            }
        } catch {
            print(error)
        }
    }
    
    func getCardsOld() {
        // The URLSession will save cache/cookie into disk, credentials are saved to keychain
        //        let config = URLSessionConfiguration.default
        //        let session = URLSession(configuration: config)

        let url = URL(string: "https://onepiece-cardgame.dev/cards.json")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            // ensure there is no error for this HTTP response
            guard error == nil else {
                print ("error: \(error!)")
                return
            }
            
            // ensure there is data returned from this HTTP response
            guard let content = data else {
                print("No data")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let cards = try decoder.decode([CardModel].self, from: content)
                self.cards = cards
                print(cards)
            } catch {
                print(error)
            }
        }

        task.resume()
    }
}
