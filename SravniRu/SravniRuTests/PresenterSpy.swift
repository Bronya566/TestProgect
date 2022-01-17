//
//  PresenterSpy.swift
//  SravniRuTests
//
//  Created by Marcus on 12.12.2021.
//

import Foundation
import UIKit
@testable import SravniRu

final class PresenterSpy: PresenterInputProtocol, PresenterOutputProtocol {
    
    private(set) var isUnableGetDataWasCalled = false
    private(set) var isEndModelLoadingWasCalled = false
    private(set) var isMakeFinalPriceCellsWasCalled = false
    private(set) var isMakePriceCalculateCellWasCalled = false
    private(set) var isMakeCalculateDataCellsWasCalled = false
    private(set) var isNeedUpdateCalculateDataWasCalled = false
    private(set) var isNeedUpdateSubtitleWasCalled = false
    private(set) var isStartWasCalled = false
    
    func unableGetData() {
        isUnableGetDataWasCalled = true
    }
    
    func endModelLoading(model: BaseCoefficientModel) {
        isEndModelLoadingWasCalled = true
    }
    
    func makeFinalPriceCells(isOpen: Bool) {
        isMakeFinalPriceCellsWasCalled = true
    }
    
    func makePriceCalculateCell() {
        isMakePriceCalculateCellWasCalled = true
    }
    
    func makeCalculateDataCells() {
        isMakeCalculateDataCellsWasCalled = true
    }
    
    func needUpdateCalculateData() {
        isNeedUpdateCalculateDataWasCalled = true
    }
    
    func needUpdateSubtitle() {
        isNeedUpdateSubtitleWasCalled = true
    }
    
    func start() {
        isStartWasCalled = true
    }
}
