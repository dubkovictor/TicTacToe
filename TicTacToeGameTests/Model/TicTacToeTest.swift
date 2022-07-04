//
//  TicTacToeTest.swift
//  TicTacToeGameTests
//
//  Created by Victor on 04.07.2022.
//

import XCTest
@testable import TicTacToeGame

class TicTacToeTest: XCTestCase {

    var sut: TicTacToe!
    let arrayTwoDimensionalCount = 3
    
    override func setUp() {
        sut = TicTacToe(size: arrayTwoDimensionalCount)
    }
    
    override func tearDown() {
        sut = nil
    }
    
    // func create()
    func testFieldTypeArrayCreated() {
        XCTAssertTrue(sut.array.count == 3)
    }
    
    //func createArray() -> [[FieldType]]
    func testArrayCreateTwoDimensionalArray() {
        
        var tempArr: [Int] = []
        
        for (_ , item) in sut.array.enumerated() {
            var lineCounter = 0
            for _ in item {
                lineCounter += 1
            }
            tempArr.append(lineCounter)
        }
        
        XCTAssertTrue(tempArr.count == arrayTwoDimensionalCount)
        let objectSet = Set(tempArr.map { $0 }) // TO DO Comment
        XCTAssertTrue(objectSet.count == 1)
    }
    
    //MARK: - subscript (x: Int, y: Int) -> FieldType
    
    func testIsEmptyArray() {
        XCTAssertTrue(sut[0, 0] == .empty)
    }
    
    func testGetSetCrossToArray() {
        sut[0, 0] = .x
        XCTAssertTrue(sut[0, 0] == .x)
    }
    
    func testGetSetZeroToArray() {
        sut[0, 0] = .o
        XCTAssertTrue(sut[0, 0] == .o)
    }
   
}
