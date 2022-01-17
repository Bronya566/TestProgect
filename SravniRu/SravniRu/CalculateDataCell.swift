//
//  CalculateDataCell.swift
//  SravniRu
//
//  Created by Marcus on 06.12.2021.
//

import Foundation
import UIKit

/// Ячейка выбора данных для калькулятора
final class CalculateDataCell: UITableViewCell, TableViewCellProtocol {
    
    /// Тап
    var tapActionDataCell: ((CalculateDataModel.DataType) -> Void)?
    
    private var isDisclosure = false
    private var type: CalculateDataModel.DataType
    
    private var backView: UIView = {
        let backView = UIView()
        backView.backgroundColor = ColorsConstants.backgroundCellColor
        return backView
    }()
    
    private let dataImage: UIView = {
        var dataImage = UIView()
        dataImage.layer.backgroundColor = ColorsConstants.dataImageCalculateDataCellColor
        dataImage.layer.cornerRadius = 12
        return dataImage
    }()
    
    private let dataTitle: UILabel = {
        var dataTitle = UILabel()
        dataTitle.numberOfLines = 0
        return dataTitle
    }()
    
    private let dataDisclosure: UIImageView = {
        var vectorDataImage = UIImage(named: "Vector.pdf")
        var dataDisclosure = UIImageView(image: vectorDataImage)
        return dataDisclosure
    }()
    
    private let dataSubtitle: UILabel = {
        var dataSubtitle = UILabel()
        dataSubtitle.textColor = ColorsConstants.dataSubtitleCalculateDataCellColor
        dataSubtitle.font = FontsConstants.dataSubtitleFont
        dataSubtitle.numberOfLines = 0
        return dataSubtitle
    }()
    
    /// Инициализатор
    /// - Parameters:
    ///   - title: заголовок ячейки
    ///   - isDisclosure: нужна ли стрелка
    ///   - subtitle: сабтитл ячейки
    ///   - type: тип ячейки
    init(title: String, isDisclosure: Bool, subtitle: String?, type: CalculateDataModel.DataType) {
        self.type = type
        super.init(style: .value2, reuseIdentifier: nil)
        dataTitle.text = title
        self.isDisclosure = isDisclosure
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap))
        addGestureRecognizer(tapRecognizer)
        contentView.backgroundColor = ColorsConstants.mainBackgroundColor
        setupView(subtitle: subtitle)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addContentSubview() {
        contentView.addSubview(backView)
        backView.addSubview(dataImage)
        backView.addSubview(dataTitle)
    }
    
    private func setupView(subtitle: String?) {
        guard let subtitle = subtitle else {
            dataTitle.textColor = ColorsConstants.dataTitleCalculateDataCellColor
            addContentSubview()
            if isDisclosure {
                setupConstraints(isSubtitle: false, isDisclosure: true)
            } else {
                setupConstraints(isSubtitle: false, isDisclosure: false)
            }
            return
        }
        dataTitle.textColor = ColorsConstants.dataTitleCalculateDataCellColor
        dataTitle.font = FontsConstants.dataTitleWithDisclosureFont
        dataSubtitle.text = subtitle
        addContentSubview()
        backView.addSubview(dataSubtitle)
        if isDisclosure {
            setupConstraints(isSubtitle: true, isDisclosure: true)
        } else {
            setupConstraints(isSubtitle: true, isDisclosure: false)
        }
    }
    
    private func setupConstraints(isSubtitle: Bool, isDisclosure: Bool) {
        backView.translatesAutoresizingMaskIntoConstraints = false
        dataImage.translatesAutoresizingMaskIntoConstraints = false
        dataTitle.translatesAutoresizingMaskIntoConstraints = false
        
        if isDisclosure {
            contentView.addSubview(dataDisclosure)
            dataDisclosure.translatesAutoresizingMaskIntoConstraints = false
        }
        
        if isSubtitle {
            dataSubtitle.translatesAutoresizingMaskIntoConstraints = false
        }
        
        if isDisclosure {
            NSLayoutConstraint.activate([
                backView.topAnchor.constraint(equalTo: contentView.topAnchor),
                backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.backViewLeadingAnchor),
                backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.backViewTrailingAnchor),
                dataImage.topAnchor.constraint(equalTo: backView.topAnchor, constant: Constants.dataImageTopAnchor),
                dataImage.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: Constants.dataImageleadingAnchor),
                dataImage.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: Constants.dataImageTrailingAnchor),
                dataImage.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: Constants.dataImageBottomAnchor),
                dataImage.heightAnchor.constraint(equalToConstant: Constants.dataImageHeightAnchor),
                dataDisclosure.centerYAnchor.constraint(equalTo: dataImage.centerYAnchor),
                dataDisclosure.trailingAnchor.constraint(equalTo: dataImage.trailingAnchor, constant: Constants.dataDisclosureTrailingAnchor),
                dataDisclosure.widthAnchor.constraint(equalToConstant: Constants.dataDisclosureWithSubtitleWidthAnchor),
            ])
            
            if isSubtitle {
                NSLayoutConstraint.activate([
                    dataTitle.topAnchor.constraint(equalTo: dataImage.topAnchor, constant: Constants.dataTitleWithSubtitleTopAnchor),
                    dataTitle.leadingAnchor.constraint(equalTo: dataImage.leadingAnchor, constant: Constants.dataTitleWithSubtitleLeadingAnchor),
                    dataTitle.trailingAnchor.constraint(equalTo: dataDisclosure.trailingAnchor, constant: Constants.dataTitleWithSubtitleTrailingAnchor),
                    dataSubtitle.leadingAnchor.constraint(equalTo: dataImage.leadingAnchor, constant: Constants.dataSubtitleWithSubtitleLeadingAnchor),
                    dataSubtitle.trailingAnchor.constraint(equalTo: dataDisclosure.leadingAnchor, constant: Constants.dataSubtitleWithSubtitleTrailingAnchor),
                    dataSubtitle.bottomAnchor.constraint(equalTo: dataImage.bottomAnchor, constant: Constants.dataSubtitleWithSubtitleBottomAnchor)
                ])
            } else {
                NSLayoutConstraint.activate([
                    dataTitle.topAnchor.constraint(equalTo: dataImage.topAnchor, constant: Constants.dataTitleWithDisclosureTopAnchor),
                    dataTitle.bottomAnchor.constraint(equalTo: dataImage.bottomAnchor, constant: Constants.dataTitleWithDisclosureBottomAnchor),
                    dataTitle.leadingAnchor.constraint(equalTo: dataImage.leadingAnchor, constant: Constants.dataTitleWithDisclosureLeadingAnchor),
                    dataTitle.trailingAnchor.constraint(equalTo: dataDisclosure.trailingAnchor, constant: Constants.dataTitleWithDisclosureTrailingAnchor)
                ])
            }
            
        } else {
            NSLayoutConstraint.activate([
                backView.topAnchor.constraint(equalTo: contentView.topAnchor),
                backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.backViewLeadingAnchor),
                backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.backViewTrailingAnchor),
                dataImage.topAnchor.constraint(equalTo: backView.topAnchor, constant: Constants.dataImageTopAnchor),
                dataImage.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: Constants.dataImageleadingAnchor),
                dataImage.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: Constants.dataImageTrailingAnchor),
                dataImage.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: Constants.dataImageBottomAnchor),
                dataImage.heightAnchor.constraint(equalToConstant: Constants.dataImageHeightAnchor),
            ])
            
            if isSubtitle {
                NSLayoutConstraint.activate([
                    dataTitle.topAnchor.constraint(equalTo: dataImage.topAnchor, constant: Constants.dataTitleTopAnchor),
                    dataTitle.leadingAnchor.constraint(equalTo: dataImage.leadingAnchor, constant: Constants.dataTitleLeadingAnchor),
                    dataTitle.trailingAnchor.constraint(equalTo: dataImage.trailingAnchor, constant: Constants.dataTitleTrailingAnchor),
                    dataSubtitle.topAnchor.constraint(equalTo: dataTitle.bottomAnchor, constant: Constants.dataSubtitleTopAnchor),
                    dataSubtitle.bottomAnchor.constraint(equalTo: dataImage.bottomAnchor, constant: Constants.dataSubtitleBottomAnchor),
                    dataSubtitle.leadingAnchor.constraint(equalTo: dataImage.leadingAnchor, constant: Constants.dataSubtitleLeadingAnchor),
                    dataSubtitle.trailingAnchor.constraint(equalTo: dataImage.trailingAnchor, constant: Constants.dataSubtitleTrailingAnchor)
                ])
            } else {
                NSLayoutConstraint.activate([
                    dataTitle.topAnchor.constraint(equalTo: dataImage.topAnchor, constant: Constants.dataTitleWithoutDisclosureTopAnchor),
                    dataTitle.bottomAnchor.constraint(equalTo: dataImage.bottomAnchor, constant: Constants.dataTitleWithoutDisclosureBottomAnchor),
                    dataTitle.leadingAnchor.constraint(equalTo: dataImage.leadingAnchor, constant: Constants.dataTitleWithoutDisclosureLeadingAnchor),
                    dataTitle.trailingAnchor.constraint(equalTo: dataImage.trailingAnchor, constant: Constants.dataTitleWithoutDisclosureTrailingAnchor)
                ])
            }
        }
    }
  
    @objc private func tap() {
        tapActionDataCell?(type)
    }
    
    enum Constants {
        static let backViewLeadingAnchor: CGFloat = 16
        static let backViewTrailingAnchor: CGFloat = -16
        static let dataImageTopAnchor: CGFloat = 0
        static let dataImageBottomAnchor: CGFloat = -12
        static let dataImageleadingAnchor: CGFloat = 16
        static let dataImageTrailingAnchor: CGFloat = -16
        static let dataImageHeightAnchor: CGFloat = 60
        static let dataTitleTopAnchor: CGFloat = 10
        static let dataTitleLeadingAnchor: CGFloat = 16
        static let dataTitleTrailingAnchor: CGFloat = -16
        static let dataSubtitleTopAnchor: CGFloat = 2
        static let dataSubtitleBottomAnchor: CGFloat = -10
        static let dataSubtitleLeadingAnchor: CGFloat = 16
        static let dataSubtitleTrailingAnchor: CGFloat = -16
        static let dataDisclosureTrailingAnchor: CGFloat = -27
        static let dataTitleWithDisclosureTopAnchor: CGFloat = 8
        static let dataTitleWithDisclosureBottomAnchor: CGFloat = -8
        static let dataTitleWithDisclosureLeadingAnchor: CGFloat = 16
        static let dataTitleWithDisclosureTrailingAnchor: CGFloat = -20
        static let dataDisclosureWithSubtitleTrailingAnchor: CGFloat = -27
        static let dataDisclosureWithSubtitleWidthAnchor: CGFloat = 12
        static let dataTitleWithSubtitleTopAnchor: CGFloat = 10
        static let dataTitleWithSubtitleLeadingAnchor: CGFloat = 16
        static let dataTitleWithSubtitleTrailingAnchor: CGFloat = -20
        static let dataSubtitleWithSubtitleTopAnchor: CGFloat = -2
        static let dataSubtitleWithSubtitleLeadingAnchor: CGFloat = 16
        static let dataSubtitleWithSubtitleTrailingAnchor: CGFloat = -20
        static let dataSubtitleWithSubtitleBottomAnchor: CGFloat = -10
        static let dataTitleWithoutDisclosureTopAnchor: CGFloat = 8
        static let dataTitleWithoutDisclosureBottomAnchor: CGFloat = -8
        static let dataTitleWithoutDisclosureLeadingAnchor: CGFloat = 16
        static let dataTitleWithoutDisclosureTrailingAnchor: CGFloat = -16
    }
}

