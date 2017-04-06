//
//  TaskOne.swift
//  OneTwoTrip
//
//  Created by Dmitry Rybochkin on 06.04.17.
//  Copyright © 2017 Dmitry Rybochkin. All rights reserved.
//
/*
 Во входном файле input.txt в первой строке через пробел записаны два целых числа M, N ∈ [0, 10000]. В следующих M строках записано по N символов - матрица размера M x N (формат см. в примере). Необходимо написать консольное приложение, выводящее символы из матрицы, из которых составляется строка "OneTwoTrip" (регистр символа при составлении слова значения не имеет), и их индексы в соответствующем порядке в столбик через точку с запятой в следующем виде: "СИМВОЛ - (m, n);" либо вывести "Impossible", если это невозможно сделать. Один элемент матрицы при составлении строки можно использовать только один раз. Корректность входных данных гарантируется.
 
 Программа должна быть оптимизирована для работы на мобильном устройстве.
 Будет плюсом, если вы приложите к выполненному заданию оценку сложности и расхода памяти вашего алгоритма в зависимости от параметров M и N.
 
 */

import Foundation

class TaskOne {
    var baseString: [String] = []
    var stringData: String = ""
    var lineCount: Int = 0
    var itemInLine: Int = 0
    
    init(string: String, fileName: String) {
        readString(string: string)
        readFile(fileName: fileName)
    }
    
    func check() -> String {
        var stateSearch: [String: String.Index] = [:]
        
        var result: String = ""
        
        for char in baseString {
            let loweredChar = char.lowercased()
            var startRange: Range<String.Index>
            if let startIndex = stateSearch[loweredChar] {
                startRange = startIndex..<stringData.endIndex
            } else {
                startRange = Range<String.Index>(uncheckedBounds: (stringData.startIndex, stringData.endIndex))
            }
            
            if let range = stringData.range(of: char, options: .caseInsensitive, range: startRange) {
                stateSearch[loweredChar] = range.upperBound
                let i = stringData.distance(from: stringData.startIndex, to: range.lowerBound) / itemInLine
                let j = stringData.distance(from: stringData.startIndex, to: range.lowerBound) % itemInLine
                result += String(format: "%@ - (%d, %d);\n", char, i, j)
            } else {
                return "Impossible"
            }
        }
        return result
    }
    
    private func readString(string: String) {
        baseString = Array(string.characters.map { String($0) })
    }
    
    private func readFile(fileName: String) {
        let filePath = String(format: "%@/%@", FileManager.default.currentDirectoryPath, fileName)
        
        let dir = URL(fileURLWithPath: filePath, isDirectory: false)
        guard let data = try? String(contentsOf: dir, encoding: String.Encoding.utf8) else {
            return
        }
        var lines: [String] = data.components(separatedBy: "\n")
        if lines.isEmpty {
            return
        }
        let size: [String] = lines[0].components(separatedBy: " ")
        if size.count != 2 {
            return
        }
        
        lineCount = Int.init(size[0])!
        itemInLine = Int.init(size[1])!
        
        lines.remove(at: 0)
        stringData = lines.joined()
    }
}
