/*
LeetCode Problem - 42
Trapping Rain Water
*/
import Swift

// Solution 1
// Time Complexity = O(n^2), Space Complexity = O(n)
class TrappingRainWater {
    func trap(_ height: [Int]) -> Int {
        var maxHeight = 0
        var maxHeightIndex = 0
        var actualWater = 0
        for i in 0..<height.count{
            if height[i] >= maxHeight{
                maxHeight = height[i]
                maxHeightIndex = i
            }                  
        }
        var leftPointer = 0
        var rightPointer = height.count - 1 
        //leftSide
        while leftPointer < maxHeightIndex {  
            if height[0] == 0 && height.count != 1 {
                leftPointer += 1
            }
            for i in (leftPointer + 1)..<height.count{
                if height[leftPointer] > height[i]{
                    continue
                }        
                let maxWater = min(height[leftPointer], height[i]) * (i - (leftPointer + 1))
                var sumToBeSub = 0
                for j in (leftPointer + 1)..<i{
                    sumToBeSub = sumToBeSub + height[j]
                }
                actualWater = actualWater + (maxWater - sumToBeSub)
                leftPointer = i
            }
        }
        // rightSide
        while rightPointer > maxHeightIndex {
            for i in stride(from: rightPointer - 1, through: maxHeightIndex, by: -1) {
                if height[rightPointer] > height[i] {
                    continue
                }
                let maxWater = min(height[rightPointer], height[i]) * (rightPointer - i - 1)
                var sumToBeSub = 0
                for j in (i + 1)..<rightPointer {
                    sumToBeSub += height[j]
                }
                actualWater += (maxWater - sumToBeSub)
                rightPointer = i
            }
        }
        return actualWater
    }
}

var trappingRainWaterInator = TrappingRainWater()
var ans1 = trappingRainWaterInator.trap([5,5,1,7,1,1,5,2,7,6])
print(ans1)


// Solution 2 - Two Pointers (Better)
// Time Complexity = O(n), Space Complexity = O(1)
