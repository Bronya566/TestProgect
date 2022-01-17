//
//  CoefficientCustomCell.swift
//  SravniRu
//
//  Created by Marcus on 03.12.2021.
//

import Foundation
import UIKit

/// Ячейка отображения коэффициентов
final class CoefficientCustomCell: UITableViewCell, TableViewCellProtocol {
    
    private var backView: UIView = {
        let backView = UIView()
        backView.backgroundColor = ColorsConstants.backgroundCellColor
        return backView
    }()
    
    private var coefficientNameLabel: UILabel = {
        var coefficientNameLabel = UILabel()
        coefficientNameLabel.textColor = ColorsConstants.labelTextCoefficientColor
        coefficientNameLabel.font = FontsConstants.coefficientNameLabelFont
        return coefficientNameLabel
    }()
    
    private var coefficientNameTitle: UILabel = {
        var coefficientNameTitle = UILabel()
        coefficientNameTitle.textColor = ColorsConstants.titleTextCoefficientColor
        coefficientNameTitle.font = FontsConstants.coefficientNameTitleFont
        return coefficientNameTitle
    }()
    
    private var coefficientNameSubtitle: UILabel = {
        var coefficientNameSubtitle = UILabel()
        coefficientNameSubtitle.textColor = ColorsConstants.subtitleTextCoefficientColor
        coefficientNameSubtitle.font = FontsConstants.coefficientNameSubtitleFont
        coefficientNameSubtitle.numberOfLines = 0
        return coefficientNameSubtitle
    }()
    
    private var coefficientPriceLabel: UILabel = {
        var coefficientPriceLabel = UILabel()
        coefficientPriceLabel.textColor = ColorsConstants.labelPriceTextCoefficientColor
        coefficientPriceLabel.font = FontsConstants.coefficientPriceLabelFont
        coefficientPriceLabel.textAlignment = .right
        return coefficientPriceLabel
    }()
    
    /// Инициализотор ячейки
    /// - Parameters:
    ///   - titleName: Название коэффициента
    ///   - titleDescription: Описание коэффициента
    ///   - subtitle: Порядок расчета коэффициента
    ///   - price:  Коэффициент
    init(titleName: String, titleDescription: String, subtitle: String, price: String) {
        super.init(style: .value2, reuseIdentifier: nil)
        isUserInteractionEnabled = false
        coefficientNameLabel.text = titleName
        coefficientNameTitle.text = titleDescription
        coefficientNameSubtitle.text = subtitle
        coefficientPriceLabel.text = price
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = ColorsConstants.mainBackgroundColor
        contentView.addSubview(backView)
        backView.addSubview(coefficientNameLabel)
        backView.addSubview(coefficientNameTitle)
        backView.addSubview(coefficientNameSubtitle)
        backView.addSubview(coefficientPriceLabel)
        setupConstraints()
    }
    
    private func setupConstraints() {
        backView.translatesAutoresizingMaskIntoConstraints = false
        coefficientNameLabel.translatesAutoresizingMaskIntoConstraints = false
        coefficientNameTitle.translatesAutoresizingMaskIntoConstraints = false
        coefficientNameSubtitle.translatesAutoresizingMaskIntoConstraints = false
        coefficientPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.backViewLeadingAnchor),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.backViewTrailingAnchor),
            coefficientNameLabel.topAnchor.constraint(equalTo: backView.topAnchor, constant: Constants.coefficientNameLabelTopAnchor),
            coefficientNameLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: Constants.coefficientNameLabelLeadingAnchor),
            coefficientNameLabel.heightAnchor.constraint(equalToConstant: Constants.coefficientNameLabelHeightAnchor),
            coefficientNameTitle.topAnchor.constraint(equalTo: backView.topAnchor, constant: Constants.coefficientNameTitleTopAnchor),
            coefficientNameTitle.leadingAnchor.constraint(equalTo: coefficientNameLabel.trailingAnchor, constant: Constants.coefficientNameTittleLeadingAnchor),
            coefficientNameTitle.bottomAnchor.constraint(equalTo: coefficientNameLabel.bottomAnchor, constant: Constants.coefficientNameTittleBottomAnchor),
            coefficientNameSubtitle.trailingAnchor.constraint(equalTo: coefficientPriceLabel.leadingAnchor, constant: Constants.coefficientNameSubtitleTrailingAnchor),
            coefficientNameSubtitle.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: Constants.coefficientNameSubtitleLeadingAnchor),
            coefficientNameSubtitle.topAnchor.constraint(equalTo: coefficientNameLabel.bottomAnchor, constant: Constants.coefficientNameSubtitleTopAnchor),
            coefficientNameSubtitle.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: Constants.coefficientNameSubtitleBottomAnchor),
            coefficientPriceLabel.centerYAnchor.constraint(equalTo: backView.centerYAnchor),
            coefficientPriceLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: Constants.coefficientPriceLabelTrailingAnchor)
        ])
    }

    enum Constants {
        static let backViewLeadingAnchor: CGFloat = 16
        
        static let backViewTrailingAnchor: CGFloat = -16
        /// Верхний отступ для  названия коэффициента
        static let coefficientNameLabelTopAnchor: CGFloat = 16
        /// Левый отступ для  названия коэффициента
        static let coefficientNameLabelLeadingAnchor: CGFloat = 16
        /// Высота  для  названия коэффициента
        static let coefficientNameLabelHeightAnchor: CGFloat = 20
        /// Верхний отступ для  описания коэффициента
        static let coefficientNameTitleTopAnchor: CGFloat = 16
        /// Левый отступ для  описания коэффициента
        static let coefficientNameTittleLeadingAnchor: CGFloat = 4
        /// Нижний отступ для  описания коэффициента
        static let coefficientNameTittleBottomAnchor: CGFloat = 1
        /// Верхний отступ для  порядка расчета коэффициента
        static let coefficientNameSubtitleTopAnchor: CGFloat = 4
        /// Левый отступ для  порядка расчета коэффициента
        static let coefficientNameSubtitleLeadingAnchor: CGFloat = 16
        
        static let coefficientNameSubtitleTrailingAnchor: CGFloat = -20
        
        /// Ширина для  порядка расчета коэффициента
        static let coefficientNameSubtitleWidhtAnchor: CGFloat = 207
        /// Нижний отступ для порядка расчета коэффициента
        static let coefficientNameSubtitleBottomAnchor: CGFloat = 0
        /// Верхний отступ для итогового значения коэффициента
        static let coefficientPriceLabelTopAnchor: CGFloat = 10
        /// Правый отступ для итогового значения коэффициента
        static let coefficientPriceLabelTrailingAnchor: CGFloat = -16
        /// Ширина  для итогового значения коэффициента
        static let coefficientPriceLabelHeightAnchor: CGFloat = 20
    }
}
