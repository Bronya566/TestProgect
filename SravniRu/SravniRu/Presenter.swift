//
//  Presenter.swift
//  SravniRu
//
//  Created by Marcus on 29.11.2021.
//

import Foundation

/// Протокол презентера для работы с ViewController
protocol PresenterOutputProtocol: AnyObject {
    /// Создание  ячейки секции рассчета итоговой стоимости
    /// - Parameter isOpen : раскрыта ли ячейка
    func makeFinalPriceCells(isOpen: Bool)
    
    /// Создать ячейку расчета итоговой стоимости
    func makePriceCalculateCell()
    
    /// Создание ячейки расчета итоговой стоимости
    func makeCalculateDataCells()
    
    
    /// Обновление ячейки расчета итоговой стоимости
    func needUpdateCalculateData()
    
    /// Обновление сабтитла у ячейки
    func needUpdateSubtitle()
    
    /// Старт показа экрана
    func start()
}
/// Протокол презентера для работы с interactor
protocol PresenterInputProtocol: AnyObject {
    
    /// Невозможность получения данных
    func unableGetData()
    
    /// Завершено получение данных
    /// - Parameter model : модель базовых данных
    func endModelLoading(model: BaseCoefficientModel)
}

/// Презентор экрана "Калькулятор ОСАГО"
final class Presenter: PresenterInputProtocol, PresenterOutputProtocol {
    
    /// ViewController экрана "Калькулятор ОСАГО"
    weak var viewController: ViewControllerProtocol?
    /// Interactor экрана "Калькулятор ОСАГО"
    var interactor: InteractorProtocol?

    private var router: RouterProtocol
    private var model: BaseCoefficientModel?
    private let factory = Factory()
    private let finalPriceCell = CustomFinalPriceCell(subtitle: TextConstants.finalPriceSubtitleLabel)
    
    /// Инициализатор
    /// - Parameter router: роутер
    init(router: RouterProtocol) {
        self.router = router
        factory.router = router
    }
    
    func unableGetData() {
        viewController?.unableData()
    }

    func start() {
        interactor?.getData()
    }
    
    func endModelLoading(model: BaseCoefficientModel) {
        self.model = model
        viewController?.endDataLoading()
        factory.coefficientModel = model
        makePriceCalculateCell()
        makeCalculateDataCells()
    }
    
    func makeFinalPriceCells(isOpen: Bool) {
        var cells: [TableViewCellProtocol] = [finalPriceCell]
        guard isOpen else {
            viewController?.updateFinalPriceSection(cells: cells, isOpen: false)
            return
        }
        cells.append(contentsOf: factory.makeFinalPriceCells())
        viewController?.updateFinalPriceSection(cells: cells, isOpen: true)
    }
    
    func makePriceCalculateCell() {
        finalPriceCell.tapAction = makeFinalPriceCells(isOpen:)
        let cells = [RoundedCornerCell(isTopCornerRound: true), finalPriceCell, RoundedCornerCell(isTopCornerRound: false)]
        viewController?.setupFinalPriceCell(cell: cells)
    }
    
    func makeCalculateDataCells() {
        viewController?.setupCalculateDataCells(cells: factory.makeCalculateDataCells())
    }
    
    func needUpdateCalculateData() {
        let cells = factory.makeUpdatesCalculateData() { [weak self] in
            self?.router.nextScreenFinalPrice(finalPrice: self?.interactor?.calculateFinalPrice(baseModel: self?.model))
        }
        viewController?.updateCalculateSection(cells: cells)
    }
    
    func needUpdateSubtitle() {
        guard finalPriceCell.isOpen else {
            finalPriceCell.updateSubtitle(subtitle: calculateSubtitle())
            return
        }
        finalPriceCell.updateSubtitle(subtitle: calculateSubtitle())
        var cells: [TableViewCellProtocol] = [RoundedCornerCell(isTopCornerRound: true), finalPriceCell]
        guard finalPriceCell.isOpen else {
            viewController?.updateFinalPriceSection(cells: cells, isOpen: false)
            return
        }
        cells.append(contentsOf: factory.makeFinalPriceCells())
        viewController?.updateSection(cells: cells, section: 0)
    }
    
    private func calculateSubtitle()-> String {
        let model = CalculateDataModel.shared
        let xString = "×"
        var subtitle = "БТ×"
        subtitle.append(contentsOf: model.power?.coefficient ?? "КМ")
        subtitle.append(contentsOf: xString)
        subtitle.append(contentsOf: model.town?.coefficient ?? "КТ")
        subtitle.append(contentsOf: xString)
        subtitle.append(contentsOf: model.noCrash?.coefficient ?? "КБМ")
        subtitle.append(contentsOf: xString)
        subtitle.append(contentsOf: model.calculateCoefficientForAgeAndExperience() ?? "КВС")
        subtitle.append(contentsOf: xString)
        subtitle.append(contentsOf: model.driver?.coefficient ?? "КО")
        return subtitle
    }
}
