import Swift
/*
Time Complexity - avg only - O(nLogn)
Algorithm:
1. Split array in half
2. Call Merge Sort on each half to sort them recursively
3. Merge both sorted halves into one sorted array
*/

var array = [2,6,5,1,7,4,3]
class MergeSort {
    
    func mergeSort(arr: inout [Int]){
        //Slit array into half
        if arr.count > 1 {
            let midIndex = arr.count / 2 //7/2 = 3, 8/2 = 4, 4/2 = 2
            var leftArr: [Int] = Array(arr[0..<midIndex])
            var rightArr: [Int] = Array(arr[midIndex..<arr.count])

            //Recursion
            mergeSort(arr: &leftArr)
            mergeSort(arr: &rightArr)

            //Merge
            var i = 0 // leftArr index
            var j = 0 // rightArr index
            var k = 0 // mergedArr index

            //Conditions for merging
            while i < leftArr.count && j < rightArr.count {
                if leftArr[i] < rightArr[j]{
                    arr[k] = leftArr[i]
                    i += 1
                } 
                else{
                    arr[k] = rightArr[j]
                    j += 1
                }
                k += 1
            }
            // If elements are only left in left array
            while i < leftArr.count{
                arr[k] = leftArr[i]
                i += 1
                k += 1
            }
            // If elements are only left in right array
            while j < rightArr.count{
                arr[k] = rightArr[j]
                j += 1
                k += 1
            }
        }
    }
}

var mergeSorter = MergeSort()
print("Original Array")
print(array)
mergeSorter.mergeSort(arr: &array)
print("Sorted Array")
print(array)