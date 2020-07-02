import UIKit

enum WindDirection: String, CaseIterable {
    case south
    case north
    case east
    case west
}

let all = WindDirection.allCases
all.forEach{ (direction) in
    print(direction.rawValue)
}

let mistral: WindDirection = .south

func showDir(_ dir: WindDirection) -> String {
    switch mistral {
    case .south:
        return "Sud"
    case .east:
        return "Est"
    case .north:
        return "Nord"
    case .west:
        return "Ouest"
    }
}

class Wind {
    var name: String
    var direction: WindDirection
    
    init(name: String, direction: WindDirection) {
        self.name = name
        self.direction = direction
    }
}

let sirocco = Wind(name: "Sirocco", direction: .north)
print(showDir(sirocco.direction))
print(sirocco.direction.rawValue)
