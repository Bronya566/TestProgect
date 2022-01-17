//
//  Factory.swift
//  SravniRu
//
//  Created by Marcus on 03.12.2021.
//

import Foundation

/// Фабрика создания ячеек для экрана "Калькулятор ОСАГО"
final class Factory {
    
    /// Роутер
    var router: RouterProtocol?
    /// Модель коэффициентов(базовых)
    var coefficientModel: BaseCoefficientModel?

    /// Создание ячеек итоговой стоимости
    func makeFinalPriceCells() -> [TableViewCellProtocol] {
        /// массив цен в правильном порядке
        var priceCell: [TableViewCellProtocol] =  []
        let model = CalculateDataModel.shared
        priceCell.append(CoefficientCustomCell(titleName: TextConstants.coefficientTitles[0], titleDescription: TextConstants.coefficientDiscriptions[0], subtitle: TextConstants.coefficientSubtitles[0], price: coefficientModel?.baseTarif ?? ""))
        priceCell.append(CoefficientCustomCell(titleName: TextConstants.coefficientTitles[1], titleDescription: TextConstants.coefficientDiscriptions[1], subtitle: TextConstants.coefficientSubtitles[1], price: (model.power?.coefficient ?? coefficientModel?.power) ?? ""))
        priceCell.append(CoefficientCustomCell(titleName: TextConstants.coefficientTitles[2], titleDescription: TextConstants.coefficientDiscriptions[2], subtitle: TextConstants.coefficientSubtitles[2], price: (model.town?.coefficient ?? coefficientModel?.town)  ?? ""))
        priceCell.append(CoefficientCustomCell(titleName: TextConstants.coefficientTitles[3], titleDescription: TextConstants.coefficientDiscriptions[3], subtitle: TextConstants.coefficientSubtitles[3], price: (model.noCrash?.coefficient ?? coefficientModel?.noCrash) ?? ""))
        priceCell.append(CoefficientCustomCell(titleName: TextConstants.coefficientTitles[4], titleDescription: TextConstants.coefficientDiscriptions[4], subtitle: TextConstants.coefficientSubtitles[4], price: (model.calculateCoefficientForAgeAndExperience() ?? coefficientModel?.age) ?? "" ))
        priceCell.append(CoefficientCustomCell(titleName: TextConstants.coefficientTitles[5], titleDescription: TextConstants.coefficientDiscriptions[5], subtitle: TextConstants.coefficientSubtitles[5], price: (model.driver?.coefficient ?? coefficientModel?.driver) ?? "" ))
        priceCell.append(RoundedCornerCell(isTopCornerRound: false))
        return priceCell
    }
    
    /// Создание ячеек для расчета итоговой стоимости
    /// - Returns: возврат ячеек
    func makeCalculateDataCells() -> [TableViewCellProtocol] {
        let typeWithDisclosure: [CalculateDataModel.DataType] = [.town, .power, .driver]
        let typeWithoutDisclosure: [CalculateDataModel.DataType] = [.age, .minExperience, .noCrash]
        var dataCell: [TableViewCellProtocol] = []
        dataCell.append(RoundedCornerCell(isTopCornerRound: true))
        for (index, text) in TextConstants.textCalculateDataCellWithDisclosure.enumerated() {
            let cell = CalculateDataCell(title: text, isDisclosure: true, subtitle: nil, type: typeWithDisclosure[index])
            cell.tapActionDataCell = router?.nextScreen
            dataCell.append(cell)
        }
        for (index, text) in TextConstants.textCalculateDataCellWithOutDisclosure.enumerated() {
            let cell = CalculateDataCell(title: text, isDisclosure: false, subtitle: nil, type: typeWithoutDisclosure[index])
            cell.tapActionDataCell = router?.nextScreen
            dataCell.append(cell)
        }
        dataCell.append(PaymentCell(title: TextConstants.textPaymentCell, isEnabled: false))
        dataCell.append(RoundedCornerCell(isTopCornerRound: false))
        return dataCell
    }
    
    /// Обновление данных в ячейке
    /// - Returns: возврат готовых ячеек
    func makeUpdatesCalculateData(buttonTapAction: @escaping ()-> Void) -> [TableViewCellProtocol] {
        var dataCell: [TableViewCellProtocol] = []
        var cells: [CalculateDataCell] = []
        let model = CalculateDataModel.shared
        let subtitles = [model.town?.coefficientName, model.power?.coefficientName, model.driver?.coefficientName, model.age?.coefficientName, model.minExperience?.coefficientName, model.noCrash?.coefficientName]
        dataCell.append(RoundedCornerCell(isTopCornerRound: true))
        cells.append(CalculateDataCell(title: TextConstants.textCalculateDataCellWithDisclosure[0], isDisclosure: true, subtitle: model.town?.coefficientName, type: .town))
        cells.append(CalculateDataCell(title: TextConstants.textCalculateDataCellWithDisclosure[1], isDisclosure: true, subtitle: model.power?.coefficientName, type: .power))
        cells.append(CalculateDataCell(title: TextConstants.textCalculateDataCellWithDisclosure[2], isDisclosure: true, subtitle: model.driver?.coefficientName, type: .driver))
        cells.append(CalculateDataCell(title: TextConstants.textCalculateDataCellWithOutDisclosure[0], isDisclosure: false, subtitle: model.age?.coefficientName, type: .age))
        cells.append(CalculateDataCell(title: TextConstants.textCalculateDataCellWithOutDisclosure[1], isDisclosure: false, subtitle: model.minExperience?.coefficientName, type: .minExperience))
        cells.append(CalculateDataCell(title: TextConstants.textCalculateDataCellWithOutDisclosure[2], isDisclosure: false, subtitle: model.noCrash?.coefficientName, type: .noCrash))
        cells.forEach { cell in
            cell.tapActionDataCell = router?.nextScreen(type:)
        }
        dataCell.append(contentsOf: cells)
        let paymentCell = PaymentCell(title: TextConstants.textPaymentCell, isEnabled: checkFillCell(subtitles: subtitles))
        paymentCell.tapActionPaymentCell = buttonTapAction
        dataCell.append(paymentCell)
        dataCell.append(RoundedCornerCell(isTopCornerRound: false))
        return dataCell
    }

    private func checkFillCell(subtitles: [String?])-> Bool {
        let notNillSubtitles = subtitles.compactMap {$0}
        return subtitles.count == notNillSubtitles.count
    }
}
