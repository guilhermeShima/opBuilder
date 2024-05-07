//
//  CardModel.swift
//  opBuilder
//
//  Created by Guilherme Tavares Shimamoto on 06/05/24.
//

import Foundation

public struct CardModel: Decodable {
    var id: String
    var code: String
    var name: String
    var t: String
    var color: String
    var cost: String?
    var types: String?
    var a: String
    var power: String?
    var counterPower: String?
    var l: String?
    var r: String
    var ar: String?
    var imageLink: String
    var description: String?
    var al: String?
    var intl: String
    var collection: String
    var releaseDate: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "gid"
        case code = "cid"
        case name = "n"
        case t
        case color = "col"
        case cost = "cs"
        case types = "tr"
        case a
        case power = "p"
        case counterPower = "cp"
        case l
        case r
        case ar
        case imageLink = "iu"
        case description = "e"
        case al
        case intl
        case collection = "srcN"
        case releaseDate = "srcD"
    }
}
