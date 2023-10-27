//
//  Extension + UIFont.swift
//  Heroes
//
//  Created by Kirill Taraturin on 27.10.2023.
//

import UIKit

enum Font: String {
    case nosifer = "Nosifer-Regular"
    case permanent = "PermanentMarker-Regular"
    case metal = "MetalMania-Regular"
}

extension UIFont {
    static func getFont(_ font: Font, size: CGFloat) -> UIFont? {
        UIFont(name: font.rawValue, size: size)
    }
    
}
