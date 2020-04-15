//
//  Color.swift
//  ColorPicker
//
//  Created by Chris Price on 4/15/20.
//  Copyright © 2020 com.chrispriiice. All rights reserved.
//

import UIKit

struct Color {
    static func getHueSaturation(at offset: CGPoint) -> (hue: CGFloat, saturation: CGFloat) {
        if offset == CGPoint.zero {
            return (hue: 0, saturation: 0)
        } else {
            let saturation = sqrt(offset.x * offset.x + offset.y * offset.y)
            var hue = acos(offset.x / saturation) / (2.0 * CGFloat.pi)
            if offset.y < 0 {
                hue = 1.0 - hue
            }
            
            return (hue: hue, saturation: saturation)
        }
    }
}
