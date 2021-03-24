//
//  MockViewModelTests.swift
//  Movie SelectorTests
//
//  Created by Andreas Velounias on 24/03/2021.
//

import XCTest

@testable import Movie_Selector

class MovieViewModelTests: XCTestCase {

    func testSuccessFetchData() {
        let expectedList = [Movie.with()]
        let service = MockService(mockData: expectedList)
        
        let viewModel = MovieViewModel(service: service)
        
        
        viewModel.loadData()
        
        XCTAssertTrue(!viewModel.loading)
        XCTAssertEqual(viewModel.movies.results.count, 1)
    }
    
    func testEmptyData() {
        let expectedList = [Movie]()
        let service = MockService(mockData: expectedList)
        
        let viewModel = MovieViewModel(service: service)
        
        
        viewModel.loadData()
        
        XCTAssertTrue(!viewModel.loading)
        XCTAssertEqual(viewModel.movies.results.count, 0)
    }
    
    func testNilData() {
        let expectedList: [Movie]? = nil
        let service = MockService(mockData: expectedList)
        
        let viewModel = MovieViewModel(service: service)
        
        
        viewModel.loadData()
        
        XCTAssertTrue(!viewModel.loading)
        XCTAssertEqual(viewModel.movies.results.count, 0)
    }

}
