//
//  Message.swift
//  chatProgram
//
//  Created by 곽현우 on 9/10/24.
//

import Foundation

struct Message : Identifiable, Codable {
    var id: String
    var text: String
    var received: Bool
    var timestamp: Date
}

