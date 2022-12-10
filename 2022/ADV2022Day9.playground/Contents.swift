import Foundation

/*
 ......
 ......
 ......
 ......
 H.....  (H covers T, s)
 */

struct Coordinate: Hashable {
  var x: Int
  var y: Int
}

func partOne() {
  var hPos = (0, 0)
  var tPos = (0, 0)
  
  var tailCoordinatesVisited: Set<Coordinate> = .init()
  tailCoordinatesVisited.insert(.init(x: 0, y: 0))
  
root: for line in Problem.load(fileName: "input") {
  let split = line.components(separatedBy: " ")
  let direction = split.first!
  let number = Int(split.last!)!
  
  print(direction, number)
  
  for stepNum in stride(from: 0, to: number, by: 1) {
    var newHPos = (0, 0)
    
    switch direction {
    case "R": newHPos = (hPos.0 + 1, hPos.1)
    case "L": newHPos = (hPos.0 - 1, hPos.1)
    case "U": newHPos = (hPos.0, hPos.1 + 1)
    case "D": newHPos = (hPos.0, hPos.1 - 1)
    default: continue
    }
    
    hPos = newHPos
    
    var newTPos = tPos
    
    if abs(hPos.0 - tPos.0) > 1 {
      if hPos.1 != tPos.1 { // diff y
        if hPos.1 > tPos.1 { // move tail up
          newTPos.1 += 1
        } else {
          newTPos.1 -= 1
        }
      }
      
      if direction == "R" {
        newTPos.0 += 1 // move tail 1 forward
      } else {
        newTPos.0 -= 1 // move tail 1 back
      }
    }
    
    if abs(hPos.1 - tPos.1) > 1 {
      if hPos.0 != tPos.0 { // diff x
        if hPos.0 > tPos.0 { // move tail to right
          newTPos.0 += 1
        } else {
          newTPos.0 -= 1
        }
      }
      
      if direction == "U" {
        newTPos.1 += 1 // move tail 1 up
      } else {
        newTPos.1 -= 1 // move tail 1 down
      }
    }
    
    tPos = newTPos
    
    tailCoordinatesVisited.insert(.init(x: newTPos.0, y: newTPos.1))
  }
}
  
  print("unique coords total", tailCoordinatesVisited.count)
  print(tailCoordinatesVisited)
  
}

func partTwo() {
  var rope: [(Int, Int)] = Array(repeating: (0, 0), count: 10)
  
  var tailCoordinatesVisited: Set<Coordinate> = .init()
  tailCoordinatesVisited.insert(.init(x: 0, y: 0))
  
  let adjacentMatches = [
    (0, 0),
    (0, 1),
    (-1, 0),
    (1, 0),
    (0, -1)
  ]
  
  let diagonalMatches = [
    (0, 0),
    (1, 1),
    (1, -1),
    (-1, 1),
    (-1, -1)
  ]
  
  let neighborMatches = [
    (0, 0),
    (0, 1),
    (-1, 0),
    (1, 0),
    (0, -1),
    (-1, -1),
    (-1, 1),
    (1, -1),
    (1, 1)
  ]
  
  // https://github.com/CatDevz/AdventOfCode/blob/master/2022/9/main.rs
  // thanks cody o_o
  // will probably revisit because I cannot figure out why my p1 doesn't scale properly
  root: for line in Problem.load(fileName: "input") {
    let split = line.components(separatedBy: " ")
    let directionInput = split.first!
    let number = Int(split.last!)!
    
    var direction = (0, 0)
    switch directionInput {
    case "R": direction = (1, 0)
    case "L": direction = (-1, 0)
    case "U": direction = (0, 1)
    case "D": direction = (0, -1)
    default: continue
    }
    
    for _ in stride(from: 0, to: number, by: 1) {
      rope[0] = (rope.first!.0 + direction.0, rope.first!.1 + direction.1)
      
      var newRope: [(Int, Int)] = rope
      knotLoop: for (knotIndex, knot) in rope.enumerated() {
        guard knotIndex > 0 else { continue }
        
        let prevKnot = rope[knotIndex - 1]
        
        for y in -1...1 {
          for x in -1...1 {
            let testKnot = (knot.0 + x, knot.1 + y)
            if testKnot == prevKnot {
              continue knotLoop
            }
          }
        }
        
        for direction in adjacentMatches {
          let moved = (knot.0 + direction.0, knot.1 + direction.1)
          for direction in adjacentMatches {
            let testKnot = (moved.0 + direction.0, moved.1 + direction.1)
            if testKnot == prevKnot {
              newRope[knotIndex] = moved
              continue knotLoop
            }
          }
        }
        
        for direction in diagonalMatches {
          let moved = (knot.0 + direction.0, knot.1 + direction.1)
          for direction in neighborMatches {
            let testKnot = (moved.0 + direction.0, moved.1 + direction.1)
            if testKnot == prevKnot {
              newRope[knotIndex] = moved
              continue knotLoop
            }
          }
        }
      }
      
      rope = newRope
      
      tailCoordinatesVisited.insert(.init(x: rope.last!.0, y: rope.last!.1))
    }
  }
  
  print("unique coords total", tailCoordinatesVisited.count)
}

partTwo()
