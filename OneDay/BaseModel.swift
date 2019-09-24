
//
//  BaseModel.swift
//  OneDay
//
//  Created by le tong on 2019/9/24.
//  Copyright © 2019 iOS. All rights reserved.
//

import UIKit

class BaseModel: NSObject {
    var name: String
    var content: String
    var isSelected: Bool
    
    init(name: String, content: String, isSelected: Bool) {
        self.name = name
        self.content = content
        self.isSelected = isSelected
    }
}

