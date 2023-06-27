//
//  ProductViewModel_Tests.swift
//  Combine-URLSessionTests
//
//  Created by Glenn Ludszuweit on 27/06/2023.
//

import XCTest
@testable import Combine_URLSession

final class ProductViewModel_Tests: XCTestCase {
    var viewModel: ViewModel!
    var networkManager: TestNetworkManager!
    var errorManager: TestErrorManager!
    
    override func setUpWithError() throws {
        networkManager = TestNetworkManager()
        errorManager = TestErrorManager()
        viewModel = ViewModel(networkManager: networkManager, errorManager: errorManager)
    }
    
    override func tearDownWithError() throws {
        viewModel = nil
        networkManager = nil
        errorManager = nil
    }
    
    func testGetAllPlanets() {
        let duration = 3.0
        let expectation = expectation(description: "Get all planets.")
        
        viewModel.getAllProducts(apiUrl: "products")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            XCTAssertEqual(self.viewModel.products.count, 30)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: duration)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
