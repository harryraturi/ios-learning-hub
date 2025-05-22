//
//  WishModel.swift
//  Wishlist
//
//  Created by Harish Rathuri on 22/05/25.
//

import Foundation
import SwiftData

@Model
class Wish {
    var title: String
    
    init(title: String) {
        self.title = title
    }
}
