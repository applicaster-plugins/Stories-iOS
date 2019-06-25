//
//  Snap.swift
//  Stories
//
//  Created by Javier Casaudoumecq on 6/24/19.
//  Copyright © 2019 Javier Casaudoumecq. All rights reserved.
//

import Foundation

public enum MimeType: String {
    case image
    case video
    case unknown
}
public class Snap: Codable {
    public let internalIdentifier: String
    public let mimeType: String
    public let lastUpdated: String
    public let url: String
    public var kind: MimeType {
        switch mimeType {
        case MimeType.image.rawValue:
            return MimeType.image
        case MimeType.video.rawValue:
            return MimeType.video
        default:
            return MimeType.unknown
        }
    }
    enum CodingKeys: String, CodingKey {
        case internalIdentifier = "id"
        case mimeType = "mime_type"
        case lastUpdated = "last_updated"
        case url = "url"
    }
}
