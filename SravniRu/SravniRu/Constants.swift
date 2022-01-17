//
//  Constants.swift
//  SravniRu
//
//  Created by Marcus on 01.12.2021.
//

import Foundation
import UIKit
enum ColorsConstants {
    /// Цвет для фона экрана "Калькулятор ОСАГО"
    static let mainBackgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
    /// Цвет для текста заголовка ячейки экрана "Калькулятор ОСАГО"
    static let titleTextColor = UIColor(red: 0.6, green: 0.631, blue: 0.671, alpha: 1)
    /// Цвет для текста  формулы расчета итоговой стоимости экрана "Калькулятор ОСАГО"
    static let subtitleTextColor = UIColor(red: 0, green: 0.686, blue: 1, alpha: 1)
    /// Цвет для ячейки экрана "Калькулятор ОСАГО"
    static let backgroundCellColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    /// Цвет для названия коэффициента экрана "Калькулятор ОСАГО"
    static let labelTextCoefficientColor = UIColor(red: 0.078, green: 0.141, blue: 0.22, alpha: 1)
    /// Цвет для описания текста коэффициента экрана "Калькулятор ОСАГО"
    static let titleTextCoefficientColor = UIColor(red: 0.6, green: 0.631, blue: 0.671, alpha: 1)
    /// Цвет  текста для  порядка расчета коэффициента экрана "Калькулятор ОСАГО"
    static let subtitleTextCoefficientColor = UIColor(red: 0.388, green: 0.435, blue: 0.49, alpha: 1)
    /// Цвет  текста для итогового значения  коэффициента экрана "Калькулятор ОСАГО"
    static let labelPriceTextCoefficientColor = UIColor(red: 0.078, green: 0.141, blue: 0.22, alpha: 1)
    /// Цвет фона для ячейки расчета итоговой стоимости
    static let dataImageCalculateDataCellColor = UIColor(red: 0.957, green: 0.969, blue: 0.984, alpha: 1).cgColor
    /// Цвет сабтитла для ячейки расчета итоговой стоимости
    static let dataSubtitleCalculateDataCellColor = UIColor(red: 0.078, green: 0.141, blue: 0.22, alpha: 1)
    /// Цвет титла для ячейки расчета итоговой стоимости
    static let dataTitleCalculateDataCellColor = UIColor(red: 0.388, green: 0.435, blue: 0.49, alpha: 1)
    /// Цвет для фона кнопки когда она видима
    static let paymentImageIsEnabledColor = UIColor(red: 0, green: 0.686, blue: 1, alpha: 1).cgColor
    /// Цвет текста когда кнопка видна
    static let paymentTitleIsEnabledColor =  UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    /// Цвет фона кнопки когда она не видима
    static let paymentImageIsNotEnabledColor = UIColor(red: 0.957, green: 0.969, blue: 0.984, alpha: 1).cgColor
    /// Цвет текста когда кнопка не видна
    static let paymentTitleIsNotEnabledColor =  UIColor(red: 0.702, green: 0.729, blue: 0.765, alpha: 1)
}

enum TextConstants {
        /// Текст для заголовка ячейки расчета итоговой стоимости
        static let finalPriceTitleLabel = "Ваши коэффициенты"
        /// Текст для  формулы расчета итоговой стоимости
        static let finalPriceSubtitleLabel = "БТхКМхКТхКБМхКВСхКО"
        /// Текст для названия коэффициента
        static let coefficientTitles = ["БТ","КМ", "КТ", "КБМ", "КВС", "КО" ]
        /// Текст для названия экрана "Калькулятор ОСАГО"
        static let screenTitle = "Калькулятор ОСАГО"
        /// Текст для описания коэффициента
        static let coefficientDiscriptions = ["(базовый тариф)", "(коэфф. мощности)", "(территориальный коэфф.)", "(коэфф. безаварийности)", "(коэфф. возраст/стаж)","(коэфф. ограничений)"]
        /// Текст для порядка расчета коэффициента
        static let coefficientSubtitles = [ "Устанавливает страховая компания", "Чем мощнее автомобиль,тем дороже страховой полис", "Определяется по прописке собственника автомобиля", "Учитывается только самый высокий коэффициент из всех водителей" , "Чем больше возраст и стаж у вписанного в полис водителя, тем дешевле будет полис", "Полис с ограниченным списком водителей будет стоить дешевле"]
        /// Текст для ячейки расчета итоговой стоимости с раскрывашкой
        static let textCalculateDataCellWithDisclosure = ["Город регистрации собственника", "Мощность автомобиля", "Сколько водителей"]
    /// Текст для ячейки расчета итоговой стоимости без раскрывашки
        static let textCalculateDataCellWithOutDisclosure = ["Возраст младшего из водителей", "Минимальный стаж водителей", "Сколько лет не было аварий"]
    /// Текст для кнопки "Рассчитать ОСАГО"
        static let textPaymentCell = "Рассчитать ОСАГО"
    /// Текст для подстановки в ячейку "Город регистрации собственника"
        static let textTownModel = "Москва"
    /// Текст для подстановки в ячейку "Мощность автомобиля"
        static let textPowerModel = "121-150 л.с."
    /// Текст для подстановки в ячейку "Сколько водителей"
        static let textDriverModel = "от 1-го до 5-ти водителей"
    /// Текст для подстановки в ячейку "Возраст младшего из водителей"
        static let textAgeModel = "30 лет"
    /// Текст для подстановки в ячейку "Минимальный стаж водителей"
        static let textMinExperience = "2 года"
    /// Текст для подстановки в ячейку "Сколько лет не было аварий"
        static let textNoCrash = "2 года"
}

enum FontsConstants {
    /// Шрифт для коэффициента
    static let coefficientNameLabelFont = UIFont(name: "SFProText-Semibold", size: 17)
    /// Шрифт для расшифровки сокращения коэффициента
    static let coefficientNameTitleFont = UIFont(name: "SFProText-Regular", size: 13)
    /// Шрифт для описания коэффициента
    static let coefficientNameSubtitleFont = UIFont(name: "SFProText-Regular", size: 13)
    /// Шрифт для значения коэффициента
    static let coefficientPriceLabelFont = UIFont(name: "SFProText-Semibold", size: 17)
    /// Шрифт для текста кнопки
    static let paymentTitleFont = UIFont(name: "SFProText-Semibold", size: 17)
    /// Шрифт для сабтитла ячейки расчета итоговой стоимости
    static let dataSubtitleFont = UIFont(name: "SFProText-Regular", size: 17)
    /// Шрифт для титла ячейки расчета итоговой стоимости
    static let dataTitleFont = UIFont(name: "SFProText-Regular", size: 17)
    /// Шрифт для титла раскрываемой ячейки расчета итоговой стоимости
    static let dataTitleWithDisclosureFont = UIFont(name: "SFProText-Regular", size: 13)
    /// Шрифт титл для ячейки с коэффициентами
    static let customFinalPriceTitle = UIFont(name: "SFProText-Regular", size: 13)
    /// Шрифт сабтитл для ячейки с коэффициентами
    static let customFinalPriceSubtitle = UIFont(name: "SFProText-Semibold", size: 15)
}
