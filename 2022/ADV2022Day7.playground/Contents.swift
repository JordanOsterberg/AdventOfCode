import Foundation

let lines = Problem.load(fileName: "input")

class Directory {
  var name: String
  var files: [String: Int]
  var parent: Directory?
  var children: [Directory]
  
  var size: Int {
    files.values.reduce(0, +) + children.map({ $0.size }).reduce(0, +)
  }
  
  init(name: String, parent: Directory? = nil) {
    self.name = name
    self.files = [:]
    self.parent = parent
    self.children = []
  }
}

var topDir: Directory?
var currentDirectory: Directory?

for line in lines {
  if line.starts(with: "$") {
    var cmd = String(line)
    cmd.removeFirst(2)
    
    if cmd.prefix(2) == "cd" {
      let path = cmd.components(separatedBy: " ").last!
      
      if path == ".." {
        currentDirectory = currentDirectory?.parent
      } else if currentDirectory == nil {
        let newDir = Directory(name: path)
        currentDirectory = newDir
        topDir = newDir
      } else {
        let newDir = currentDirectory?.children.first(where: { dir in
          dir.name == path
        })
        currentDirectory = newDir
      }
    }
  } else {
    if line.starts(with: "dir") {
      let dirName = line.components(separatedBy: " ").last!
      currentDirectory?.children.append(.init(name: dirName, parent: currentDirectory))
    } else {
      let comps = line.components(separatedBy: " ")
      let fileSize = Int(comps.first!)!
      currentDirectory?.files[comps.last!] = fileSize
    }
  }
}

guard let topDir else { fatalError() }

print("top dir size", topDir.size)

var allDirs: [Directory] = []
func addToAll(_ dir: Directory) {
  allDirs.append(dir)
  dir.children.forEach { child in
    addToAll(child)
  }
}
addToAll(topDir)

var undersizedDirs: [Directory] = []
var deletable: [Directory] = []

for dir in allDirs {
  if dir.size <= 100_000 {
    undersizedDirs.append(dir)
  } else {
    deletable.append(dir)
  }
}
print("part one:", undersizedDirs.map({ $0.size }).reduce(0, +))

let unusedSpace = 70_000_000 - topDir.size
let requiredSpace = 30_000_000

let minimumDelete = requiredSpace - unusedSpace

print(minimumDelete)

let shouldDelete = deletable
  .sorted(by: { one, two in
    one.size < two.size
  })
  .filter({ $0.size > minimumDelete })
  .first

print("part two: delete \(shouldDelete?.name) with size \(shouldDelete?.size)")
