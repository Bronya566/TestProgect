//
//  Interactor.swift
//  SravniRu
//
//  Created by Marcus on 29.11.2021.
//

import Foundation

/// Протокол Interactor-а
protocol InteractorProtocol {
    
    /// Загрузка данных
    func getData()
    
    /// Расчет итоговой стоимости
    /// - Parameter baseModel: модель коэффициентов
    /// - Returns: Возврат финальной цены
    func calculateFinalPrice(baseModel: BaseCoefficientModel?)-> String
}

///Interactor экрана "Калькулятор ОСАГО"
final class Interactor: InteractorProtocol {
    
    ///Presentor экрана "Калькулятор ОСАГО"
    weak var presenter: PresenterInputProtocol?
    
    func calculateFinalPrice(baseModel: BaseCoefficientModel?)-> String {
        let model = CalculateDataModel.shared
        let baseTariff = baseModel?.baseTarif?.split(separator: "-")
        var minTarif = String(baseTariff?.first ?? "").replacingOccurrences(of: " ", with: "")
        let minTarifDouble = Double(minTarif) ?? 1
        var maxTarif = String(baseTariff?.last ?? "")
        maxTarif.removeLast()
        maxTarif = maxTarif.replacingOccurrences(of: " ", with: "")
        let maxTarifDouble = Double(maxTarif) ?? 1
        
        guard let town = model.town?.coefficient.replacingOccurrences(of: ",", with: "."), let power = model.power?.coefficient.replacingOccurrences(of: ",", with: "."), let driver = model.driver?.coefficient.replacingOccurrences(of: ",", with: "."), let ageAndExperience = model.calculateCoefficientForAgeAndExperience(), let noCrash = model.noCrash?.coefficient.replacingOccurrences(of: ",", with: ".") else {return ""}
        let doubleTown = Double(town) ?? 1
        let doublePower = Double(power) ?? 1
        let doubleDriver = Double(driver) ?? 1
        let doubleAgeAndExperience = Double(ageAndExperience) ?? 1
        let doubleNoCrash = Double(noCrash) ?? 1
        let coefficient = doubleTown * doublePower * doubleDriver * doubleAgeAndExperience * doubleNoCrash
        
        minTarif = String(Int((minTarifDouble * coefficient).rounded(.up)))
        maxTarif = String(Int((maxTarifDouble * coefficient).rounded(.up)))
        return minTarif + " - " + maxTarif + " ₽ "
    }
    
    func getData() {
        if let testData = Bundle.main.path(forResource: "test", ofType: "json") {
            do {
                let jsonData = try Data(contentsOf: URL(fileURLWithPath: testData), options: .mappedIfSafe)
                let dataString = String(data: jsonData, encoding: .utf8) ?? ""
                let jsonResult = try
                JSONDecoder().decode(BaseCoefficientModel.self, from: dataString.data(using: .utf8) ?? jsonData)
                presenter?.endModelLoading(model: jsonResult)
            }
            catch {
                presenter?.unableGetData()
                print(error)
            }
        }
    }
}
