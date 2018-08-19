//
//  DataManager.swift
//  Meet the Team
//
//  Created by Wenzhi Zhao on 8/19/18.
//  Copyright © 2018 Wenzhi Zhao. All rights reserved.
//

import Foundation
import os
class DataManager {
    func decodeJsonData(from file: String) -> [TeamMember]? {
        var list: [TeamMember]?
        if let path = Bundle.main.path(forResource: file, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                do {
                    list = try JSONDecoder().decode([TeamMember].self, from: data)
                } catch let jsonError {
                    print("error: \(jsonError.localizedDescription)")
                }
            } catch {
                os_log("Something went wrong")
            }
        }
        return list
    }
}
