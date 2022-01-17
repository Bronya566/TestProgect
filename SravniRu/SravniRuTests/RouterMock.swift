//
//  RouterMock.swift
//  SravniRuTests
//
//  Created by Marcus on 12.12.2021.
//

import Foundation
@testable import SravniRu

final class RouterMock: RouterProtocol {
    func nextScreen(type: CalculateDataModel.DataType) {
        return
    }
    
    func nextScreenFinalPrice(finalPrice: String?) {
        return
    }
}
