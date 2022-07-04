//
//  TicTacToeViewController.swift
//  TicTacToeGame
//
//  Created by Victor on 04.07.2022.
//

import UIKit

enum GameStatus {
    case blueWon
    case redWon
    case beadHeat
    case gameProgress
}

class TicTacToeViewController: UIViewController {
    
    @IBOutlet weak var statusLbl: UILabel!
    
    @IBOutlet weak var zeroZeroBtn: UIButton!
    @IBOutlet weak var oneZeroBtn: UIButton!
    @IBOutlet weak var twoZeroBtn: UIButton!
    
    @IBOutlet weak var zeroOneBtn: UIButton!
    @IBOutlet weak var oneOneBtn: UIButton!
    @IBOutlet weak var twoOneBtn: UIButton!
    
    @IBOutlet weak var zeroTwoBtn: UIButton!
    @IBOutlet weak var oneTwoBtn: UIButton!
    @IBOutlet weak var twoTwoBtn: UIButton!
    
    var isCrossMove = true
    var gameStatus: GameStatus = .gameProgress
    var ticTacToe = TicTacToe(size: 3)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        zeroZeroBtn.addTarget(self, action: #selector(zeroZeroBtnDidTab), for: .touchUpInside)
        oneZeroBtn.addTarget(self, action: #selector(oneZeroBtnDidTab), for: .touchUpInside)
        twoZeroBtn.addTarget(self, action: #selector(twoZeroBtnDidTab), for: .touchUpInside)
        
        zeroOneBtn.addTarget(self, action: #selector(zeroOneBtnDidTab), for: .touchUpInside)
        oneOneBtn.addTarget(self, action: #selector(oneOneBtnDidTab), for: .touchUpInside)
        twoOneBtn.addTarget(self, action: #selector(twoOneBtnDidTap), for: .touchUpInside)
        
        zeroTwoBtn.addTarget(self, action: #selector(zeroTwoBtnDidTab), for: .touchUpInside)
        oneTwoBtn.addTarget(self, action: #selector(oneTwoBtnDidTab), for: .touchUpInside)
        twoTwoBtn.addTarget(self, action: #selector(twoTwoBtnDidTap), for: .touchUpInside)
        
        checkStatusGame()
    }
    
    func checkStatusGame() {
        switch gameStatus {
            case .blueWon:
                statusLbl.text = "Blue Won!"
                dissmisViewController()
            case .redWon:
                statusLbl.text = "Red Won!"
                dissmisViewController()
            case .beadHeat:
                statusLbl.text = "Вead heat"
                dissmisViewController()
            case .gameProgress:
                statusLbl.text = "Start game"
        }
    }
    
    func dissmisViewController() {
        self.dismiss(animated: true)
    }
    
    func winnerCheck() {
        for index in 0...2 {
            // Player won horizontally in a row.
            if ticTacToe[index,0] == ticTacToe[index, 1] && ticTacToe[index, 0] == ticTacToe[index, 2] {
                if ticTacToe[index, 0] == .x {
                    gameStatus = .blueWon
                    checkStatusGame()
                } else if ticTacToe[index, 0] == .o {
                    gameStatus = .redWon
                    checkStatusGame()
                }
            }
            
            // Player won vertically in a column.
            if ticTacToe[0, index] == ticTacToe[1, index] && ticTacToe[0, index] == ticTacToe[2, index] {
                if ticTacToe[0, index] == .x {
                    gameStatus = .blueWon
                    checkStatusGame()
                } else if ticTacToe[0, index] == .o {
                    gameStatus = .redWon
                    checkStatusGame()
                }
            }
        }
        
        // Player won diagonally between the top left and bottom right.
        if ticTacToe[0, 0] == ticTacToe[1, 1] && ticTacToe[0, 0] == ticTacToe[2, 2] {
            if ticTacToe[0, 0] == .x {
                gameStatus = .blueWon
                checkStatusGame()
            } else if ticTacToe[0, 0] == .o {
                gameStatus = .redWon
                checkStatusGame()
            }
        }
        
        // Player won diagonally between the top right and bottom left.
        if ticTacToe[0, 2] == ticTacToe[1, 1] && ticTacToe[0, 2] == ticTacToe[2, 0] {
            if ticTacToe[0, 2] == .x {
                gameStatus = .blueWon
                checkStatusGame()
            } else if ticTacToe[0, 2] == .o {
                gameStatus = .redWon
                checkStatusGame()
            }
        }
        
        // nobody won
        if ticTacToe[0,0] != .empty && ticTacToe[0,1] != .empty && ticTacToe[0,2] != .empty &&
            ticTacToe[1,0] != .empty && ticTacToe[1,1] != .empty && ticTacToe[1,2] != .empty &&
            ticTacToe[2,0] != .empty && ticTacToe[2,1] != .empty && ticTacToe[2,2] != .empty {
            gameStatus = .beadHeat
            checkStatusGame()
        }
    }
    
    func setup(arr1: Int ,arr2: Int, btn: UIButton) {
        
        if ticTacToe[arr1,arr2] == .empty {
            if isCrossMove {
                ticTacToe[arr1,arr2] = .x
                btn.setImage(UIImage(named: "cross"), for: .normal)
                isCrossMove = false
                statusLbl.text = "Go red"
            } else {
                ticTacToe[arr1,arr2] = .o
                btn.setImage(UIImage(named: "zero"), for: .normal)
                isCrossMove = true
                statusLbl.text = "Go Blue"
            }
        }
        winnerCheck()
    }
    
    //MARK: - Actions
    
    @objc func zeroZeroBtnDidTab() {
        setup(arr1: 0, arr2: 0, btn: zeroZeroBtn)
    }
    
    @objc func oneZeroBtnDidTab() {
        setup(arr1: 1, arr2: 0, btn: oneZeroBtn)
    }
    
    @objc func twoZeroBtnDidTab() {
        setup(arr1: 2, arr2: 0, btn: twoZeroBtn)
    }
    
    @objc func zeroOneBtnDidTab() {
        setup(arr1: 0, arr2: 1, btn: zeroOneBtn)
    }
    
    @objc func oneOneBtnDidTab() {
        setup(arr1: 1, arr2: 1, btn: oneOneBtn)
    }
    
    @objc func twoOneBtnDidTap() {
        setup(arr1: 2, arr2: 1, btn: twoOneBtn)
    }
    
    @objc func zeroTwoBtnDidTab() {
        setup(arr1: 0, arr2: 2, btn: zeroTwoBtn)
    }
    
    @objc func oneTwoBtnDidTab() {
        setup(arr1: 1, arr2: 2, btn: oneTwoBtn)
    }
    
    @objc func twoTwoBtnDidTap() {
        setup(arr1: 2, arr2: 2, btn: twoTwoBtn)
    }
    
    
}
