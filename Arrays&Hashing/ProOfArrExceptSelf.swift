import Swift

/*
Leetcode problem -238
238. Product of Array Except Self
*/

class ProfOfArrExceptSelf {
    //Time comp - O(n)
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var res = Array(repeating: 1, count: nums.count)
        //for prefix calculation
        var prefixx = 1
        for i in 0..<nums.count{
            res[i] = prefixx
            prefixx = prefixx * nums[i]
        }
        //for postfix calculation - directly multiplying postfix with the prefix stored in the res array already calculated above.
        var postfixx = 1
        for i in stride(from: nums.count - 1, through: 0, by: -1) {
            res[i] = res[i] * postfixx
            postfixx = postfixx * nums[i]
        }
        return res
    }
}

let profOfArrExceptSelfInator = ProfOfArrExceptSelf()
let ans = profOfArrExceptSelfInator.productExceptSelf([1,2,3,4])
print(ans)