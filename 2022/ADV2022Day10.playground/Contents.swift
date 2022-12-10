import Foundation

var CRT: [[String]] = Array(repeating: Array(repeating: " ", count: 40), count: 6)

var sumStrength = 0

/*
 Cycle   1 -> ######################################## <- Cycle  40
 Cycle  41 -> ######################################## <- Cycle  80
 Cycle  81 -> ######################################## <- Cycle 120
 Cycle 121 -> ######################################## <- Cycle 160
 Cycle 161 -> ######################################## <- Cycle 200
 Cycle 201 -> ######################################## <- Cycle 240
 */

var X = 1
var currentCRTRow = 0
var currentCRTColumn = 0

var cycle = 0 {
  didSet {
    // Draw check
    let isStartOfRow = cycle % 40 == 0
    
    let isXOnScreen = X >= 0 && X <= 39
    
    let posInRow = 0
    
    if currentCRTColumn <= 39 {
      let drawHash =
        X == currentCRTColumn ||
        X == currentCRTColumn - 1 ||
        X == currentCRTColumn + 1
      
      CRT[currentCRTRow][currentCRTColumn] = drawHash ? "#" : " "
      
      print("Drawing \(drawHash ? "#" : ".") at \(currentCRTRow) \(currentCRTColumn) because X is \(X), cycle \(cycle)")
    }
    
    if isStartOfRow && cycle != 240 {
      currentCRTRow += 1
      currentCRTColumn = 0
    } else {
      currentCRTColumn += 1
    }
    
    // Strength
    guard cycle == 20 || cycle == 60 || cycle == 100 || cycle == 140 || cycle == 180 || cycle == 220 else { return }
    
    sumStrength += X * cycle
  }
}

for line in Problem.load(fileName: "input") {
  let split = line.components(separatedBy: " ")
  let cmd = split.first!
  
  print("exec \(line)")
  
  cycle += 1
  
  switch cmd {
  case "noop":
    break
  case "addx":
    cycle += 1
    
    let val = Int(split.last!)!
    X += val
    
    print("X added")
    break
  default: continue
  }
}

print("Final x:", X)
print("Cycle count:", cycle)
print("Sum is:", sumStrength)

print()

for line in CRT {
  for char in line {
    print(char, separator: "", terminator: "")
  }
  print()
}
