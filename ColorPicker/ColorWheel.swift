//
//  ColorWheel.swift
//  ColorPicker
//
//  Created by Chris Price on 4/15/20.
//  Copyright © 2020 com.chrispriiice. All rights reserved.
//

import UIKit

class ColorWheel: UIControl {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        clipsToBounds = true
        let radius = frame.width / 2.0
        layer.cornerRadius = radius
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.black.cgColor
    }
    
    override func draw(_ rect: CGRect) {
        let size: CGFloat = 1
        for y in stride(from: 0, to: bounds.maxY, by: size) {
            for x in stride(from: 0, to: bounds.maxX, by: size){
                let color = self.color(for: CGPoint(x: x, y: y))
                let pixel = CGRect(x: x, y: y, width: size, height: size) // 1x1 square
                
                color.set() // Says to set the next thing we draw to this color
                UIRectFill(pixel) //It will draw that rectangle with the color we just used.
            }
        }
    }

    private func color(for location: CGPoint) -> UIColor {
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let dy = location.y - center.y
        let dx = location.x - center.x
        let offset = CGPoint(x: dx / center.x, y: dy / center.y)
        let (hue, saturation) = Color.getHueSaturation(at: offset)
        
        return UIColor(hue: hue, saturation: saturation, brightness: 1.0, alpha: 1.0)
    }
}
