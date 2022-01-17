//
//  PlugFinalPriceViewController.swift
//  SravniRu
//
//  Created by Marcus on 12.12.2021.
//

import Foundation
import UIKit

/// Контроллер заглушка для показа итоговой стоимости
final class PlugFinalPriceViewController: UIViewController {
    
    /// Итоговая стоимость
    var finalPriceText: String?

    private var finalPriceLabel: UILabel = {
        var finalPriceLabel = UILabel()
        finalPriceLabel.textColor = ColorsConstants.labelTextCoefficientColor
        finalPriceLabel.font = FontsConstants.coefficientNameLabelFont
        return finalPriceLabel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorsConstants.mainBackgroundColor
        setupUI()
    }
    
    private func setupUI() {
        finalPriceLabel.text = finalPriceText
        view.addSubview(finalPriceLabel)
        setupConstraints()
    }
    
    private func setupConstraints() {
        finalPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            finalPriceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            finalPriceLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
