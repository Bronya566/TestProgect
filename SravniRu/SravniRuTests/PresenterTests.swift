//
//  PresenterTests.swift
//  SravniRuTests
//
//  Created by Marcus on 04.12.2021.
//

import XCTest
@testable import SravniRu

final class PresenterTests: XCTestCase {
    private var presenter: Presenter!
    private var vc: ViewControllerSpy!
    private var router: RouterMock!
    private var interactor: InteractorSpy!
    
    override func setUp() {
        super.setUp()
        interactor = InteractorSpy()
        router = RouterMock()
        presenter = Presenter(router: router)
        presenter.interactor = interactor
        vc = ViewControllerSpy()
        presenter.viewController = vc
    }
    
    override func tearDown() {
        interactor = nil
        vc = nil
        presenter = nil
        router = nil
        super.tearDown()
    }
    
    func testMakePriceCalculateCell() {
        presenter.makePriceCalculateCell()
        XCTAssertTrue(vc.isSetupFinalPriceCellWasCalled, "Метод не был вызван")
    }
    
//    func testMakeFinalPriceCellsWhenIsOpenTrue() {
//        presenter.makeFinalPriceCells(isOpen: true)
//        XCTAssertTrue(vc.isUpdateFinalPriceSectionWasCalled, "Метод не вызвался")
//        XCTAssertEqual(vc.cellsCount, 7, "Неверное количество элементов")
//    }
//    
//    func testMakeFinalPriceCellsWhenIsOpenFalse() {
//        presenter.makeFinalPriceCells(isOpen: false)
//        XCTAssertTrue(vc.isUpdateFinalPriceSectionWasCalled, "Метод не вызвался")
//        XCTAssertEqual(vc.cellsCount, 1, "Неверное количество элементов")
//    }
    
    func testUnableGetData() {
        presenter.unableGetData()
        XCTAssertTrue(vc.isUnableDataWasCalled, "Метод не был вызван")
    }
    
    func testStart() {
        presenter.start()
        XCTAssertTrue(interactor.isGetDataWasCalled, "Метод не был вызван")
    }
    
    func testEndModelLoading() {
        let baseModel = BaseCoefficientModel()
        presenter.endModelLoading(model: baseModel)
        XCTAssertTrue(vc.isEndDataLoadingWasCalled, "Метод не был вызван")
    }
    func testMakeFinalPriceCells() {
        presenter.makeFinalPriceCells(isOpen: true)
        XCTAssertTrue(vc.isUpdateFinalPriceSectionWasCalled, "Метод не был вызван")
    }
    
    func testMakeCalculateDataCells() {
        presenter.makeCalculateDataCells()
        XCTAssertTrue(vc.isSetupCalculateDataCellsWasCalled, "Метод не был вызван")
    }
    
    func testNeedUpdateCalculateData() {
        presenter.needUpdateCalculateData()
        XCTAssertTrue(vc.isUpdateCalculateSectionWasCalled, "Метод не был вызван")
    }
}
