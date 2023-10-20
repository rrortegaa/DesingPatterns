//
//  ViewController.swift
//  Decorator
//
//  Created by Rose on 10/10/23.
//

import UIKit

class ViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    // Uso en la cafetería
    let simpleCoffee: Beverage = Coffee()
    print("Bebida: \(simpleCoffee.description), Costo: $\(simpleCoffee.cost())")
    
    let coffeeWithMilk: Beverage = Milk(Coffee())
    print("Bebida: \(coffeeWithMilk.description), Costo: $\(coffeeWithMilk.cost())")

    let sweetCoffee: Beverage = Sugar(Coffee())
    print("Bebida: \(sweetCoffee.description), Costo: $\(sweetCoffee.cost())")

    let coffeeWithMilkAndSugar: Beverage = Sugar(Milk(Coffee()))
    print("Bebida: \(coffeeWithMilkAndSugar.description), Costo: $\(coffeeWithMilkAndSugar.cost())")
    
    let coffeeWithSugarAndMilk: Beverage = Milk(Sugar(Coffee()))
    print("Bebida: \(coffeeWithSugarAndMilk.description), Costo: $\(coffeeWithSugarAndMilk.cost())")
  }
}

// Componente base: Bebida
protocol Beverage {
  var description: String { get }
  func cost() -> Double
}

// Implementación del Componente base: Bebida concreta
struct Coffee: Beverage {
  var description: String { return "Café" }
  func cost() -> Double { return 17.0 }
}

// Decorador abstracto: Decorator
class ComplementsDecorator: Beverage {
  private let wrappedBeverage: Beverage
    
  init(_ beverage: Beverage) {
        wrappedBeverage = beverage
  }
    
  var description: String {
    return wrappedBeverage.description
  }
    
  func cost() -> Double {
    return wrappedBeverage.cost()
  }
}

// Decoradores concretos
class Milk: ComplementsDecorator {
  override var description: String {
    return super.description + ", Leche"
  }
    
  override func cost() -> Double {
    return super.cost() + 10
  }
}

class Sugar: ComplementsDecorator {
  override var description: String {
    return super.description + ", Azúcar"
  }
    
  override func cost() -> Double {
    return super.cost() + 1
  }
}
