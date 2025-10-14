//
//  HuntItem.swift
//  ScavengerHuntPro
//
//  Created by Satoof Haj  on 2025-10-14.
//


import Foundation

struct HuntItem: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let clue: String
    var isFound: Bool = false
}

