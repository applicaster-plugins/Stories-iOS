//
//  Story.swift
//  Stories
//
//  Created by Javier Casaudoumecq on 6/24/19.
//  Copyright © 2019 Javier Casaudoumecq. All rights reserved.
//

import Foundation

public class Story: Codable {
    // Note: To retain lastPlayedSnapIndex value for each story making this type as class
    public var snapsCount: Int
    public var snaps: [Snap]
    public var internalIdentifier: String
    public var lastUpdated: Int
    public var user: User
    var lastPlayedSnapIndex = 0
    var isCompletelyVisible = false
    var isCancelledAbruptly = false
    
    enum CodingKeys: String, CodingKey {
        case snapsCount = "snaps_count"
        case snaps = "snaps"
        case internalIdentifier = "id"
        case lastUpdated = "last_updated"
        case user = "user"
    }
}

extension Story: Equatable {
    public static func == (lhs: Story, rhs: Story) -> Bool {
        return lhs.internalIdentifier == rhs.internalIdentifier
    }
}
