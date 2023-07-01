//
//  String+Localized.swift
//  carrefour
//
//  Created by Pedro Sousa on 30/06/23.
//

import Foundation

extension String {
    public func localized(bundle: Bundle = Bundle.main) -> String {
        NSLocalizedString(self, tableName: nil, bundle: bundle, value: "", comment: "")
    }
}
