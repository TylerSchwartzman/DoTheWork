//
//  Task.swift
//  DoTheWorkApp
//
//  Created by Tyler Schwartzman on 5/5/21.
//

import Foundation

enum Description<T> {
    case media(T)
    case text(T)
}

struct Task {
    let name: String
    let description: Description<Any>
    let notification: Date
}
 
