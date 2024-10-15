import Swift

// LeetCode Problem - 
// Container With Most Water
// BRUTE FORCE: Time Complexity - O(n^2), Space Complexity - O(n) [also considered as constant in interviews]
// TWO POINTERS: Time Complexity - O(n), Space Complexity - O(n) [also considered as constant in interviews]


//BRUTE FORCE
/*
class ContainerWithMostWater {
    func maxArea(_ height: [Int]) -> Int {
        var maxArea = 0
        for i in 0..<height.count - 1 {
            for j in i+1..<height.count {
                let area = min(height[i], height[j]) * (j-i)
                if area > maxArea{
                    maxArea = area
                }           
            }
        }
        return maxArea
    }
}

let containerWithMostWaterInator = ContainerWithMostWater()
var ans = containerWithMostWaterInator.maxArea([1,8,6,2,5,4,8,3,7])
print(ans)
*/

//TWO POINTERS
class ContainerWithMostWater {
    func maxArea(_ height: [Int]) -> Int {
        var maxArea = 0
        var leftPointer = 0
        var rightPointer = height.count - 1
        while leftPointer != rightPointer {
            let area =  min(height[leftPointer], height[rightPointer]) * (rightPointer - leftPointer)
             if height[leftPointer] < height[rightPointer]{
                leftPointer += 1
             }
             else {
                rightPointer -= 1
             }
            maxArea = max(area, maxArea)
        }
        return maxArea
    }
}
let containerWithMostWaterInator = ContainerWithMostWater()
var ans1 = containerWithMostWaterInator.maxArea([1,8,6,2,5,4,8,3,7])
print(ans1)
var ans2 = containerWithMostWaterInator.maxArea([1,1])
print(ans2)