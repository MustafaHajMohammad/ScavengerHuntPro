//
//  DiscountEngine.swift
//  ScavengerHuntPro
//
//  Created by Satoof Haj  on 2025-10-14.
//

import Foundation
struct DiscountEngine {
    static func reward(for itemsFound: Int) -> String {
        switch itemsFound {
        case 10:
            return "Congrats! You’re entered into the $5000 Grand Prize Draw!"
        case 7...9:
            return "You earned a 20% discount code!"
        case 5...6:
            return "You earned a 10% discount code!"
        default:
            return "Keep hunting! Find at least 5 items to earn a reward."
        }
    }
}
