//
//  AppSearchField.swift
//  carrefour
//
//  Created by Pedro Sousa on 30/06/23.
//

import UIKit

class AppSearchField: UITextField {

    private var withoutRightIcon: Bool = false
    private let padding: UIEdgeInsets = UIEdgeInsets(
        top: .AppSpacings.spacingSm,
        left: .AppSpacings.spacingMd,
        bottom: .AppSpacings.spacingSm,
        right: .AppSpacings.spacing2xl
    )
    
    private let paddingWithoutBarcode: UIEdgeInsets = UIEdgeInsets(
        top: .AppSpacings.spacingSm,
        left: .AppSpacings.spacingMd,
        bottom: .AppSpacings.spacingSm,
        right: .AppSpacings.spacingSm
    )

    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.borderWidth = .AppBorders.borderSm
        layer.borderColor = AppTokens.colorNeutralLight.cgColor
        layer.cornerRadius = .AppRoundings.roundedMd
        textColor = .AppColorNeutralDark
        attributedPlaceholder = NSAttributedString(string: Constants.Home.searchTextField.localized, attributes: [NSAttributedString.Key.foregroundColor: UIColor.AppColorNeutralDark])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func withoutRightIcon(_ withoutBarcode: Bool) {
        self.withoutRightIcon = withoutBarcode
    }

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        if withoutRightIcon {
            return bounds.inset(by: paddingWithoutBarcode)
        }
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        if withoutRightIcon {
            return bounds.inset(by: paddingWithoutBarcode)
        }
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        if withoutRightIcon {
            return bounds.inset(by: paddingWithoutBarcode)
        }
        return bounds.inset(by: padding)
    }
}
