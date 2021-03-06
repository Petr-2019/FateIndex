//
//  TopNServant.swift
//  FateIndex
//
//  Created by Peter-Guan on 2020/6/5.
//  Copyright © 2020 FoxHound-Peter-Guan. All rights reserved.
//

import Foundation

struct TopNServant: Codable, Hashable, Identifiable {
    let id: String
    let name: String
    let servantClass: String
    let portrait: String
}
