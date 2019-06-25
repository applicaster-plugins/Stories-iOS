//
//  Stories.swift
//  Stories
//
//  Created by Javier Casaudoumecq on 6/24/19.
//  Copyright © 2019 Javier Casaudoumecq. All rights reserved.
//

import Foundation

public class Stories: Codable {
    public let count: Int
    public let stories: [Story]
    
    enum CodingKeys: String, CodingKey {
        case count = "count"
        case stories = "stories"
    }
    func copy() throws -> Stories {
        let data = try JSONEncoder().encode(self)
        let copy = try JSONDecoder().decode(Stories.self, from: data)
        return copy
    }
}
