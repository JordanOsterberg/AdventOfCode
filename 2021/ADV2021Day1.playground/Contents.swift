import Foundation

let filePath = Bundle.main.url(forResource: "input", withExtension: "txt")!

let data = try! Data(contentsOf: filePath)
let input = String(data: data, encoding: .utf8)!

func one() {
  var totalLargerThanPrev = 0
  var prevInt: Int?

  for line in input.components(separatedBy: .newlines) {
    guard let int = Int(line) else { continue }
    
    if let prevInt = prevInt {
      if int > prevInt {
        totalLargerThanPrev += 1
      }
    }

    prevInt = int
  }

  print(totalLargerThanPrev)
}

one()

func two() {
  var totalLargerThanPrev = 0
  var prevInt: (Int?, Int?, Int?)

  for line in input.components(separatedBy: .newlines) {
    guard let int = Int(line) else { continue }
    
    prevInt.0 = 1
  }

  print(totalLargerThanPrev)
}

two()
