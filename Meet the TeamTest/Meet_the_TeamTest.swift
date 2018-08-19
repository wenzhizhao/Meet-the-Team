//
//  Meet_the_TeamTest.swift
//  Meet the TeamTest
//
//  Created by Wenzhi Zhao on 8/19/18.
//  Copyright © 2018 Wenzhi Zhao. All rights reserved.
//

import XCTest
import os
@testable import Meet_the_Team

class Meet_the_TeamTest: XCTestCase {

    var completeData: Data = Data()
    var incompleteData: Data = Data()

    override func setUp() {
        let completeDic: [String: String] = [
            "id": "0",
            "name": "Ben Easton",
            "position": "iOS Engineer",
            "profile_image": "https://d1ghufavkue0e7.cloudfront.net/cache/d4/67/d4670ffa4ed318affdca8c8452db892d.jpg",
            "personality": "with a strong British 🇬🇧 accent! I still use a lot of British phrases, like 'would you like a cup of tea?' and 'just popping to the loo!'",
            "interests": "Hiking in nature, meditating, Krav Maga, avocados 🥑, helping people overcome chronic illnesses ⛑, performing standup comedy and making people laugh",
            "dating_preferences": "is up for doing different and unique things, likes to laugh 😂"
        ]
        completeData = NSKeyedArchiver.archivedData(withRootObject: completeDic)
        let incompleteDic: [String : String] = [
            "id": "0"
        ]
        incompleteData = NSKeyedArchiver.archivedData(withRootObject: incompleteDic)
    }

    func testCompleteDecoding() {
        do {
            let member = try JSONDecoder().decode(TeamMember.self, from: completeData)
            XCTAssertEqual(member.id, "0")
            XCTAssertEqual(member.name, "Ben Easton")
            XCTAssertEqual(member.position, "iOS Engineer")
            XCTAssertEqual(member.profileImageUrl, "https://d1ghufavkue0e7.cloudfront.net/cache/d4/67/d4670ffa4ed318affdca8c8452db892d.jpg")
            XCTAssertEqual(member.personality, "with a strong British 🇬🇧 accent! I still use a lot of British phrases, like 'would you like a cup of tea?' and 'just popping to the loo!'")
            XCTAssertEqual(member.datingPreferences, "is up for doing different and unique things, likes to laugh 😂")
        } catch {
            os_log("decoding failed")
        }

    }
    
    func testIncompleteDecoding() {
        do {
            let member = try JSONDecoder().decode(TeamMember.self, from: incompleteData)
            XCTAssertNotNil(member)
            XCTAssertEqual(member.id, "0")
            XCTAssertNil(member.name)
            XCTAssertNil(member.position)
            XCTAssertNil(member.profileImageUrl)
            XCTAssertNil(member.personality)
            XCTAssertNil(member.datingPreferences)
        } catch {
            os_log("decoding failed")
        }
    }
}
