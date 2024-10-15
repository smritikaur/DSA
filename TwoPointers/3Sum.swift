import Swift
/*
Leetcode Problem - 15
3Sum
*/

/*
---- Using Brute Force
Time Complexity - O(n^3)
Space Complexity - O(n)


class ThreeSum {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        let sortedNums = nums.sorted() //important for getting distinct elements

        for i in 0..<sortedNums.count - 2 {
            for j in (i + 1)..<sortedNums.count - 1 {
                for k in (j + 1)..<sortedNums.count {
                    if sortedNums[i] + sortedNums[j] + sortedNums[k] == 0 {
                        let triplet = [sortedNums[i], sortedNums[j], sortedNums[k]]
                        if !res.contains(triplet) {
                            res.append(triplet)
                        }
                    }
                }
            }
        }
        return res
    }
}
var threeSumInator = ThreeSum()
var ans = threeSumInator.threeSum([-1,0,1,2,-1,-4])
print(ans)
*/


/*
---- Using Two Pointers Approach
Time Complexity - O(n^2)
Space Complexity - O(n) - (can be done as constant also i guess if we don't use a separate array for storage of sorted array).
*/

class ThreeSum {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        let sortedNums = nums.sorted() //imp for getting distinct elements
        for (index, item) in sortedNums.enumerated() { 
            if index > 0 && item == sortedNums[index - 1] {
                continue
            }
            var l = index + 1
            var r = sortedNums.count - 1
            while l < r {
                let threeSum = item + sortedNums[l] + sortedNums[r]
                if threeSum > 0{
                    r = r - 1 //dec sum
                }
                else if threeSum < 0{
                    l = l + 1 //inc sum
                }
                else {
                    res.append([item, sortedNums[l], sortedNums[r]])
                    l = l + 1
                    while sortedNums[l] == sortedNums[l-1] && l < r {
                        l = l + 1
                    }
                }
            }
        }
        return res
    } 
}
var threeSumInator = ThreeSum()
var ans = threeSumInator.threeSum([-1,0,1,2,-1,-4])
print(ans)