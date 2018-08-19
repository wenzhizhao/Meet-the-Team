//
//  TeamMember.swift
//  Meet the Team
//
//  Created by Wenzhi Zhao on 8/18/18.
//  Copyright © 2018 Wenzhi Zhao. All rights reserved.
//

import Foundation
import os

public struct TeamMember: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case position
        case profileImageUrl = "profile_image"
        case personality
        case interests
        case datingPreferences = "dating_preferences"
    }
    
    public var id: String?
    public var name: String?
    public var position: String?
    public var profileImageUrl: String?
    public var personality: String?
    public var interests: String?
    public var datingPreferences: String?
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        do {
            id = try container.decode(String.self, forKey: .id)
        } catch {
            os_log("id is missing")
        }
        do {
            name = try container.decode(String.self, forKey: .name)
        } catch {
            os_log("name is missing")
        }
        do {
            position = try container.decode(String.self, forKey: .position)
        } catch {
            os_log("position is missing")
        }
        do {
            profileImageUrl = try container.decode(String.self, forKey: .profileImageUrl)
        } catch {
            os_log("profileImageUrl is missing")
        }
        do {
            personality = try container.decode(String.self, forKey: .personality)
        } catch {
            os_log("personality is missing")
        }
        do {
            interests = try container.decode(String.self, forKey: .interests)
        } catch {
            os_log("interests is missing")
        }
        do {
            datingPreferences = try container.decode(String.self, forKey: .datingPreferences)
        } catch {
            os_log("interests is missing")
        }
    }
}
