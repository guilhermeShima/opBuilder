//
//  MainViewController.swift
//  opBuilder
//
//  Created by Guilherme Tavares Shimamoto on 06/05/24.
//

import UIKit
import SwiftUI

class MainViewController: UIHostingController<MainSwiftUIView> {
    
    init() {
        super.init(rootView: MainSwiftUIView())
    }

    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
                print(cards)
            } catch {
                print(error)
            }
        }

        // execute the HTTP request
        task.resume()
    }
}

public struct CardModel: Decodable {
    var gid: String
    var cid: String
    var n: String
    var t: String
    var col: String
    var cs: String?
    var tr: String?
    var a: String
    var p: String?
    var cp: String?
    var l: String?
    var r: String
    var ar: String?
    var iu: String
    var e: String?
    var al: String?
    var intl: String
    var srcN: String
    var srcD: String?
}
