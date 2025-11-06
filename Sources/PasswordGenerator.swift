import Foundation

class PasswordGenerator {
    private let colors = [
        "red", "blue", "green", "yellow", "purple", "orange", "pink", "brown",
        "black", "white", "gray", "cyan", "magenta", "violet", "indigo", "teal",
        "navy", "maroon", "olive", "lime", "aqua", "silver", "gold", "coral",
        "crimson", "azure", "beige", "tan", "khaki", "ivory", "pearl", "ruby",
        "emerald", "amber", "jade", "onyx", "topaz", "bronze", "copper", "pewter"
    ]

    private let words = [
        "Hat", "Cat", "Dog", "Bird", "Fish", "Tree", "Rock", "Star", "Moon", "Sun",
        "Cloud", "Rain", "Snow", "Wind", "Fire", "Water", "Earth", "Sky", "Ocean", "River",
        "Mountain", "Valley", "Hill", "Lake", "Forest", "Desert", "Island", "Beach", "Cave", "Canyon",
        "Tiger", "Lion", "Bear", "Wolf", "Fox", "Eagle", "Hawk", "Owl", "Deer", "Rabbit",
        "Book", "Pen", "Paper", "Desk", "Chair", "Table", "Door", "Window", "Wall", "Floor",
        "Apple", "Banana", "Cherry", "Grape", "Lemon", "Orange", "Peach", "Pear", "Plum", "Berry",
        "Rose", "Lily", "Daisy", "Tulip", "Orchid", "Lotus", "Iris", "Jasmine", "Poppy", "Violet",
        "Guitar", "Piano", "Drum", "Flute", "Harp", "Violin", "Trumpet", "Sax", "Bell", "Horn",
        "Knight", "King", "Queen", "Prince", "Duke", "Baron", "Lord", "Lady", "Sage", "Wizard",
        "Storm", "Thunder", "Lightning", "Breeze", "Frost", "Mist", "Dew", "Haze", "Fog", "Gale"
    ]

    func generatePassword() -> String {
        guard let color = colors.randomElement(),
              let word = words.randomElement() else {
            return "defaultPassword"
        }

        return "\(color)\(word)"
    }

    func generateMultiplePasswords(count: Int) -> [String] {
        return (0..<count).map { _ in generatePassword() }
    }
}
