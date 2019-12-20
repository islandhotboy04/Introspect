//
//  CompletedCheckInCell.swift
//  Introspect
//
//  Created by Andreas Lüdemann on 18/12/2019.
//  Copyright © 2019 Andreas Lüdemann. All rights reserved.
//

import UIKit

class PastCheckInCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var isSelected: Bool {
        didSet { layer.opacity = isSelected ? 0.5 : 1 }
    }

    let dayLabel: UILabel = {
        let label = UILabel()
        label.text = "22"
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .center
        return label
    }()

    let monthLabel: UILabel = {
        let label = UILabel()
        label.text = "Jan"
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .center
        return label
    }()

    let yearLabel: UILabel = {
        let label = UILabel()
        label.text = "2020"
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        label.adjustsFontForContentSizeCategory = true
        label.alpha = 0.5
        label.textAlignment = .center
        return label
    }()

    let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "Feeling good"
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .center
        return label
    }()

    let containerView: UIView = {
        let backgroundView = UIView()

        backgroundView.backgroundColor = .systemTeal
        backgroundView.layer.shadowOffset = .init(width: backgroundView.frame.width + 2, height: backgroundView.frame.height + 2)
        backgroundView.layer.cornerRadius = 4
        backgroundView.layer.shadowRadius = 4
        backgroundView.layer.shadowOpacity = 0.23
        backgroundView.layer.shadowColor = UIColor.black.cgColor

        return backgroundView
    }()

    private lazy var dateView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [dayLabel, monthLabel, yearLabel])
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        return stackView
    }()

    func setupViews() {
        containerView.addSubviews(dateView, ratingLabel)
        contentView.addSubview(containerView)

        containerView.anchor(top: topAnchor,
                             leading: leadingAnchor,
                             bottom: bottomAnchor,
                             trailing: trailingAnchor,
                             padding: .init(top: 8, left: 4, bottom: 8, right: 4))

        containerView.layoutMargins = .init(top: 24, left: 24, bottom: 36, right: 24)

        dateView.anchor(top: containerView.layoutMarginsGuide.topAnchor,
                        leading: containerView.layoutMarginsGuide.leadingAnchor,
                        bottom: nil,
                        trailing: nil)

        ratingLabel.anchor(top: nil,
                           leading: containerView.layoutMarginsGuide.leadingAnchor,
                           bottom: containerView.layoutMarginsGuide.bottomAnchor,
                           trailing: containerView.layoutMarginsGuide.trailingAnchor)
    }
}
