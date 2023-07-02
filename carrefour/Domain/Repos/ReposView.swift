//
//  ReposView.swift
//  carrefour
//
//  Created by Pedro Sousa on 30/06/23.
//

import UIKit

class ReposView: UIView, ViewCode {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.separatorStyle = .singleLine
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
        addSubview(tableView)
        addSubview(loadingView)
    }
    
    func setupConstraint() {
        setTableViewContraints()
        setLoadingViewContraints()
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .white
        tableView.backgroundColor = .clear
        tableView.register(AppTableViewCell.self, forCellReuseIdentifier: "\(AppTableViewCell.self)")
    }
    
    // MARK: - Constraints
    
    private func setTableViewContraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
    
    private func setLoadingViewContraints() {
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        loadingView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        loadingView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    // MARK: Methods
    
}
