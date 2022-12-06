import Foundation

extension ClosedRange {
    static func ~=(lhs: Self, rhs: Self) -> Bool {
        rhs.clamped(to: lhs) == rhs
    }
}

var totalContained = 0

for line in Problem.load(fileName: "input") {
  var ranges: [ClosedRange<Int>] = []
  for range in line.components(separatedBy: ",") {
    let ints = range.components(separatedBy: "-")
    ranges.append(Int(ints.first!)!...(Int(ints.last!)!))
  }
  
  let firstRange = ranges.first!
  let secondRange = ranges.last!
  
//  if firstRange ~= secondRange {
//    print("First contains second for \(line)")
//    totalContained += 1
//  } else if secondRange ~= firstRange {
//    print("Second contains first for \(line)")
//    totalContained += 1
//  }
  
  for int in firstRange {
    if secondRange.contains(int) {
      print("second range contains int from first \(firstRange) \(int) \(secondRange)")
      totalContained += 1
      break
    }
  }
}

print(totalContained)
