import Swift
class TwoSum {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
       /* var arr = [Int]()
        for i in 0..<nums.count - 1{ //n
            for j in (i+1)..<nums.count{ //n
                if nums[i] + nums[j] == target{
                    // arr.append(i)
                    // arr.append(j)    
                    arr.append(contentsOf: [i,j])
                    break
                }
            }
        }
        return arr*/
        // USING HASHMAPS reduces time complexity to O(n) from O(n2)
        var dict = [Int:Int]()
        for i in 0..<nums.count{
            let diff = target - nums[i]
            if dict.keys.contains(diff){
                if let diffIndex = dict[diff] { //needed to safely unwrap dict as it is optional by default
                    return [i, diffIndex]
                }        
            }
            dict[nums[i]] = i
        }
        return []
    }
}

let twoSumInator = TwoSum()
let ans = twoSumInator.twoSum([2,7,11,15], 9)
print(ans)