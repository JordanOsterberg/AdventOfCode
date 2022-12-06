import Foundation

let filePath = Bundle.main.url(forResource: "input", withExtension: "txt")!

let data = try! Data(contentsOf: filePath)
let input = String(data: data, encoding: .utf8)!

enum RoundState {
  case won
  case lost
  case draw
}

enum PlayerChoice: String {
  case rock = "X"
  case paper = "Y"
  case scissors = "Z"
  
  var points: Int {
    switch self {
    case .rock: return 1
    case .paper: return 2
    case .scissors: return 3
    }
  }
}

enum EnemyChoice: String {
  case rock = "A"
  case paper = "B"
  case scissors = "C"
  
  func sameAs(playerChoice: PlayerChoice) -> Bool {
    switch playerChoice {
    case .paper: return self == .paper
    case .rock: return self == .rock
    case .scissors: return self == .scissors
    }
    
    return false
  }
}

func partOne() {
  var points = 0

  for val in input.components(separatedBy: .newlines) {
    let split = val.split(separator: " ")
    if split.isEmpty { continue }
    
    guard let enemyChoice = EnemyChoice(rawValue: String(split.first!)) else { continue }
    guard let playerChoice = PlayerChoice(rawValue: String(split.last!)) else { continue }
    
    points += playerChoice.points
    
    if enemyChoice.sameAs(playerChoice: playerChoice) {
      points += 3 // draw = 3 points
      continue
    }
    
    if playerChoice == .rock {
      if enemyChoice == .paper {
        continue
      }
    }
    
    if playerChoice == .paper {
      if enemyChoice == .scissors {
        continue
      }
    }
    
    if playerChoice == .scissors {
      if enemyChoice == .rock {
        continue
      }
    }
    
    points += 6
    
    print(enemyChoice, playerChoice)
  }

  print(points)
}

func partTwo() {
  var points = 0

  for val in input.components(separatedBy: .newlines) {
    let split = val.split(separator: " ")
    if split.isEmpty { continue }
    
    let enemyChoice = String(split.first!)
    let reqOutcome = String(split.last!)
    
    if reqOutcome == "Y" {
      points += 3 // add points for drawing
      
      if enemyChoice == "A" { // if enemy chooses Rock, use Rock
        points += PlayerChoice.rock.points
      }
      
      if enemyChoice == "B" {
        points += PlayerChoice.paper.points
      }
      
      if enemyChoice == "C" {
        points += PlayerChoice.scissors.points
      }
    } else if reqOutcome == "Z" {
      points += 6
      
      if enemyChoice == "A" {
        points += PlayerChoice.paper.points
      }
      
      if enemyChoice == "B" {
        points += PlayerChoice.scissors.points
      }
      
      if enemyChoice == "C" {
        points += PlayerChoice.rock.points
      }
    } else if reqOutcome == "X" {
      if enemyChoice == "A" {
        points += PlayerChoice.scissors.points
      }
      
      if enemyChoice == "B" {
        points += PlayerChoice.rock.points
      }
      
      if enemyChoice == "C" {
        points += PlayerChoice.paper.points
      }
    }
  }

  print(points)
}

partTwo()
