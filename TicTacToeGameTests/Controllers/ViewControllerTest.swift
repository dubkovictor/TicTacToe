//
//  ViewControllerTest.swift
//  TicTacToeGameTests
//
//  Created by Victor on 04.07.2022.
//

import XCTest
import UIKit
@testable import TicTacToeGame

class ViewControllerTest: XCTestCase {
    
    var sut: ViewController!
    
    override func setUp() {
    }
    
    override func tearDown() {
    }
    
    func testByTochToButtonGoToTicTacToeController() {
        let storyboard = UIStoryboard(name: String(describing: TicTacToeViewController.self), bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: String(describing: TicTacToeViewController.self)) as! TicTacToeViewController
        vc.loadViewIfNeeded()
        XCTAssertNotNil(vc.statusLbl)
        XCTAssertNotNil(vc.statusLbl.isDescendant(of: vc.view))
    }
    

}
