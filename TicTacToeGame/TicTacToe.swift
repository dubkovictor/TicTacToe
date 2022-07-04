//
//  TicTacToe.swift
//  TicTacToeGame
//
//  Created by Victor on 04.07.2022.
//

import Foundation

enum FieldType: Character, Equatable {
    case o = "⭕"
    case x = "❌"
    case empty = "⬜"
}

class TicTacToe {
    let size: Int
    var array: [[FieldType]] = [[FieldType]]()
    
    init(size: Int) {
        self.size = size
        create()
    }
    
    func create() {
        print("Create new Tic Tac Toe")
        array = [[FieldType]]()
        array = createArray()
    }
    
    func createArray() -> [[FieldType]] {
        for _ in 0..<size {
            let line = Array(repeating: FieldType.empty, count: size)
            array.append(line)
        }
        return array
    }
    
    subscript (x: Int, y: Int) -> FieldType {
        get {
            if x < 0 || y < 0 || x >= size || y >= size {
                return .empty
            }
            return array[y][x]
        }
        set {
            print("\(newValue.rawValue) - (\(x), \(y))")
            if !(x < 0 || y < 0 || x >= size || y >= size || newValue == .empty || array[y][x] != .empty) {
                array[y][x] = newValue
            }
        }
    }
}

