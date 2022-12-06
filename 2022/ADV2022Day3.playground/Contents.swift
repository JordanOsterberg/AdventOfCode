import Foundation

let filePath = Bundle.main.url(forResource: "input", withExtension: "txt")!

let data = try! Data(contentsOf: filePath)
let input = String(data: data, encoding: .utf8)!

extension String {

    var length: Int {
        return count
    }

    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }

    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}

var totalPoints = 0

struct Group {
  var bags: [String]
}

var groups: [Group] = []
var currGroup: Group = .init(bags: [])

var currentIndex = 0
for val in input.components(separatedBy: .newlines) {
  if currentIndex >= 3 {
    currentIndex = 0
    groups.append(currGroup)
    currGroup = .init(bags: [])
  }
  
  currGroup.bags.append(val)
  
  currentIndex += 1
}

//var cur = 0
//for val in input.components(separatedBy: .newlines) {
//  guard val.isEmpty == false else { continue }
//
//  if cur >= 3 {
//    groups.append(currGroup)
//    currGroup = .init(bags: [])
//    cur = 0
//  } else {
//    cur += 1
//  }
//
//  currGroup.bags.append(val)
//
////  let first = val.prefix(val.count / 2)
////  let second = val.suffix(val.count / 2)
////
////  var common: Set<String> = .init()
////
////  for letter in first {
////    for secondLetter in second {
////      if secondLetter == letter {
////        common.insert(String(secondLetter))
////      }
////    }
////  }
////
////  let alphabet = "abcdefghijklmnopqrstuvwxyz"
////  let captailizedAlphabet = alphabet.uppercased()
////
////  let fullAlphabet = "\(alphabet)\(captailizedAlphabet)"
////
////  for letter in common {
////    let points = fullAlphabet.distance(from: fullAlphabet.startIndex, to: fullAlphabet.firstIndex(of: letter.first!)!) + 1
////    totalPoints += points
////  }
//}

groups.append(currGroup)
print(groups.count, "total groups")

for group in groups {
  if group.bags.count != 3 {
    print("FAIL GROUP \(group)")
  }
}

totalPoints = 0
for group in groups {
  var common: Set<String> = .init()
  
  for bag in group.bags {
    print(bag)
    
    for char in bag {
      var matches = 0
      
      for otherBag in group.bags {
        guard otherBag != bag else { continue }
        
        if otherBag.contains(where: { otherchar in
          otherchar == char
        }) {
          matches += 1
        }
      }
      
      if matches >= 2 {
        common.insert(String(char))
        print("Matches for \(char) is \(matches), \(char.utf8)")
      }
    }
  }
  
  let alphabet = "abcdefghijklmnopqrstuvwxyz"
  let captailizedAlphabet = alphabet.uppercased()

  let fullAlphabet = "\(alphabet)\(captailizedAlphabet)"

  for letter in common {
    let points = fullAlphabet.distance(from: fullAlphabet.startIndex, to: fullAlphabet.firstIndex(of: letter.first!)!) + 1
    totalPoints += points
  }
}
print(totalPoints)
