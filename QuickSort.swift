import Swift
/*
ALGORITHM:
QuickSort(arr, left, right) {
   if (left<right) {
    partition_pos = partition(arr, left, right)
    QuickSort(arr, left, partition_pos)
    QuickSort(arr, partition_pos+1, right)
   }
}
Best Case: When partitions happens in the middle for every array
Time Complexity - O(nlogn)
Space Complexity - O(log n) -sc depends on ht of tree
Worst Case: When partitions happens in the beginning or in the end in sorted array
Time Complexity - O(n*n)
Space Complexity - O(n)
*/

var array: [Int] = [22,11,88,66,55,77,33,44]//8
class QuickSort {    
    func quickSort(arr: inout [Int], left: Int, right: Int) {
        //checks that array has at least two elements
        if left < right { 
            let partition_pos = partition(arr: &arr, left: left, right: right)
            //Call QuickSort again recursively on sub-arrays
            quickSort(arr: &arr, left: left, right: partition_pos - 1)
            quickSort(arr: &arr, left: partition_pos + 1, right: right)
        } 
    }

    func partition(arr: inout [Int], left: Int, right: Int) -> Int {
        // var mutatedArray = arr
        //Set -up
        var i = left
        var j = right - 1
        let pivot = arr[right]
        // Procedure
        // continues till j does not comes to the right side of i because when this happens we interchange i with pivot
        while i < j {
            //increment i till the value at i is less than pivot
            while i < right && arr[i] < pivot {
                i =  i + 1
            }
            //decrement j till the value at j is greater than pivot
            while j > left && arr[j] >= pivot {
                j = j - 1
            }
            //Swap i and j
            if i < j {
                arr.swapAt(i,j)
            }
        }
        //After i and j crossed interchange pivot with i
        if arr[i] > pivot{
            arr.swapAt(i,right)
        }
        return i
    }
}
let obj = QuickSort()
print("Original Array")
print(array)
obj.quickSort(arr: &array, left: 0, right: array.count - 1)
print("Sorted Array")
print(array)
