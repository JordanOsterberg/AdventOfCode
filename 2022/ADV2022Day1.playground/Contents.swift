import Foundation

let filePath = Bundle.main.url(forResource: "day1_input", withExtension: "txt")!

let data = try! Data(contentsOf: filePath)
let input = String(data: data, encoding: .utf8)

struct Elf {
  var calories: [Int]
  var totalCalories: Int {
    return calories.reduce(0, +)
  }
}

var elves: [Elf] = []
var currentElf: Elf = .init(calories: [])

for val in input!.components(separatedBy: .newlines) {
  if val.isEmpty {
    elves.append(currentElf)
    currentElf = .init(calories: [])
    continue
  }
  
  currentElf.calories.append(Int(val) ?? 0)
}

let sorted = elves.map({ $0.totalCalories }).sorted().reversed()
print("top elf is \(sorted.first!)")

let topThree = sorted.prefix(3)
print(topThree.reduce(0, +))
