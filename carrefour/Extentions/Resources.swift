//
//  Resources.swift
//  carrefour
//
//  Created by Pedro Sousa on 30/06/23.
//

import Foundation

private class BundleFinder {}

@objc
public class Resources: NSObject {
   @objc public class var bundle: Bundle {
         return Bundle(for: BundleFinder.self)
   }
}

