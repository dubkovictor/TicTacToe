//
//  ViewController.swift
//  TicTacToeGame
//
//  Created by Victor on 04.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var newGameButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        newGameButton.addTarget(self, action: #selector(newGameButtonDidTap), for: .touchUpInside)
    }
    
    @objc func newGameButtonDidTap() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: String(describing: TicTacToeViewController.self))
        self.present(vc, animated: true)
    }
    
}

