//
//  Mission.swift
//  Moonshot
//
//  Created by Nilesh Rathod on 10/05/23.
//

import Foundation


struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }

    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }

    var image: String {
        "apollo\(id)"
    }
    
    var formateddate : String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
