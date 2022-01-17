//
//  ViewControllerSpy.swift
//  SravniRuTests
//
//  Created by Marcus on 04.12.2021.
//

import Foundation
import UIKit
@testable import SravniRu

final class ViewControllerSpy: ViewControllerProtocol {
    
    private(set) var isUpdateFinalPriceSectionWasCalled = false
    private(set) var isSetupFinalPriceCellWasCalled = false
    private(set) var cellsCount = 0
    private(set) var isSetupCalculateDataCellsWasCalled = false
    private(set) var isUpdateCalculateSectionWasCalled = false
    private(set) var isUpdateSectionWasCalled = false
    private(set) var isEndDataLoadingWasCalled = false
    private(set) var isUnableDataWasCalled = false

    func updateFinalPriceSection(cells: [UITableViewCell]) {
        isUpdateFinalPriceSectionWasCalled = true
        cellsCount = cells.count
    }
    
    func setupFinalPriceCell(cell: UITableViewCell) {
        isSetupFinalPriceCellWasCalled = true
    }
    
    func setupFinalPriceCell(cell: [UITableViewCell]) {
        isSetupFinalPriceCellWasCalled = true
    }
    
    func setupCalculateDataCells(cells: [UITableViewCell]) {
        isSetupCalculateDataCellsWasCalled = true
    }
    
    func updateFinalPriceSection(cells: [UITableViewCell], isOpen: Bool) {
        isUpdateFinalPriceSectionWasCalled = true
        
    }
    
    func updateCalculateSection(cells: [UITableViewCell]) {
        isUpdateCalculateSectionWasCalled = true
    }
    
    func updateSection(cells: [UITableViewCell], section: Int) {
        isUpdateSectionWasCalled = true
    }
    
    func endDataLoading() {
        isEndDataLoadingWasCalled = true
    }
    
    func unableData() {
        isUnableDataWasCalled = true
    }
}
