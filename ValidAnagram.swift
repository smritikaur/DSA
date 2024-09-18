import Swift
/*
LeetCode Problem
242. Valid Anagram
*/
class ValidAnagram {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        //Case1- check if length of two string is equal or not
        if s.count != t.count{
            return false
        }
        //Create Hashmaps which are eqv to Dict in swift like python
        var countS = [Character:Int]()
        var countT = [Character: Int]()
        /*
        for i in 0..<s.count{
            let indexS = s.index(s.startIndex, offsetBy: i)
            let indexT = t.index(t.startIndex, offsetBy: i)
            countS[s[indexS]] = 1 + countS[s[indexS], default: 0]
            countT[t[indexT]] = 1 + countT[t[indexT], default: 0]
        }
        */
        for char in s {
            countS[char] = 1 + countS[char, default: 0]   
        }
        for char in t {
            countT[char] = 1 + countT[char, default: 0]
        }
        // check for equality of hashmaps
        // or return countS == countT
        for (key,value) in countS{
            if countT[key, default: 0] != value{
                return false
            }
        }
        return true
    }
}
let validAnagraminator = ValidAnagram()
let ans = validAnagraminator.isAnagram("anagram", "nagaram")
print(ans)