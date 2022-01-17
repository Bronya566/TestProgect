//
//  FactoryTests.swift
//  SravniRuTests
//
//  Created by Marcus on 04.12.2021.
//

import XCTest
@testable import SravniRu

final class FactoryTests: XCTestCase {

    private var factory: Factory!
    
    override func setUp() {
        super.setUp()
        factory = Factory()
    }
    
    override func tearDown() {
        factory = nil
        super.tearDown()
    }
    
    func testPriceCellsCount() {
        let cells = factory.makeFinalPriceCells()
        XCTAssertEqual(cells.count, 7, "Неверное количество")
    }
    
    func testCalculateDataCellsCount() {
        let cells = factory.makeCalculateDataCells()
        XCTAssertEqual(cells.count, 9, "Неверное количество")
    }
    
    func testMakeUpdatesCalculateData() {
        let cells = factory.makeUpdatesCalculateData(){}
        XCTAssertEqual(cells.count, 9, "Неверное количество")
    }
}
