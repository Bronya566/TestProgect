//
//  CustomFinalPriceCell.swift
//  SravniRu
//
//  Created by Marcus on 02.12.2021.
//

import Foundation
import UIKit

/// Ячейка рассчета итоговой стоимости
final class CustomFinalPriceCell: UITableViewCell, TableViewCellProtocol {
    
    /// Действие по тапу на ячейку(Раскрытие)
    var tapAction: ((Bool) -> Void)?
    
    private(set) var isOpen = false
    
    private var backView: UIView = {
        let backView = UIView()
        backView.backgroundColor = ColorsConstants.backgroundCellColor
        return backView
    }()
    
    private let image: UIImageView = {
        var calculatorImage = UIImage(named: "CalculatorImage.pdf")
        var image = UIImageView(image: calculatorImage)
        image.contentMode = .center
        image.backgroundColor = ColorsConstants.mainBackgroundColor
        image.layer.cornerRadius = Constants.imageCornerRadius
        return image
    }()
    
    private let title: UILabel = {
        var title = UILabel()
        title.backgroundColor = ColorsConstants.backgroundCellColor
        title.text = TextConstants.finalPriceTitleLabel
        title.textColor = ColorsConstants.titleTextColor
        title.font = FontsConstants.customFinalPriceTitle
        return title
    }()
    
    private var subtitle: UILabel = {
        var subtitle = UILabel()
        subtitle.backgroundColor = ColorsConstants.backgroundCellColor
        subtitle.textColor = ColorsConstants.subtitleTextColor
        subtitle.font = FontsConstants.customFinalPriceSubtitle
        return subtitle
    }()
    
    private let disclosure: UIImageView = {
        var vectorImage = UIImage(named: "Vector.pdf")
        var disclosure = UIImageView(image: vectorImage)
        return disclosure
    }()
    
    init(subtitle: String?) {
        super.init(style: .value2, reuseIdentifier: nil)
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap))
        addGestureRecognizer(tapRecognizer)
        setupView(subtitle: subtitle)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Обновление сабтитл
    func updateSubtitle(subtitle: String) {
        self.subtitle.text = subtitle
    }

    private func setupView(subtitle: String?) {
        self.subtitle.text = subtitle
        contentView.backgroundColor = ColorsConstants.mainBackgroundColor
        contentView.addSubview(backView)
        backView.addSubview(image)
        backView.addSubview(disclosure)
        backView.addSubview(title)
        backView.addSubview(self.subtitle)
        setupConstraints()
    }
    
    private func setupConstraints() {
        backView.translatesAutoresizingMaskIntoConstraints = false
        image.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        disclosure.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.backViewLeadingAnchor),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.backViewTrailingAnchor),
            image.topAnchor.constraint(equalTo: backView.topAnchor, constant: Constants.imageTopAnchor),
            image.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: Constants.imageLeadingAnchor),
            image.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: Constants.imageBottomAnchor),
            image.widthAnchor.constraint(equalToConstant: Constants.imageWidhtAnchor),
            disclosure.centerYAnchor.constraint(equalTo: backView.centerYAnchor),
            disclosure.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: Constants.disclosureTrailingAnchor),
            disclosure.widthAnchor.constraint(equalToConstant: Constants.disclosureWidthAnchor),
            title.topAnchor.constraint(equalTo: backView.topAnchor, constant: Constants.titleTopAnchor),
            title.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: Constants.titleLeadingAnchor),
            title.trailingAnchor.constraint(equalTo: disclosure.leadingAnchor, constant: Constants.titleTrailingAnchor),
            title.heightAnchor.constraint(equalToConstant: Constants.titleHeightAnchor),
            subtitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: Constants.subtitleTopAnchor),
            subtitle.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: Constants.subtitleLeadingAnchor),
            subtitle.trailingAnchor.constraint(equalTo: disclosure.leadingAnchor, constant: Constants.subtitleTrailingAnchor),
            subtitle.bottomAnchor.constraint(equalTo: backView.bottomAnchor)
        ])
    }
    
    @objc private func tap() {
        isOpen.toggle()
        let angle = isOpen ? Double.pi : 2 * Double.pi
        disclosure.transform = CGAffineTransform(rotationAngle: angle)
        tapAction?(isOpen)
    }
    
    enum Constants {
        static let imageCornerRadius: CGFloat = 10
        static let backViewLeadingAnchor: CGFloat = 16
        
        static let backViewTrailingAnchor: CGFloat = -16
        /// Верхний отступ для картинки
        static let imageTopAnchor: CGFloat = 0
        /// Нижний отступ для картинки
        static let imageBottomAnchor: CGFloat = 0
        /// Левый отступ для картинки
        static let imageLeadingAnchor: CGFloat = 16
        /// Ширина для картинки
        static let imageWidhtAnchor: CGFloat = 36
        /// Верхний отступ картинки раскрытия
        static let disclosureTopAnchor: CGFloat = 31
        /// Нижний отступ картинки раскрытия
        static let disclosureBottomAnchor: CGFloat = -31
        /// Правый отступ картинки раскрытия
        static let disclosureTrailingAnchor: CGFloat = -20
        /// Ширина для картинки раскрытия
        static let disclosureWidthAnchor: CGFloat = 12
        /// Верхний отступ заголовка ячейки расчета итоговой стоимости
        static let titleTopAnchor: CGFloat = 0
        /// Правый отступ заголовка ячейки расчета итоговой стоимости
        static let titleTrailingAnchor: CGFloat = -16
        /// Левый отступ заголовка ячейки расчета итоговой стоимости
        static let titleLeadingAnchor: CGFloat = 12
        /// Высота заголовка ячейки расчета итоговой стоимости
        static let titleHeightAnchor: CGFloat = 16
        /// Верхний отступ для текста  формулы расчета итоговой стоимости
        static let subtitleTopAnchor: CGFloat = 2
        /// Левый отступ для текста  формулы расчета итоговой стоимости
        static let subtitleLeadingAnchor: CGFloat = 12
        /// Правый отступ для текста  формулы расчета итоговой стоимости
        static let subtitleTrailingAnchor: CGFloat = -16
    }
}
