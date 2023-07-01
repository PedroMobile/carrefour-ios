//
//  ViewCode.swift
//  carrefour
//
//  Created by Pedro Sousa on 28/06/23.
//

import UIKit

protocol ViewCode: UIView {
    func buildViewHierarchy()
    func setupConstraint()
    func setupAdditionalConfiguration()
    func setupView()
}

extension ViewCode {
    func setupView() {
        buildViewHierarchy()
        setupConstraint()
        setupAdditionalConfiguration()
    }
}
