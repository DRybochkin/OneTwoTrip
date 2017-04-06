//
//  main.swift
//  OneTwoTrip
//
//  Created by Dmitry Rybochkin on 05.04.17.
//  Copyright © 2017 Dmitry Rybochkin. All rights reserved.
//

import Foundation

/*
 Сложность O(M*N)
 Объем памяти O(M*N)
 */

let firstTask = TaskOne(string: "OneTwoTrip", fileName: "data.txt")
print(firstTask.check())

let array: [[Int]] = [[1,2,3], [4,5,6], [7,8,9]]
print(array.asSpiral())
