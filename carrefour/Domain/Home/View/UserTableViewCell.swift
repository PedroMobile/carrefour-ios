//
//  UserTableViewCell.swift
//  carrefour
//
//  Created by Pedro Sousa on 30/06/23.
//

import UIKit
import AlamofireImage

final class UserTableViewCell: UITableViewCell, ViewCode {
    
    private lazy var cardView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = .AppSpacings.spacingSm
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = .AppBorders.borderSm
        view.layer.cornerRadius = .AppRoundings.roundedXs
        
        return view
    }()
    
    private lazy var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = .AppRoundings.roundedMd
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    func buildViewHierarchy() {
        contentView.addSubview(cardView)
        cardView.addArrangedSubview(userImageView)
        cardView.addArrangedSubview(nameLabel)
    }
    
    func setupConstraint() {
        setContentViewConstraints()
        setCardConstraints()
        setUserImageConstraints()
        setUserNameConstraints()
    }
    
    private func setContentViewConstraints() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
    
    private func setCardConstraints() {
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: .AppSpacings.spacing2xs).isActive = true
        cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        cardView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: .AppSpacings.spacing3xs).isActive = true
        cardView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -.AppSpacings.spacing3xs).isActive = true
    }
    
    private func setUserImageConstraints() {
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        userImageView.heightAnchor.constraint(equalToConstant: 64).isActive = true
        userImageView.widthAnchor.constraint(equalToConstant: 64).isActive = true
        
    }
    
    private func setUserNameConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerYAnchor.constraint(equalTo: userImageView.centerYAnchor).isActive = true
    }
    
    func setupAdditionalConfiguration() {
        selectionStyle = .none
        backgroundColor = .clear
    }
    
    func setupCell(user: User) {
        setImage(for: user.avatarUrl)
        nameLabel.text = user.login
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        userImageView.image = nil
    }
    
    private func setImage(for url: String?) {
        guard let urlString = url, let imageURL = URL(string: urlString) else {
            return
        }
        userImageView.af.setImage(withURL: imageURL)
    }

}
