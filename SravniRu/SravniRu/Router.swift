//
//  Router.swift
//  SravniRu
//
//  Created by Marcus on 29.11.2021.
//

import Foundation
import UIKit

/// Протокол переходов
protocol RouterProtocol: AnyObject {
    
    /// Переход на следующий экран
    func nextScreen(type: CalculateDataModel.DataType)
    
    /// Переход на экран расчета итоговой стоимости
    /// - Parameter finalPrice : итоговая стоимость
    func nextScreenFinalPrice(finalPrice: String?)
}

final class Router: RouterProtocol {
    /// базовый вью контроллер
    weak var vc: UIViewController?
    
    func nextScreen(type: CalculateDataModel.DataType) {
        let viewController = PlugViewController()
        viewController.dataType = type
        vc?.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func nextScreenFinalPrice(finalPrice: String?){
        let plugFinalPrice = PlugFinalPriceViewController()
        plugFinalPrice.finalPriceText = finalPrice
        vc?.navigationController?.pushViewController(plugFinalPrice, animated: true)
    }
}

