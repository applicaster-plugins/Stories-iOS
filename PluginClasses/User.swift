//
//  User.swift
//  Stories
//
//  Created by Javier Casaudoumecq on 6/24/19.
//  Copyright © 2019 Javier Casaudoumecq. All rights reserved.
//

import Foundation

public class User: Codable {
    public let internalIdentifier: String
    public let name: String
    public let picture: String
    
    enum CodingKeys: String, CodingKey {
        case internalIdentifier = "id"
        case name = "name"
        case picture = "picture"
    }
}
