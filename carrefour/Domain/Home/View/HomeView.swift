//
//  HomeView.swift
//  carrefour
//
//  Created by Pedro Sousa on 28/06/23.
//

import UIKit

protocol HomeViewDelegate {
    func textFieldDidChange(text: String)
}

class HomeView: UIView, ViewCode {
    
    var delegate: HomeViewDelegate?
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 0
        stackView.axis = .vertical
        stackView.distribution  = .fill
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    lazy var searchBarTextField: AppSearchField = {
        let textField = AppSearchField()
        textField.delegate = self
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        return textField
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.separatorStyle = .none
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return tableView
    }()
    
    lazy var loadingView: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView(style: .large)
        activity.hidesWhenStopped = true
        activity.stopAnimating()
        return activity
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
        stackView.addArrangedSubview(searchBarTextField)
        stackView.addArrangedSubview(tableView)
    }
    
    func setupConstraint() {
        setStackViewContraints()
        setLoadingViewContraints()
        setSearchBarTextFieldContraints()
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .white
        tableView.backgroundColor = .clear
        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: "\(UserTableViewCell.self)")
    }
    
    // MARK: - Constraints
    
    private func setStackViewContraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
    
    private func setLoadingViewContraints() {
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        loadingView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        loadingView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    private func setSearchBarTextFieldContraints() {
        searchBarTextField.translatesAutoresizingMaskIntoConstraints = false
        searchBarTextField.leftAnchor.constraint(equalTo: stackView.leftAnchor, constant: .AppSpacings.spacing2xs).isActive = true
        searchBarTextField.rightAnchor.constraint(equalTo: stackView.rightAnchor, constant: -.AppSpacings.spacing2xs).isActive = true
    }
    
    // MARK: Methods
    
    @objc private func textFieldDidChange() {
        if let text = searchBarTextField.text {
            delegate?.textFieldDidChange(text: text.trimmingCharacters(in: .whitespaces))
        }
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
}

extension HomeView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.endEditing(true)
        return false
    }
}
