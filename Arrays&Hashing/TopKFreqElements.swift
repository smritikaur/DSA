import Swift
/*
LeetCode 347. 
Top K Frequent Elements
*/
// First Solution - Time Complexity O(n*logn)
// class TopKFreqElements {

//     func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
//         var frequencyOfItems = [Int:Int]()
//         // Populate frequencyOfItems dictionary
//         for num in nums {
//             frequencyOfItems[num, default: 0] += 1
//         }
//         // var sortedFrequencyOfItems = frequencyOfItems.sorted(by: >) //by default sorts by key
//         var sortedFrequencyOfItems = frequencyOfItems.sorted{$0.value > $1.value} //returns a tuple
//         //return topmost k keys of values in sortedFrequencyOfItems
//         // Get the top k keys from the sortedFrequencyOfItems
//         var topKKeys = [Int]()
//         for i in 0..<k {
//             topKKeys.append(sortedFrequencyOfItems[i].key)
//         }
//         return topKKeys
//     }
// }





// SECOND SOLUTION - O(n) both time & space - BucketSort
class TopKFreqElements {

    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var frequencyOfItems = [Int: Int]() //HashMap
        var frequencyBucket = Array(repeating: [Int](), count: nums.count + 1)
        // Populate frequencyOfItems dictionary
        for num in nums {
            frequencyOfItems[num, default: 0] += 1
        }
        // Populate frequencyBucket Array
        for (num, frequency) in frequencyOfItems{
            frequencyBucket[frequency].append(num)
        }
        // Find top K most frequent elements in frequencyBucket array
        var res = [Int]()
        for i in stride(from: frequencyBucket.count - 1, through: 0, by: -1) {
            for num in frequencyBucket[i]{
                res.append(num)
                if res.count == k {
                    break
                }
            }
            if res.count == k {
                break
            }
        }
        return res
    }
}
let topKFreqElementsInator = TopKFreqElements()
let answer = topKFreqElementsInator.topKFrequent([1,1,1,2,2,3], 2)
print(answer)