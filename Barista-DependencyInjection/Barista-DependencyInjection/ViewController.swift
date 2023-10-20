//
//  ViewController.swift
//  Barista-DependencyInjection
//
//  Created by Rose on 10/10/23.
//

import UIKit

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    exec()
  }
  
  func exec() {
    // Inyección por constructor
    let barista = Barista(extractionMethod: Espresso())
    barista.prepareCoffee()
    // Inyección por propiedad
    barista.extractionMethod = FilterCoffeeMachine()
    barista.prepareCoffee()
    
    let headBarista = HeadBarista()
    headBarista.prepareCoffee()
    
    let baristaAssistant = BaristaAssistant()
    baristaAssistant.prepareCoffee(extractionMethod: ColdBrewCoffee())
  }
}
  
  protocol ExtractionMethod {
    var tiempoDeElaboracion: UInt32 { get }
    func brewCoffee()
  }
  
  // Las máquinas de café son implementaciones del método de extracción.
  class Espresso: ExtractionMethod {
    let tiempoDeElaboracion: UInt32 = 10
    func brewCoffee() {
      // Prepara un espresso
      print("Preparando un café espresso...")
      sleep(tiempoDeElaboracion)
      print("Espresso listo.")
    }
  }
  
  class FilterCoffeeMachine: ExtractionMethod {
    let tiempoDeElaboracion: UInt32 = 5
    func brewCoffee() {
      // Prepara un café de filtro
      print("Preparando un café americano...")
      sleep(tiempoDeElaboracion)
      print("Americano listo.")
    }
  }
  
  class V60CoffeeMachine: ExtractionMethod {
    let tiempoDeElaboracion: UInt32 = 15
    func brewCoffee() {
      // Prepara un café goteo
      print("Preparando un café V60...")
      sleep(tiempoDeElaboracion)
      print("V60 listo.")
    }
  }
  
  class ColdBrewCoffee: ExtractionMethod {
    let tiempoDeElaboracion: UInt32 = 7
    func brewCoffee() {
      // Prepara un café frío
      print("Preparando un cold brew...")
      sleep(tiempoDeElaboracion)
      print("Cold brew listo.")
    }
  }
  
// Los baristas son objetos que preparan café
class HeadBarista {
  var extractionMethod: ExtractionMethod = V60CoffeeMachine()
  
  func prepareCoffee() {
    print("Alistando máquina...")
    extractionMethod.brewCoffee()
  }
}

class Barista {
  var extractionMethod: ExtractionMethod
  
  init(extractionMethod: ExtractionMethod) {
    self.extractionMethod = extractionMethod
  }
  
  func prepareCoffee() {
    print("Alistando máquina...")
    extractionMethod.brewCoffee()
  }
}

class BaristaAssistant {

  func prepareCoffee(extractionMethod: ExtractionMethod) {
    print("Alistando máquina...")
    extractionMethod.brewCoffee()
  }
}

// TODO: Terminar esta última implementación con el framework Resolver
class SecondBaristaAssistant {
  var extractionMethod: ExtractionMethod
  
  init(extractionMethod: ExtractionMethod) {
    self.extractionMethod = extractionMethod
  }
  
  func prepareCoffee() {
    print("Alistando máquina...")
    extractionMethod.brewCoffee()
  }
}
