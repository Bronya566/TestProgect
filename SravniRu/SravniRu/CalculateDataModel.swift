//
//  CalculateDataModel.swift
//  SravniRu
//
//  Created by Marcus on 07.12.2021.
//

import Foundation

/// Модель для подставления значений в ячейку после возврата с заглушки
final class CalculateDataModel {
    
    /// Типы ячеек
    enum DataType {
        /// Город
        case town
        /// Мощность
        case power
        ///  Водитель
        case driver
        /// Возраст водителя
        case age
        /// Минимальный стаж
        case minExperience
        /// Безаварийность
        case noCrash
    }

    static var shared: CalculateDataModel = {
        let model = CalculateDataModel()
        return model
    }()
    
    private init() {}
    
    /// Модель города
    var town: CoefficientModel?
    /// Модель мощности
    var power: CoefficientModel?
    /// Модель водителей
    var driver: CoefficientModel?
    /// Модель возраста водителей
    var age: CoefficientModel?
    /// Модель минимального стажа
    var minExperience: CoefficientModel?
    /// Модель безаварийности
    var noCrash: CoefficientModel?
    
    /// Расчет коэффициента КВС
    func calculateCoefficientForAgeAndExperience() -> String? {
        guard let age = age?.coefficient.replacingOccurrences(of: ",", with: "."), let minExperience = minExperience?.coefficient.replacingOccurrences(of: ",", with: "."),
              let doubleAge = Double(age), let doubleMinExp = Double(minExperience)else { return nil }
        return String(doubleAge * doubleMinExp).replacingOccurrences(of: ".", with: ",")
    }
}

/// Модель для подстановки коээфициентов
struct CoefficientModel {
    /// Тип коэффициента
    var coefficientType: CalculateDataModel.DataType
    /// Имя коэффициента
    var coefficientName: String
    /// Коэффициент
    var coefficient: String
}
