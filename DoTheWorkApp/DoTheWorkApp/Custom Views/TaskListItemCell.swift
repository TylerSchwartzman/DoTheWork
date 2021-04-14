//
//  TaskListItemCell.swift
//  DoTheWorkApp
//
//  Created by Tyler Schwartzman on 4/13/21.
//

import UIKit

class TaskListItemCell: UITableViewCell {
    
    private var defaultPadding: CGFloat = 8
    
    let cardView = CardView()
    let titleLabel = UILabel.makeLabel(for: .headline)
    let notificationLabel = UILabel.makeLabel(for: .subheadline)
    
    private lazy var vStack = makeVStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        contentView.backgroundColor = .secondarySystemBackground
        notificationLabel.textColor = .secondaryLabel
        addSubviews()
        configureCardView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        contentView.addSubview(cardView)
        cardView.addSubview(vStack)
    }
    
    private func setConstraints() {
        setCardViewConstraints()
        setVStackConstraints()
        setLabelWidthConstraints()
    }
    
    private func configureCardView() {
        cardView.cornerRadius = 20
        cardView.shadowRadius = 6
        cardView.shadowOpacity = 0.2
        cardView.shadowOffset =  CGSize(width: 0.0, height: 0.0)
        cardView.backgroundColor = .systemBackground
    }
    
    private func setCardViewConstraints() {
        cardView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: defaultPadding),
            cardView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -defaultPadding),
        ])
    }
    
    private func setVStackConstraints() {
        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: cardView.topAnchor, constant: defaultPadding),
            vStack.leadingAnchor.constraint(equalTo: cardView.layoutMarginsGuide.leadingAnchor),
            vStack.trailingAnchor.constraint(equalTo: cardView.layoutMarginsGuide.trailingAnchor),
            vStack.bottomAnchor.constraint(equalTo: cardView.layoutMarginsGuide.bottomAnchor, constant: -defaultPadding),
        ])
    }
    
    private func setLabelWidthConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: vStack.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: vStack.trailingAnchor),
            
            notificationLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            notificationLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        ])
    }
    
    // MARK: Helpers
    private func makeVStackView() -> UIStackView {
        let vStack = UIStackView(arrangedSubviews: [titleLabel, notificationLabel])
        vStack.axis = .vertical
        vStack.spacing = 2
        vStack.translatesAutoresizingMaskIntoConstraints = false
        return vStack
    }
    
}
