//
//  main.swift
//  DZ_5_Evtyukhin_Roman
//
//  Created by Роман on 11.09.2020.
//  Copyright © 2020 Nebo. All rights reserved.
//

import Foundation

enum Brand {
    case ferrari, lamborghini
    case porsche, rangeRover
}
enum BodyColor {
    case red, black, yeloow, orange, blue, white
}
enum Engine {
    case on, off
}
enum Transmission {
    case on, off, neutral
}
enum Brake {
    case on, off
}
enum Nitrous {
    case on, off
}
enum Farkop {
    case set, absent
}
enum CommandMotul {
    case motul
}
enum CommandLukoil {
    case lukoil
}

protocol Car: Comparable {
    
    var brand: Brand { get }
    var bodyColor: BodyColor { get }
    var engine: Engine { get }
    var transmission: Transmission { get }
    var brake: Brake { get }
    var lapRace: Int { get }
}

extension Car {
    
    func engineStartStop() {
        switch engine {
        case .on:
            print("Двигатель в \(brand) - \(engine)!")
        default:
            print("Двигатель в \(brand) - \(engine)!")
        }
    }
    func transmissionStartStop() {
        switch transmission {
        case .on:
            print("КПП \(brand) в режиме - \(transmission)!")
        case .neutral:
            print("КПП \(brand) в режиме - \(transmission)!")
        default:
            print("КПП \(brand) в режиме - \(transmission)!")
        }
    }
    func brakeStartStop() {
        switch brake {
        case .on:
            print("Педаль тормоза в \(brand) - \(brake)!")
        default:
            print("Педаль тормоза в \(brand) - \(brake)!")
        }
    }
}


class CommandCar1: Car, CustomStringConvertible {
    
    var description: String {
        return ("\(сommandCar1.bodyColor) \(сommandCar1.brand)")
    }
    var commandCarMotul: CommandMotul
    var brand: Brand
    var bodyColor: BodyColor
    var engine: Engine
    var transmission: Transmission
    var brake: Brake
    var nitrous: Nitrous {
        willSet {
            print("Команда - \(CommandMotul.motul) подумывают над установкой закиси азота в \(brand)!")
        }
        didSet {
            switch nitrous {
            case .on:
                сommandCar1.lapRace -= 3
                print("В \(brand) установлена закись азота (мощность увеличина)")
            case .off:
                print("Команда - \(CommandMotul.motul) не установила закись азота в \(brand)!")
            }
        }
    }
    var lapRace: Int
    
    init(brand: Brand, bodyColor: BodyColor, engine: Engine, transmission: Transmission, brake: Brake, nitrous: Nitrous, lapRace: Int, commandCarMotul: CommandMotul) {
        self.brand = brand
        self.bodyColor = bodyColor
        self.engine = engine
        self.transmission = transmission
        self.brake = brake
        self.nitrous = nitrous
        self.lapRace = lapRace
        self.commandCarMotul = commandCarMotul
       
        switch brand {
        case .ferrari:
            self.lapRace = 5
        case .lamborghini:
        self.lapRace = 6
        case .porsche:
        self.lapRace = 11
        case .rangeRover:
        self.lapRace = 13
        }
        
    }
    func nitrousOnOff () {
        switch (nitrous, brand) {
        case (.on, .rangeRover):
            print("Закись азота в \(brand) - не допустим!")
        case (.off, .rangeRover):
            print("Закись азота в \(brand) - не допустим!")
        case (.on, .porsche):
            print("Закись азота в \(brand) - не допустим!")
        case (.off, .porsche):
            print("Закись азота в \(brand) - не допустим!")
        case (.on, brand):
            print("Закись азота в \(brand) - \(nitrous)!")
        default:
            print("Закись азота в \(brand) - \(nitrous)!")
        }
    }
}

var сommandCar1 = CommandCar1(brand: .rangeRover, bodyColor: .orange, engine: .on, transmission: .on, brake: .off, nitrous: .off, lapRace: 0, commandCarMotul: .motul)

extension CommandCar1: Comparable {
    
    static func < (lhs: CommandCar1, rhs: CommandCar1) -> Bool {
        return lhs.lapRace < rhs.lapRace
    }
    static func == (lhs: CommandCar1, rhs: CommandCar1) -> Bool {
        return lhs.lapRace == rhs.lapRace
    }
    static func > (lhs: CommandCar1, rhs: CommandCar1) -> Bool {
        return lhs.lapRace > rhs.lapRace
    }
}

class CommandCar2: Car, CustomStringConvertible {
    
    var description: String {
        return ("\(bodyColor) \(brand)")
    }
    var brand: Brand
    var bodyColor: BodyColor
    var engine: Engine
    var transmission: Transmission
    var brake: Brake
    var farkop: Farkop
    var lapRace: Int
    
    init(brand: Brand, bodyColor: BodyColor, engine: Engine, transmission: Transmission, brake: Brake, farkop: Farkop, lapRace: Int) {
        self.brand = brand
        self.bodyColor = bodyColor
        self.engine = engine
        self.transmission = transmission
        self.brake = brake
        self.farkop = farkop
        self.lapRace = lapRace
        
        switch brand {
        case .ferrari:
            self.lapRace = 5
        case .lamborghini:
        self.lapRace = 6
        case .porsche:
        self.lapRace = 11
        case .rangeRover:
        self.lapRace = 13
        }
    }
    func farkopYesNo () {
        switch (farkop, brand) {
        case (.set, .rangeRover):
            print("Фаркоп в \(brand) - \(farkop)!")
        case (.absent, .rangeRover):
            print("Фаркоп в \(brand) - \(farkop)!")
        case (.set, .porsche):
            print("Фаркоп в \(brand) - \(farkop)!")
        case (.absent, .porsche):
            print("Фаркоп в \(brand) - \(farkop)!")
        default:
            print("Фаркоп в \(brand) - не допустим!")
        }
    }
}

var commandCar2 = CommandCar2(brand: .porsche, bodyColor: .black, engine: .on, transmission: .on, brake: .off, farkop: .set, lapRace: 0)

extension CommandCar2: Comparable {
    
    static func < (lhs: CommandCar2, rhs: CommandCar2) -> Bool {
        return lhs.lapRace < rhs.lapRace
    }
    static func == (lhs: CommandCar2, rhs: CommandCar2) -> Bool {
        return lhs.lapRace == rhs.lapRace
    }
    static func > (lhs: CommandCar2, rhs: CommandCar2) -> Bool {
        return lhs.lapRace > rhs.lapRace
    }
}

func rase () {
    if commandCar2.lapRace < сommandCar1.lapRace {
        print("Выиграл - \(commandCar2.brand) прошедший круг за - \(commandCar2.lapRace) минут")
        print("Проиграл - \(сommandCar1.brand) прошедший круг за - \(сommandCar1.lapRace) минут")
        
    } else if сommandCar1.lapRace == commandCar2.lapRace {
        print("Ничья между - \(сommandCar1.brand) и \(commandCar2.brand) прошедшие круг оба за - \(commandCar2.lapRace) минут")
        
    } else if commandCar2.lapRace > сommandCar1.lapRace {
        print("Выиграл - \(сommandCar1.brand) прошедший круг за - \(сommandCar1.lapRace) минут")
        print("Проиграл - \(commandCar2.brand) прошедший круг за - \(commandCar2.lapRace) минут")
    }
}

print("-------------------")
print(сommandCar1)
сommandCar1.engineStartStop()
сommandCar1.transmissionStartStop()
сommandCar1.brakeStartStop()
сommandCar1.nitrousOnOff()
print("-------------------")
print(commandCar2)
commandCar2.engineStartStop()
commandCar2.transmissionStartStop()
commandCar2.brakeStartStop()
commandCar2.farkopYesNo()
print("-------------------")
print("Гонка между \(сommandCar1.brand) и \(commandCar2.brand)!")
сommandCar1.nitrous = .on
rase()
print("-------------------")


