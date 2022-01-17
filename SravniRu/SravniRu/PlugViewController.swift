//
//  Plug.swift
//  SravniRu
//
//  Created by Marcus on 06.12.2021.
//

import Foundation
import UIKit

/// Контроллер заглушка
final class PlugViewController: UIViewController {
    
    /// Тип данных
    var dataType: CalculateDataModel.DataType?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorsConstants.mainBackgroundColor
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let model = CalculateDataModel.shared
        switch dataType {
        case.town :
            model.town = CoefficientModel(coefficientType: .town, coefficientName: TextConstants.textTownModel, coefficient: "1,99")
        case.power :
            model.power = CoefficientModel(coefficientType: .power, coefficientName: TextConstants.textPowerModel, coefficient: "1,6")
        case.driver :
            model.driver = CoefficientModel(coefficientType: .driver, coefficientName: TextConstants.textDriverModel, coefficient: "1")
        case.age :
            model.age = CoefficientModel(coefficientType: .age, coefficientName: TextConstants.textAgeModel, coefficient: "0,48")
        case.minExperience :
            model.minExperience = CoefficientModel(coefficientType: .minExperience, coefficientName: TextConstants.textMinExperience, coefficient: "2")
        case.noCrash:
            model.noCrash = CoefficientModel(coefficientType: .noCrash, coefficientName: TextConstants.textNoCrash, coefficient: "0,8")
        default: return
        }
    }
}

