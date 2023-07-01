//
//  Int+CGFloat.swift
//  carrefour
//
//  Created by Pedro Sousa on 28/06/23.
//

import Foundation
import CoreGraphics
import UIKit

public extension CGFloat {
    func asFloat() -> Float {
        return Float(self)
    }
    func asInt() -> Int {
        return Int(self)
    }
}
public extension Float {
    func asCGFloat() -> CGFloat {
        return CGFloat(self)
    }
    func asInt() -> Int {
        return Int(self)
    }
}

public extension Int {
    @available(*, deprecated, message: "Use asCGFloat() instead")
    var ptzDS_cgFloat: CGFloat {
        return CGFloat(self)
    }

    func asCGFloat() -> CGFloat {
        return CGFloat(self)
    }
    func asFloat() -> Float {
        return Float(self)
    }
}

public extension Double {
    func asCGFloat() -> CGFloat {
        return CGFloat(self)
    }
    func asFloat() -> Float {
        return Float(self)
    }
    func asInt() -> Int {
        return Int(self)
    }
}
