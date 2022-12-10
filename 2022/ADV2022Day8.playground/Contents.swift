import Foundation

let lines = Problem.load(fileName: "input")

var trees: [[Int]] = []

for line in lines {
  var row: [Int] = []
  for c in line {
    row.append(Int(String(c))!)
  }
  trees.append(row)
}

print(trees)

let rowLength = trees.first!.count

func partOne() {
  var amountVisible = 0
  for row in 0..<trees.count {
    let rowContent = trees[row]
    outer: for column in 0..<rowContent.count {
      let columnTree = rowContent[column]
      
      // Edge detection
      if row == 0 || row == trees.count - 1 {
        amountVisible += 1
        print("\(row) \(column) edge visible")
        continue
      } else if column == 0 || column == rowContent.count - 1 {
        amountVisible += 1
        print("\(row) \(column) column visible")
        continue
      }
      
      var leftMatches = true
      for i in stride(from: column, to: 0, by: -1) {
        var matchesAll = true
        if i != 0 {
          let left = trees[row][i - 1]
          
          if left >= columnTree {
            leftMatches = false
            break
          }
        }
      }
      
      if leftMatches {
        amountVisible += 1
        print("add for \(columnTree) at [\(row)][\(column)] L")
        continue outer
      }
      
      var aboveMatches = true
      for i in stride(from: row, to: 0, by: -1) {
        if i != 0 {
          let above = trees[i - 1][column]
          
          if above >= columnTree {
            aboveMatches = false
            break
          }
        }
      }
      if aboveMatches {
        amountVisible += 1
        print("add for \(columnTree) at [\(row)][\(column)] A")
        continue outer
      }
      
      var belowMatches = true
      for i in stride(from: row, to: trees.count, by: 1) {
        if i != trees.count - 1 {
          let below = trees[i + 1][column]
          
          if below >= columnTree {
            belowMatches = false
            break
          }
        }
      }
      if belowMatches {
        amountVisible += 1
        print("add for \(columnTree) at [\(row)][\(column)] B")
        continue outer
      }
      
      var rightMatches = true
      for i in stride(from: column, to: rowContent.count - 1, by: 1) {
        if i != rowContent.count - 1 {
          let right = trees[row][i + 1]
          
          if right >= columnTree {
            rightMatches = false
            break
          }
        }
      }
      
      if rightMatches {
        amountVisible += 1
        print("add for \(columnTree) at [\(row)][\(column)] R")
        continue outer
      }
    }
  }

  print("Total visible", amountVisible)


}

func partTwo() {
  var highestScore = 0
  
  for row in 0..<trees.count {
    let rowContent = trees[row]
    outer: for column in 0..<rowContent.count {
      let columnTree = rowContent[column]
      
      // Edge detection
      if row == 0 || row == trees.count - 1 {
        continue
      } else if column == 0 || column == rowContent.count - 1 {
        continue
      }
      
      var leftVisible = 0
      for i in stride(from: column, to: 0, by: -1) {
        if i != 0 {
          let left = trees[row][i - 1]
          
          leftVisible += 1
          
          if left >= columnTree {
            print("broke for \(row) \(i - 1) because \(left) >= \(columnTree)... original \(row) \(column)")
            break
          }
        }
      }
      
      var aboveVisible = 0
      for i in stride(from: row, to: 0, by: -1) {
        if i != 0 {
          let above = trees[i - 1][column]
          
          aboveVisible += 1
          
          if above >= columnTree {
            break
          }
        }
      }
      
      var belowVisible = 0
      for i in stride(from: row, to: trees.count, by: 1) {
        if i != trees.count - 1 {
          let below = trees[i + 1][column]
          
          belowVisible += 1
          
          if below >= columnTree {
            break
          }
        }
      }
      
      var rightVisible = 0
      for i in stride(from: column, to: rowContent.count - 1, by: 1) {
        if i != rowContent.count - 1 {
          let right = trees[row][i + 1]
          
          rightVisible += 1
          
          if right >= columnTree {
            break
          }
        }
      }
      
      let score = leftVisible * rightVisible * aboveVisible * belowVisible
      print("score for [\(row),\(column)] is \(score), \(leftVisible) \(rightVisible) \(aboveVisible) \(belowVisible)")
      if score > highestScore {
        highestScore = score
        print("NEW HS at [\(row),\(column)]... \(score)")
      }
    }
  }
  
  print("HS is \(highestScore)")
}

partTwo()
