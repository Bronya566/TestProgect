//
//  InteractorTests.swift
//  SravniRuTests
//
//  Created by Marcus on 12.12.2021.
//

import XCTest
@testable import SravniRu

final class InteractorTests: XCTestCase {
    private var interactor: Interactor!
    private var presenter: PresenterSpy!
    
    override func setUp() {
        super.setUp()
        presenter = PresenterSpy()
        interactor = Interactor()
        interactor.presenter = presenter
    }
    
    override func tearDown() {
        super.tearDown()
        presenter = nil
        interactor = nil
    }
    
    func testGetData() {
        interactor.getData()
        XCTAssertTrue(presenter.isEndModelLoadingWasCalled, "Метод не вызван")
    }
    
    func testCalculateFinalPriceEmptyModel() {
        let baseModel = BaseCoefficientModel(baseTarif: "100", power: "100", town: "100", noCrash: "100", age: "100", driver: "100")
        let result = interactor.calculateFinalPrice(baseModel: baseModel)
        XCTAssertEqual(result, "", "Неверный результат")
    }
    
    func testCalculateFinalPriceFillModel() {
        let baseModel = BaseCoefficientModel(baseTarif: "100 - 200 ₽", power: "100", town: "100", noCrash: "100", age: "100", driver: "100")
        CalculateDataModel.shared.town = CoefficientModel(coefficientType: .town, coefficientName: "", coefficient: "1")
        CalculateDataModel.shared.minExperience = CoefficientModel(coefficientType: .minExperience, coefficientName: "", coefficient: "2")

        CalculateDataModel.shared.power = CoefficientModel(coefficientType: .power, coefficientName: "", coefficient: "3")

        CalculateDataModel.shared.noCrash = CoefficientModel(coefficientType: .noCrash, coefficientName: "", coefficient: "4")

        CalculateDataModel.shared.age = CoefficientModel(coefficientType: .age, coefficientName: "", coefficient: "5")

        CalculateDataModel.shared.driver = CoefficientModel(coefficientType: .driver, coefficientName: "", coefficient: "6")

        let result = interactor.calculateFinalPrice(baseModel: baseModel)
        XCTAssertEqual(result, "7200 - 14400 ₽ ", "Неверный результат")
    }

}
