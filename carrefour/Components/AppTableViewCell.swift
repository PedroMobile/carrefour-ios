//
//  AppTableViewCell.swift
//  carrefour
//
//  Created by Pedro Sousa on 30/06/23.
//

import UIKit

final class AppTableViewCell: UITableViewCell, ViewCode {
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    func buildViewHierarchy() {
        contentView.addSubview(nameLabel)
    }
    
    func setupConstraint() {
        setUserNameConstraints()
    }
    
    private func setUserNameConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: .AppSpacings.spacingSm).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -.AppSpacings.spacingSm).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: .AppSpacings.spacingSm).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: .AppSpacings.spacingSm).isActive = true
    }
    
    func setupAdditionalConfiguration() {
        selectionStyle = .none
        backgroundColor = .clear
    }
    
    func setupCell(text: String) {
        nameLabel.text = text
    }
    
    func setupCell(label: String, value: String) {
        nameLabel.attributedText = NSMutableAttributedString()
            .bold("\(label):")
            .normal(" \(value)")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


