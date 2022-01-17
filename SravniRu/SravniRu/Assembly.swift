//
//  Assembly.swift
//  SravniRu
//
//  Created by Marcus on 29.11.2021.
//

import Foundation
import UIKit

///Сборщик экранов
final class Assembly {
    
    /// Сборка экрана "Калькулятор ОСАГО"
    /// - Returns: Возвращает ViewController "Калькулятор ОСАГО"
    static func build() -> UIViewController {
        let viewController = ViewController()
        let router = Router()
        let presenter = Presenter(router: router)
        let interactor = Interactor()
        
        viewController.presenter = presenter
        presenter.viewController = viewController
        presenter.interactor = interactor
        interactor.presenter = presenter
        router.vc = viewController
        return viewController
    }
}
