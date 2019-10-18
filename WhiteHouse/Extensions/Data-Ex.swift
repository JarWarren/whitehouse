//
//  Data-Ex.swift
//  WhiteHouse
//
//  Created by Jared Warren on 10/17/19.
//  Copyright © 2019 Warren. All rights reserved.
//

import Foundation

extension Data {
    
    var humanReadable: NSString {
        NSString(data: self, encoding: String.Encoding.utf8.rawValue) ?? "unable to encode"
    }
}
