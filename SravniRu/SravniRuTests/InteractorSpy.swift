//
//  InteractorSpy.swift
//  SravniRuTests
//
//  Created by Marcus on 12.12.2021.
//

import Foundation
@testable import SravniRu

final class InteractorSpy: InteractorProtocol {
    
    private(set) var isGetDataWasCalled = false
    private(set) var isCalculateFinalPriceWasCalled = false
    
    func getData() {
        isGetDataWasCalled = true
    }
    
    func calculateFinalPrice(baseModel: BaseCoefficientModel?) -> String {
        isCalculateFinalPriceWasCalled = true
        return ""
    }
    
    
}
