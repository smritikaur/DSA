import Swift
class ContainsDuplicate {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        //create a hashset
        /*
         #Brute force (using nested loop) solution time comp - O(n^2) space O(1) - since we don't need extra memory.
        #Better approach is to first sort the array then time comp reduces to O(nlogn)
        #Even better is to use a HashSet which reduces the time comp to O(n) with the downside that space comp increases to O(n) because we have to give extra space for hashSet.
        */
        var hashset = Set<Int>() 
        for n in nums{
            if hashset.contains(n) {
                return true
            }
            hashset.insert(n)
        }
        return false
    }
}

let ob = ContainsDuplicate()
let ans = ob.containsDuplicate([1,1,1,3,3,4,3,2,4,2])
print(ans)
