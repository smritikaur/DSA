import Swift
/*
LeetCode Problem - 128
Longest Consecutive Sequence
Time complexity = Space complexity = O(n)
*/
class LongestConsecutiveSeq {
    func longestConsecutive(_ nums: [Int]) -> Int {
        // Create a set from the array to allow O(1) average time complexity for lookups.
        let hashset = Set(nums)
        // Variable to keep track of the maximum length found.
        var longest = 0
        for i in hashset{
            // Check if 'i' is the start of a sequence by confirming 'i-1' is not in the set.
            if hashset.contains(i-1){
                continue
            }else{
                // Initialize the length of the current consecutive sequence.
                var length = 1
                // Incrementally check for the next consecutive numbers in the set.
                while hashset.contains(i+length){
                    // Increase the length for each consecutive number found.
                    length += 1
                }
                // Update the longest sequence length found so far.
                longest = max(length, longest)
            }
        }
        return longest
    }
}

let longestConsecutiveSeqInator = LongestConsecutiveSeq()
let ans1 = longestConsecutiveSeqInator.longestConsecutive([100,4,200,1,3,2])
print(ans1)
let ans2 = longestConsecutiveSeqInator.longestConsecutive([0,3,7,2,5,8,4,6,0,1])
print(ans2)
