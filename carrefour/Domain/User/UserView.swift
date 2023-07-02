//
//  UserView.swift
//  carrefour
//
//  Created by Pedro Sousa on 30/06/23.
//

import UIKit

class UserView: UIView, ViewCode {
    
    var goToReposPage: (() -> ())?
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 0
        stackView.axis = .vertical
        stackView.distribution  = .fill
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    lazy var loadingView: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView(style: .large)
        activity.hidesWhenStopped = true
        activity.stopAnimating()
        return activity
    }()
    
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
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.separatorStyle = .none
        tableView.contentInset = UIEdgeInsets(top: 0, left: -.AppSpacings.spacingSm, bottom: 0, right: 0)
        return tableView
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton(configuration: .filled(), primaryAction: nil)
        button.setTitle(Constants.User.reposButton.localized, for: .normal)
        button.addTarget(self, action: #selector(goToRepos), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - ViewCode
    
    func buildViewHierarchy() {
        addSubview(stackView)
        addSubview(loadingView)
        cardView.addArrangedSubview(userImageView)
        cardView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(cardView)
        stackView.addArrangedSubview(tableView)
        stackView.addArrangedSubview(button)
        
    }
    
    func setupConstraint() {
        setStackViewContraints()
        setLoadingViewContraints()
        setUserImageConstraints()
        setUserNameConstraints()
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .white
        tableView.backgroundColor = .clear
        tableView.register(AppTableViewCell.self, forCellReuseIdentifier: "\(AppTableViewCell.self)")
        
    }
    
    // MARK: - Constraints
    
    private func setStackViewContraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: .AppSpacings.spacingSm).isActive = true
        stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: .AppSpacings.spacingSm).isActive = true
        stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: .AppSpacings.spacingSm).isActive = true
        stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -.AppSpacings.spacingSm).isActive = true
    }
    
    private func setLoadingViewContraints() {
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        loadingView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        loadingView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
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
    
    // MARK: Methods
    
    func bind(user:UserInfo) {
        setImage(for: user.avatarUrl)
        nameLabel.text = user.login
        tableView.reloadData()
    }
    
    private func setImage(for url: String?) {
        guard let urlString = url, let imageURL = URL(string: urlString) else {
            return
        }
        userImageView.af.setImage(withURL: imageURL)
    }
    
    @objc func goToRepos() {
        goToReposPage?()
    }
}
