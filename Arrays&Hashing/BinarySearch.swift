import Swift
/*
- Works only on sorted array
- returns the index at which the element is found
- follows divide and conquer tech
- divede the array into by finding the middle element
- compares the value to be found with the middle element 
- if value > midElement then searching has to be done on left side of mid element othrewise on right side
- This is continued till we havn"t compare all the elements
Time complexity -
Worst case (happens when seraching element is either in the beg of array or the end of the array) and Average case  O(log n)
Best Cae O(1)which occurs when the central index directly matches the searched value
Space Complexity
*/

var array: [Int] = [1,5,8,10,14,15,40,50,66,77,100]
class BinarySearch{

    func binarySearch(arr: [Int], value: Int) -> Int?{
        //check the array is not empty
        guard !array.isEmpty else {
            return nil
        }
        //if array has only one element
        if array.count == 1 {
            return array[0] == value ? 0 : nil
        }

        //if array has more than one elements
        var left: Int = 0
        var right: Int = array.count - 1

        while left <= right {
            let middleIndex = (left+right)/2 //4.5 = 4
            let middleValue = array[middleIndex]
            if value < middleValue {
                right = middleIndex - 1
            }
            else if value > middleValue{
                left = middleIndex + 1
            }
            else if value == middleValue {
                return middleIndex
            }

        }

        return nil //in case there is no value 

    }
}
var binarySearchinator = BinarySearch()
var valueFoundAtIndex = binarySearchinator.binarySearch(arr: array, value: 10)
print(valueFoundAtIndex ?? -1)