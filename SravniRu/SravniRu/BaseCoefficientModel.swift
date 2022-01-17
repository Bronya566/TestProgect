//
//  BaseCoefficientModel.swift
//  SravniRu
//
//  Created by Marcus on 09.12.2021.
//

/// Модель данных для базовых коэффициентов
struct BaseCoefficientModel: Decodable {
    /// Базовый тариф
    var baseTarif : String?
    /// Мощность
    var power : String?
    /// Город
    var town : String?
    /// Безаварийность
    var noCrash : String?
    /// Возраст водителя
    var age : String?
    /// Количество водителей
    var driver : String?
}



