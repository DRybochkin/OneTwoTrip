//
//  TaskTwo.swift
//  OneTwoTrip
//
//  Created by Dmitry Rybochkin on 06.04.17.
//  Copyright © 2017 Dmitry Rybochkin. All rights reserved.
//
/*
    Есть матрица 2n-1 x 2n-1, заполненная случайными значениями.
    Надо вывести их на экран в ряд, начиная из центра по спирали: влево - вниз - вправо - вверх и т.д.
*/

import Foundation

typealias IntArray = [Int]

extension Array where Iterator.Element == [Int] {
    func asSpiral() -> [Int] {
        var size = self.count
        var i: Int = 0
        var j: Int = 0
        
        var res: [Int] = []
        
        while (size != 0) {
            var k: Int = 0
            repeat {
                res.append(self[i][j])
                j += 1
                k += 1
            } while (k < size - 1)
            
            for _ in 0..<size - 1 {
                res.append(self[i][j])
                i += 1
            }
            
            for _ in 0..<size - 1 {
                res.append(self[i][j])
                j -= 1
            }
            
            for _ in 0..<size - 1 {
                res.append(self[i][j])
                i -= 1
            }
            
            i += 1
            j += 1
            size = size < 2 ? 0 : size - 2;
        }
        res.reverse()
        return res
    }
}

