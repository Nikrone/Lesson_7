//
//  ViewController.swift
//  Lesson_7
//
//  Created by Evgeniy Nosko on 9.08.21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        доступ к enum массиву строк
        let allCasesArray = StringsArray.allCases
        
        let childGeneration = Generations.child(age: 10)
        childGeneration.printAge()
        
        
        
        
        let beer = AlcoholDrinks.beer
        print(beer.gradus())
        
        let whine = AlcoholDrinks.wine
        print(whine.gradus())
        
        let wiskey = AlcoholDrinks.wiskey
        print(wiskey.gradus())
        
        
        
        let mazda = CarMarka.mazda
        print(mazda.model())
        
        let bmw = CarMarka.bmw
        print(bmw.model())
        
        let honda = CarMarka.honda
        print(honda.model())
        
        
        
        
        
//        через rawValue
        

        
        
        
    }

}


//    S O L I D
//  1) S -  Single Responsibility (принцип единственной ответственности)
//  2) O -  Open-Closed (класс должен быть открыт для расширения и закрыт для модификации)
//  3) L -  Liskov substitution (использование классов наследников вместо базовых классов)
//  4) I -  Interface Segregation (принцип разделения интерфейса)
//  5) D -  Dependancy Inversion (принцип инверсии зависимостей)
//  5.1- Модули верхних уровней не должны зависеть от модулей нижних уровней. Оба типа модулей должны зависеть от абстракций.
//  5.2- Абстракции не должны зависеть от деталей. Детали должны зависеть от абстракций.

    

//   МОДИФИКАТОРЫ ДОСТУПА - (реализация принципов ООП)
//  1) private - (нельзя обратиться из класса наследника)
//  2) internal -  (модификатор который выставляется по умолчанию)
//  3) public -  (доступ к функциям из другого проекта)
//  4) open -  (Работа с фреймворками) (open - можем переопределить из другого проекта, public - имеем только доступ из другого проекта)
//  5) file private -  (можем обратиться из класса наследника, нельзя обратиться из другого файла)



class BeerBar {
    init() {
        let alcoholDrink = AlcoholDrink()
        
    }
}

class AlcoholDrink {
   private let privateName: String = ""
    
    private func privateNameFunc() {
    }
    func ade() {
        
    }
}

class Beer: AlcoholDrink {
    func abc() {

    }
}

class Vodka: AlcoholDrink {
    
}



//  СТРУКТУРИРОВАНИЕ КОНТРОЛЛЕРОВ(Controller)

//MARK: - ...  (разделение кода)

// - IBOutlet

// - private let
// - let

// - private var
// - var

// - Lifecycle functions

// - Flow functions :
// - func
// - private func

// - IBActions

// - Extension




// EXTENSION
//(расширение класса, продолжение класса) может находится в другом файле, может быть (private)
// Возможности EXTENSION:
// 1) можем добавить функцию
// 2) добавление ТОЛЬКО COMPUTED VARIABLE (вычисляемые переменные)
// 3) создание класса, структур и enum(перечисления)
extension ViewController {
    var computedVariable: Int {
        return 5
    }
    
    func addAnotherValue() {
//        обращение к enum
        var state: SwitcherState = SwitcherState.center
//         изменение значения
        state = .right
//        обращение к функции (в функции)
        state.makeAction()
        
    }
}




// ENUM (Перечисления)

enum SwitcherState {
    case left
    case right
    case center
    
//    computed var
    var computedVar: Int {
        switch self {
        case .center:
            return 1
        case .left:
            return 2
        case .right:
            return 3
        }
    }
    
//    создание функции в enum
    func makeAction() {
        switch self {
        case .center:
            print("")
        case .left:
        print("")
        case .right:
            print("")
        }
    }
}



enum Number:Int {
    case zero, one, two, three
    case twelve = 12
    // rawValue - значения которые хранятся в enum
}


enum Strings: String {
    case zero, one, two, three
// case "zero", "one", "two", "three"
    case twelve = "12"
}

//CaseIterable - массив
enum StringsArray: String, CaseIterable {
    case zero, one, two, three
    case twelve = "12"
}


//Отличие Swift Enum от Objective-C Enum, то что Свифтовые могут хранить значения а Objective-C нет!!!
enum Generations {
    case child(age: Int)
    case young(age: Int)
    case adult(age: Int)
    case old(age: Int)
    
    
//    доступ к переменной через Switch
    func printAge() {
        switch self {
        case .child(let age):
        print(age)
        case .young(age: let age):
            print(age)
        case .adult(age: let age):
            print(age)
        case .old(age: let age):
            print(age)
        }
    }
}



enum AlcoholDrinks: String {
    case beer = "Beer"
    case wine = "Wine"
    case wiskey = "Whiskey"
    
    func gradus() -> Double {
        switch self {
        case .beer:
            return 6
        case .wine:
            return 12
        case .wiskey:
            return 40
        }
    }
}



enum CarMarka: String {
    case mazda = "Mazda"
    case bmw = "BMW"
    case honda = "Honda"
    
    func model() -> Int {
        switch self {
        case .mazda:
            return 6
        case .bmw:
            return 3
        case .honda:
        return 5
        }
    }
}
