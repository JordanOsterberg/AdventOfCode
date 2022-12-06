import Foundation

public extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}

let lines = Problem.load(fileName: "input")

var crateLines: [String] = []
var instructionLines: [String] = []

var loadingCrates = true
for line in lines {
  if line.isEmpty {
    loadingCrates = false
    continue
  }
  
  if loadingCrates {
    crateLines.append(line)
  } else {
    instructionLines.append(line)
  }
}

var charIndexToCrate: [Int: Int] = [:]
var crates: [Int: [String]] = [:]
for (index, crateLine) in crateLines.reversed().enumerated() {
  if index == 0 {
    for val in crateLine {
      guard val.isNumber else { continue }
      guard let index = crateLine.firstIndex(of: val) else { continue }
      let idx = crateLine.distance(from: crateLine.startIndex, to: index)
      
      charIndexToCrate[Int(idx)] = Int(String(val))!
    }
    
    print(charIndexToCrate)
  } else {
    for (index, crateNum) in charIndexToCrate {
      guard index < crateLine.count else { continue }
      
      let val = crateLine[index]
      guard val.isLetter else { continue }
      if var array = crates[crateNum] {
        array.append(String(val))
        crates[crateNum] = array
      } else {
        crates[crateNum] = [String(val)]
      }
    }
  }
}

print(crates)

for instruction in instructionLines {
  var amount = 0
  var startPos = 0
  var endPos = 0

  for (index, str) in instruction.components(separatedBy: " ").enumerated() {
    if index == 1 {
      amount = Int(str)!
    }
    if index == 3 {
      startPos = Int(str)!
    }
    if index == 5 {
      endPos = Int(str)!
    }
  }

  // part one
//  for val in 0..<amount {
//    guard let crateToMove = crates[startPos]?.popLast() else {
//      continue
//    }
//
//    crates[endPos]?.append(crateToMove)
//  }
  
  var startPile = crates[startPos]
  var endPile = crates[endPos]
  
  if let toRemove = startPile?.suffix(amount) {
    startPile?.removeLast(amount)
    endPile?.append(contentsOf: toRemove)
  }
  
  crates[startPos] = startPile!
  crates[endPos] = endPile!
}

var tops: [Int: String] = [:]
for (idx, boxes) in crates {
  var copiedBoxes = Array(boxes)
  tops[idx] = copiedBoxes.popLast()!
}

let sortedKeys = tops.keys.sorted { one, two in
  one < two
}

var str = ""
for key in sortedKeys {
  str += tops[key]!
}

print(str)
