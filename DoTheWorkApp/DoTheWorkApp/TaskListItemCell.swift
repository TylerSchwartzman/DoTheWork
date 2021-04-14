//
//  TaskListItemCell.swift
//  DoTheWorkApp
//
//  Created by Tyler Schwartzman on 4/13/21.
//

import UIKit

class TaskListItemCell: UITableViewCell {
    
    let titleLabel = UILabel.makeLabel(for: .headline)
    
    let notificationLabel = UILabel.makeLabel(for: .subheadline)
    
    private lazy var vStack = makeVStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        notificationLabel.textColor = .secondaryLabel
        contentView.addSubview(vStack)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeVStackView() -> UIStackView {
        let vStack = UIStackView(arrangedSubviews: [titleLabel, notificationLabel])
        vStack.axis = .vertical
        vStack.translatesAutoresizingMaskIntoConstraints = false
        return vStack
    }
    
    private func setConstraints() {
        setLabelWidthConstraints()
        setVStackConstraints()
    }
    
    private func setLabelWidthConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            
            notificationLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            notificationLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        ])
    }
    
    private func setVStackConstraints() {
        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            vStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            vStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            vStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
}

private extension UILabel {
    static func makeLabel(for textStyle: UIFont.TextStyle) -> UILabel {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: textStyle)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        return label
    }
}
