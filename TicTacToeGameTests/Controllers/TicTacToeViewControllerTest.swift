//
//  TicTacToeViewControllerTest.swift
//  TicTacToeGameTests
//
//  Created by Victor on 04.07.2022.
//

import XCTest
@testable import TicTacToeGame

class TicTacToeViewControllerTest: XCTestCase {

    var sut: TicTacToeViewController!
    
    override func setUp() {
        let storyboard = UIStoryboard(name: "TicTacToeViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: String(describing: TicTacToeViewController.self))
        sut = vc as? TicTacToeViewController
        
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
    }
    
    func testWhenViewIsLoadedButtonswNotNil() {
        XCTAssertNotNil(sut.zeroZeroBtn)
        XCTAssertNotNil(sut.zeroZeroBtn.isDescendant(of: sut.view))
        XCTAssertNotNil(sut.oneZeroBtn)
        XCTAssertNotNil(sut.oneZeroBtn.isDescendant(of: sut.view))
        XCTAssertNotNil(sut.twoZeroBtn)
        XCTAssertNotNil(sut.twoZeroBtn.isDescendant(of: sut.view))
        
        XCTAssertNotNil(sut.zeroOneBtn)
        XCTAssertNotNil(sut.zeroOneBtn.isDescendant(of: sut.view))
        XCTAssertNotNil(sut.oneOneBtn)
        XCTAssertNotNil(sut.oneOneBtn.isDescendant(of: sut.view))
        XCTAssertNotNil(sut.twoOneBtn)
        XCTAssertNotNil(sut.twoOneBtn.isDescendant(of: sut.view))
        
        XCTAssertNotNil(sut.zeroTwoBtn)
        XCTAssertNotNil(sut.zeroTwoBtn.isDescendant(of: sut.view))
        XCTAssertNotNil(sut.oneTwoBtn)
        XCTAssertNotNil(sut.oneTwoBtn.isDescendant(of: sut.view))
        XCTAssertNotNil(sut.twoTwoBtn)
        XCTAssertNotNil(sut.twoTwoBtn.isDescendant(of: sut.view))
    }
    
    func testWhenViewIsLoadedTicTacToeNotNil() {
        XCTAssertNotNil(sut.ticTacToe)
    }
    
    func testChekIsCrossMoveShouldBeChangetAfterClickToAnyticTacToeButton() {
        
        XCTAssertTrue(sut.isCrossMove == true)
        
        sut.zeroZeroBtnDidTab()
        XCTAssertTrue(sut.isCrossMove == false)
        XCTAssertTrue(sut.zeroZeroBtn.imageView?.image == UIImage(named: "cross"))
        XCTAssertTrue(sut.ticTacToe[0,0] == .x)
        
        sut.oneZeroBtnDidTab()
        XCTAssertTrue(sut.isCrossMove == true)
        XCTAssertTrue(sut.oneZeroBtn.imageView?.image == UIImage(named: "zero"))
        XCTAssertTrue(sut.ticTacToe[1,0] == .o)
        
        sut.twoZeroBtnDidTab()
        XCTAssertTrue(sut.isCrossMove == false)
        XCTAssertTrue(sut.twoZeroBtn.imageView?.image == UIImage(named: "cross"))
        XCTAssertTrue(sut.ticTacToe[2,0] == .x)
        
        sut.zeroOneBtnDidTab()
        XCTAssertTrue(sut.isCrossMove == true)
        XCTAssertTrue(sut.zeroOneBtn.imageView?.image == UIImage(named: "zero"))
        XCTAssertTrue(sut.ticTacToe[0,1] == .o)
        
        sut.oneOneBtnDidTab()
        XCTAssertTrue(sut.isCrossMove == false)
        XCTAssertTrue(sut.oneOneBtn.imageView?.image == UIImage(named: "cross"))
        XCTAssertTrue(sut.ticTacToe[1,1] == .x)
        
        sut.twoOneBtnDidTap()
        XCTAssertTrue(sut.isCrossMove == true)
        XCTAssertTrue(sut.twoOneBtn.imageView?.image == UIImage(named: "zero"))
        XCTAssertTrue(sut.ticTacToe[2,1] == .o)
        
        sut.zeroTwoBtnDidTab()
        XCTAssertTrue(sut.isCrossMove == false)
        XCTAssertTrue(sut.zeroTwoBtn.imageView?.image == UIImage(named: "cross"))
        XCTAssertTrue(sut.ticTacToe[0,2] == .x)
        
        sut.oneTwoBtnDidTab()
        XCTAssertTrue(sut.isCrossMove == true)
        XCTAssertTrue(sut.oneTwoBtn.imageView?.image == UIImage(named: "zero"))
        XCTAssertTrue(sut.ticTacToe[1,2] == .o)
        
        sut.twoTwoBtnDidTap()
        XCTAssertTrue(sut.isCrossMove == false)
        XCTAssertTrue(sut.twoTwoBtn.imageView?.image == UIImage(named: "cross"))
        XCTAssertTrue(sut.ticTacToe[2,2] == .x)
    }
    
    func testIfBlueWonShouldBeChangedStatusTextBlueWon() {
        sut.ticTacToe[0,0] = .x
        sut.ticTacToe[1,0] = .x
        sut.ticTacToe[2,0] = .x
        
        sut.winnerCheck()
        
        XCTAssertTrue(sut.statusLbl.text == "Blue Won!")
    }
    
    func testIfRedWonShouldBeChangedStatusTextBlueWon() {
        sut.ticTacToe[0,0] = .o
        sut.ticTacToe[1,0] = .o
        sut.ticTacToe[2,0] = .o
        
        sut.winnerCheck()
        
        XCTAssertTrue(sut.statusLbl.text == "Red Won!")
    }
    
    func testNobodyWonStatusTextВeadHeat() {
        sut.ticTacToe[0,0] = .x
        sut.ticTacToe[0,1] = .o
        sut.ticTacToe[0,2] = .x
        
        sut.ticTacToe[1,0] = .o
        sut.ticTacToe[1,1] = .x
        sut.ticTacToe[1,2] = .o
        
        sut.ticTacToe[2,1] = .x
        sut.ticTacToe[2,0] = .o
        sut.ticTacToe[2,2] = .x
        
        sut.winnerCheck()
        
        XCTAssertTrue(sut.statusLbl.text == "Вead heat")
    }
    
    func testTicTacToeViewControllerShouldBeRemovedByStays() {
        sut.gameStatus = .beadHeat
        sut.checkStatusGame()

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            XCTAssertNil(self.sut.view)
        }
    }
    
    

}
