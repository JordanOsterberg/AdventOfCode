import Foundation

public enum Problem {
  /// Load input from a file and begin solving
  public static func load(fileName: String) -> [String] {
    let filePath = Bundle.main.url(forResource: fileName, withExtension: "txt")!

    let data = try! Data(contentsOf: filePath)
    let input = String(data: data, encoding: .utf8)!

    var lines = input.components(separatedBy: .newlines)
    _ = lines.removeLast()
    return lines
  }
}

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

extension ClosedRange {
    static func ~=(lhs: Self, rhs: Self) -> Bool {
        rhs.clamped(to: lhs) == rhs
    }
}
