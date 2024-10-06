import Swift
/*
LeetCode Problem - 125
Valid Palindrome

Brute Force - Time complexity = Space Complexity = O(n)

Two Pointer Approach - Time complexity = O(n), Space Complexity = O(1) 

*/


class ValidPalindrome {
    func isPalindrome(_ s: String) -> Bool {
        // ---- Solution One  - Time complexity = Space Complexity = O(n) ----

        /* 
        let characters = Array(s) // Convert string to array for faster indexing
        var pointer1 = 0
        var pointer2 = characters.count - 1

        while pointer1 < pointer2 {
            /*
            let index1 = s.index(s.startIndex, offsetBy: pointer1)
            let index2 = s.index(s.startIndex, offsetBy: pointer2)
            let startChar = s[index1]
            let endChar = s[index2]
            */
            let startChar = characters[pointer1]
            let endChar = characters[pointer2]
            // Skip non-alphanumeric characters for pointer1
            if !startChar.isLetter && !startChar.isNumber {
                pointer1 += 1
                continue
            }
            // Skip non-alphanumeric characters for pointer2
            if !endChar.isLetter && !endChar.isNumber {
                pointer2 -= 1
                continue
            }
            // Compare characters after converting to lowercase
            if startChar.lowercased() != endChar.lowercased() {
                return false
            }
            // Move pointers if characters match
            pointer1 += 1
            pointer2 -= 1
        }
        return true
    }
    */


    // ---- Solution Two - Time complexity = O(n), Space Complexity = O(1)  -operating directly on the string using two pointers without converting it to an array.----
        var pointer1 = s.startIndex
        var pointer2 = s.index(before: s.endIndex)
        while pointer1 < pointer2 {
            // Move pointer1 to the next alphanumeric character
            while pointer1 < pointer2 && !s[pointer1].isLetter && !s[pointer1].isNumber {
                pointer1 = s.index(after: pointer1)
            }
            // Move pointer2 to the previous alphanumeric character
            while pointer1 < pointer2 && !s[pointer2].isLetter && !s[pointer2].isNumber {
                pointer2 = s.index(before: pointer2)
            }           
            // Ensure we haven't gone out of bounds after moving pointers
            if pointer1 >= pointer2 {
                break
            }           
            // Compare characters after converting to lowercase
            if s[pointer1].lowercased() != s[pointer2].lowercased() {
                return false
            }
            pointer1 = s.index(after: pointer1)
            pointer2 = s.index(before: pointer2)
        }      
        return true
    }
}