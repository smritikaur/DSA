import Swift
/*=========================
This executed in leetcode*/
// class GroupAnagrams{
//     func groupAnagrams(_ strs: [String]) -> [[String]] {

//         // BRUTE FORCE METHOD - Time Complexity - O(m*n*logn)
//         // The above solution takes O(mnlogn) time nlogn time for sorting...
//         //...and we have to sort each item in arrayso it will take around o(m*n*logn) time.

//         /*var result = [[String]]()
//         var visited: [Bool] = Array(repeating: false, count: strs.count)

//         for i in 0..<strs.count {
//             if visited[i]{
//                 continue  // If already grouped, skip it
//             }
//             let sortedStrI = strs[i].sorted()
//             var currentGroup : [String] = [strs[i]]
//             for j in i+1..<strs.count {
//                 let sortedStrJ = strs[j].sorted()
//                 if sortedStrI == sortedStrJ{
//                     currentGroup.append(strs[j])
//                     visited[j] = true
//                 }     
//             }
//             result.append(currentGroup)
//         }
//         return result 
//         */

//         //USING HASHMAP - Time complexity reduces to O(m*n)

//         var dict = [[Int]: [String]]()
//         //imp to mention Character datatype explicitly over here otherwise swift compiler confuses it with string and we are not able to use asciiValue method.
//         let initialChar: Character = "a"
//         for s in strs{
//             var count: [Int] = Array(repeating: 0, count: 26) // a ... z
//             for c in s{
//                 if let asciiValue = c.asciiValue, let baseAsciiValue = initialChar.asciiValue {
//                     count[Int(asciiValue - baseAsciiValue)] += 1 //key - 
//                 }
//             }
            
//             if dict[count] != nil { // because dict are optional
//                 dict[count]?.append(s)  // If key exists, append the string
//             } else {
//                 dict[count] = [s]  // If key doesn't exist, create a new entry with the string
//             } 
//         }
//         return Array(dict.values)
//     }

//     /*
//     dict looks like -
//     {
//         (1, 0, 0, ..., 1): ["eat", "tea", "ate"],
//         (1, 0, 0, ..., 1, 1): ["tan", "nat"],
//         (1, 1, 0, ..., 1): ["bat"]
//     }
//     */
// }

// let grpAnagramInator = GroupAnagrams()
// let ans = grpAnagramInator.groupAnagrams(["eat","tea","tan","ate","nat","bat"])
// print(ans)




// ===========================
// This code executes in VSCode without giving any errors
class GroupAnagrams {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var dict = [String: [String]]()
        let initialCharScalarValue = Unicode.Scalar("a")!.value
        
        for s in strs {
            var count: [Int] = Array(repeating: 0, count: 26) // a ... z
            
            for c in s {
                if let unicodeScalar = c.unicodeScalars.first {
                    let index = Int(unicodeScalar.value - initialCharScalarValue)
                    count[index] += 1
                }
            }
            
            // Convert the count array to a string to make it hashable
            let key = count.map { String($0) }.joined(separator: "#")
            
            if dict[key] != nil {
                dict[key]?.append(s)
            } else {
                dict[key] = [s]
            }
        }
        return Array(dict.values)
    }
}

let grpAnagramInator = GroupAnagrams()
let ans = grpAnagramInator.groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat", "hhh", "jjj", "kk", "hhh", "kk"])
print(ans)

