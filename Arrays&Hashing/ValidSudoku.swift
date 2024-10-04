import Swift
/*
LeetCode Problem: 36
Valid Sudoku
*/

class ValidSudoku{
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        // Define dictionaries(HashMap) to keep track of numbers in rows, columns, and squares
        var rows: [Int: Set<Character>] = [:]
        var cols: [Int: Set<Character>] = [:]
        var squares: [String: Set<Character>] = [:]
        // Iterate over the board
        for r in 0..<9 {
            for c in 0..<9 {
                let value = board[r][c]
                // Skip empty cells
                if value == "." {
                    continue
                }
                // Compute the key for the square
                let squareKey = "\(r / 3)-\(c / 3)"
                // Initialize sets if they don't exist
                /*
                Example
Imagine you're iterating through the board and accessing row 0 for the first time:

Initially, rows[0] is nil because no value has been stored for that key.
The code checks if rows[r] == nil and sees that it’s true, so it creates a new, empty set for rows[0].
Now, when you insert a value into rows[0], it works smoothly because rows[0] points to a valid Set<Character> instead of nil.
                */
                if rows[r] == nil { rows[r] = Set<Character>() }
                if cols[c] == nil { cols[c] = Set<Character>() }
                if squares[squareKey] == nil { squares[squareKey] = Set<Character>() }

                // Check if the value already exists in the row, column, or square
                if rows[r]!.contains(value) || cols[c]!.contains(value) || squares[squareKey]!.contains(value) {
                    return false
                }
                // Add value to the corresponding row, column, and square sets
                rows[r]!.insert(value)
                cols[c]!.insert(value)
                squares[squareKey]!.insert(value)
            }
        }
        return true
    }
}

let validSudokuInator = ValidSudoku()
let ans1 = validSudokuInator.isValidSudoku([["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]])
print(ans1)
let ans2 = validSudokuInator.isValidSudoku([["8","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]])
print(ans2)