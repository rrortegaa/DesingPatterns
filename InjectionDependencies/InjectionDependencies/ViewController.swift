//
//  ViewController.swift
//  InjectionDependencies
//
//  Created by Rose on 09/10/23.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    ejecutarEjemplo()
  }

  func ejecutarEjemplo() {
    //let mensajero = PedroMensajero(transporte: Bicicleta()) // Inyección por Constructor
    let mensajero = PedroMensajero()
    let mensajero2 = JaimitoMensajero()
    //mensajero.transporte = Motocicleta() // Inyección por propiedad o atributo
    //mensajero.realizarEntrega()
    //mensajero2.realizarEntrega()
    //mensajero.realizarEntrega() // Inyección por propiedad o atributo
    mensajero.realizarEntrega(transporte: Bicicleta())
    mensajero2.realizarEntrega(transporte: Motocicleta())
  }

}

/* Abstracción/Interfaz de Mensajero */
protocol Mensajero {
  //var transporte: Bicicleta { get set }
  //var transporte: Transporte? { get set }
  //func realizarEntrega()
  func realizarEntrega(transporte: Transporte)
}

/* Implementación concreta del mensajero */
class PedroMensajero: Mensajero {
  //var transporte: Bicicleta = Bicicleta()
  //var transporte: Transporte = Bicicleta()
  //var transporte: Transporte?
  
  /*init(transporte: Transporte) { // Inyección por Constructor
    self.transporte = transporte
  }*/
  
  /*func realizarEntrega() {
    guard let transporte = transporte else {
      print("Viajando a pie...")
      sleep(10)
      print("Viaje en caminando concluido.")
      return
    }
    print("Iniciando recorrido...")
    transporte.recorrerRuta()
    print("Paquete entregado.")
  }*/
  
  /* Method Injection */
  func realizarEntrega(transporte: Transporte) {
    print("Iniciando recorrido...")
    transporte.recorrerRuta()
    print("Paquete entregado.")
  }
}

class JaimitoMensajero: Mensajero {
  //var transporte: Transporte = Motocicleta()
  //var transporte: Transporte?
  
  func realizarEntrega(transporte: Transporte) {
    print("Iniciando recorrido...")
    transporte.recorrerRuta()
    print("Paquete entregado.")
  }
}

/* Abstracción/Interfaz de transporte */
protocol Transporte {
  var tiempoDeLlegada: UInt32 { get }
  func recorrerRuta()
}

/* Implementación concreta del transporte bicicleta */
class Bicicleta: Transporte {
  let tiempoDeLlegada: UInt32 = 5
  
  func recorrerRuta() {
    print("Viajando en bicicleta...")
    sleep(tiempoDeLlegada)
    print("Viaje en bicicleta concluido.")
  }
  
}

/* Implementación concreta del transporte motocicleta */
class Motocicleta: Transporte {
  let tiempoDeLlegada: UInt32 = 2
  
  func recorrerRuta() {
    print("Viajando en motocicleta...")
    sleep(tiempoDeLlegada)
    print("Viaje en motocicleta concluido.")
  }
}
