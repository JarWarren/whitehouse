//
//  Date-Ex.swift
//  WhiteHouse
//
//  Created by Jared Warren on 10/17/19.
//  Copyright © 2019 Warren. All rights reserved.
//

import Foundation

extension Date {
    
    var asString: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: self)
    }
}
