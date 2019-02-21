import UIKit

//Deinitialization

//Deinitializers are only available on CLASS types
class Bank {
    static var coinsInBank = 10_000
    static func distribute(coins numberOfCoinsRequested: Int) -> Int {
        let numberOfCointsToVend = min(numberOfCoinsRequested , coinsInBank)
        coinsInBank -= numberOfCointsToVend
        return numberOfCointsToVend
    }
    static func receive(coins : Int ) {
        coinsInBank += coins
    }
}

class Player {
    var coinsInPurse : Int
    init(coins: Int) {
        coinsInPurse = Bank.distribute(coins: coins)
    }
    func win(coins: Int) {
        coinsInPurse += Bank.distribute(coins: coins)
    }
    deinit {
        Bank.receive(coins: coinsInPurse)
    }
}

var playerOne: Player? = Player(coins: 100)
print("A new player has joined the game with \(playerOne!.coinsInPurse) coins ")
//Prints "A new player has joined the game with 100 coins"
print("There are now \(Bank.coinsInBank) coins left in the bank")
//Prints "There are now 9900 coins left in the bank"

playerOne = nil
print("PlayerOne has left the game")
//Prints "PlayorOne has left the game"
print("The bank now has \(Bank.coinsInBank) coins")
//Prints "The bank now has 10000 coins."
