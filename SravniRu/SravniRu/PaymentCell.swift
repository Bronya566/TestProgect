//
//  PaymentCell.swift
//  SravniRu
//
//  Created by Marcus on 06.12.2021.
//

import Foundation
import UIKit

final class PaymentCell: UITableViewCell, TableViewCellProtocol {
    
    /// Действие по тапу
    var tapActionPaymentCell: (() -> Void)?
    
    private var backView: UIView = {
        let backView = UIView()
        backView.backgroundColor = ColorsConstants.backgroundCellColor
        return backView
    }()
    
    private let paymentImage: UIView = {
        var paymentImage = UIView()
        paymentImage.layer.cornerRadius = Constants.paymentImageCornerRadius
        return paymentImage
    }()
    
    private let paymentTitle: UILabel = {
        var paymentTitle = UILabel()
        paymentTitle.font = FontsConstants.paymentTitleFont
        paymentTitle.textAlignment = .center
        return paymentTitle
    }()
    
    /// Инициализатор
    /// - Parameters:
    ///   - title: заголовок ячейки
    ///   - isEnabled: доступна ли ячейка
    init(title: String, isEnabled: Bool) {
        super.init(style: .value2, reuseIdentifier: nil)
        paymentTitle.text = title
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap))
        addGestureRecognizer(tapRecognizer)
        contentView.backgroundColor = ColorsConstants.backgroundCellColor
        setupView(isEnabled: isEnabled)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView(isEnabled: Bool) {
        if isEnabled {
            paymentImage.layer.backgroundColor = ColorsConstants.paymentImageIsEnabledColor
            paymentTitle.textColor = ColorsConstants.paymentTitleIsEnabledColor
            isUserInteractionEnabled = true
            
        } else {
            paymentImage.layer.backgroundColor = ColorsConstants.paymentImageIsNotEnabledColor
            paymentTitle.textColor = ColorsConstants.paymentTitleIsNotEnabledColor
            isUserInteractionEnabled = false
        }
        contentView.backgroundColor = ColorsConstants.mainBackgroundColor
        contentView.addSubview(backView)
        backView.addSubview(paymentImage)
        backView.addSubview(paymentTitle)
        setupConstraints()
    }
    
    
    func setupConstraints() {
        backView.translatesAutoresizingMaskIntoConstraints = false
        paymentImage.translatesAutoresizingMaskIntoConstraints = false
        paymentTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.backViewLeadingAnchor),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.backViewTrailingAnchor),
            paymentImage.topAnchor.constraint(equalTo: backView.topAnchor, constant: Constants.paymentImageTopAnchor),
            paymentImage.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: Constants.paymentImageBottomAnchor),
            paymentImage.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: Constants.paymentImageLeadingAnchor),
            paymentImage.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: Constants.paymentImageTrailingAnchor),
            paymentTitle.topAnchor.constraint(equalTo: paymentImage.topAnchor, constant: Constants.paymentTitleTopAnchor),
            paymentTitle.bottomAnchor.constraint(equalTo: paymentImage.bottomAnchor, constant: Constants.paymentTitleBottomAnchor),
            paymentTitle.leadingAnchor.constraint(equalTo: paymentImage.leadingAnchor, constant: Constants.paymentTitleLeadingAnchor),
            paymentTitle.trailingAnchor.constraint(equalTo: paymentImage.trailingAnchor, constant: Constants.paymentTitleTrailingAnchor)
        ])
    }

    @objc private func tap() {
        tapActionPaymentCell?()
    }
    
    enum Constants {
        static let paymentImageCornerRadius: CGFloat = 12
        static let backViewLeadingAnchor: CGFloat = 16
        static let backViewTrailingAnchor: CGFloat = -16
        static let paymentImageTopAnchor: CGFloat = 4
        static let paymentImageBottomAnchor: CGFloat = 0
        static let paymentImageLeadingAnchor: CGFloat = 16
        static let paymentImageTrailingAnchor: CGFloat = -16
        static let paymentTitleTopAnchor: CGFloat = 18
        static let paymentTitleBottomAnchor: CGFloat = -18
        static let paymentTitleLeadingAnchor: CGFloat = 2
        static let paymentTitleTrailingAnchor: CGFloat = -2
    }
}
