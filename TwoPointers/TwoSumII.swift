import Swift
/*
LeetCode Problem - 167
Two Sum II - Input Array Is Sorted

Brute Force - Time complexity: O(n^2), Space complexity: O(1)

Two Pointer Approach - Time complexity = O(n), Space Complexity = O(1) 

*/

class TwoSumII {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {  
        var pointer1: Int = 0
        var pointer2: Int = numbers.count - 1
        while pointer1 < pointer2 && pointer2 <= numbers.count - 1 {
            let sum = numbers[pointer1] + numbers[pointer2]
            if sum < target {
                pointer1 += 1
            }
            else if sum > target {
                pointer2 -= 1
            }
            else {
                return [pointer1 + 1, pointer2 + 1]
            }
        }
        return []
    }
}
var twoSumIIInator = TwoSumII()
var ans1 = twoSumIIInator.twoSum([1,2,3,4,4,9], 8)
print(ans1)
var ans2 = twoSumIIInator.twoSum([2,7,11,15], 9)
print(ans2)