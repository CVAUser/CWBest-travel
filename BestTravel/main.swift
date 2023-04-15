//
//  main.swift
//  BestTravel
//
//  Created by Mac on 15.04.2023.
//

import Foundation

var ts = [1, 5, 8, 12]

func chooseBestSum(_ t: Int, _ k: Int, _ ls: [Int]) -> Int {
    if (t < 0) { return -1 }
    if (k <= 0) { return -1 }
    if (ls.isEmpty) { return -1 }
    for element in ls {
        if (element < 0) { return -1 }
    }
    if (k > ls.count) { return -1 }
    var result = -1
    
    let allSum = combinationsWithoutRepetition(0, ls, k)
    for sum in allSum {
        if sum > result && sum <= t {
            result = sum
        }
    }
    print(allSum)
    return result
}
func combinationsWithoutRepetition (_ sum: Int = 0, _ ls: [Int], _ k: Int) -> [Int] {
    var result = [Int]()
    var index = 0
    if (k == 0) {
        result.append(sum)
    } else {
        while index < ls.count {
            let interimResults = combinationsWithoutRepetition(sum + ls[index], Array(ls[(index + 1)...]), k - 1)
            result = result + interimResults
            index += 1
        }
    }
    return result
}
print(chooseBestSum(22, 3, ts))
