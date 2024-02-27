import Foundation

var solution: [Int] = []
var lng = 3
var wdth = 5

while (lng > 0 && wdth > 0) {
    solution.append(lng > wdth ? wdth : lng)
    if lng > wdth {
        lng -= wdth
    } else {
        wdth -= lng
    }
}

print(solution)

/*
5, 3 -> 5 > 3 -> 3 -> 5 - 3 = 2
2, 3 -> 2 > 3 -> 2 -> 3 - 2 = 1
2, 1 -> 2 > 1 -> 1 -> 2 - 1 = 1
1, 1 -> 1 > 1 -> 1 -> 1 - 1 = 0
1, 0
*/


print("\n\nsolution: \(solution)")

//15 - 9
//6 - 4
//2 -
