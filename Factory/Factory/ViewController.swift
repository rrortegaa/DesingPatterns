//
//  ViewController.swift
//  Factory
//
//  Created by Rose on 06/10/23.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    ejecutarEjemplo()
  }

  func ejecutarEjemplo() {
    let mensajero = PedroMensajero()
    let mensajero2 = JaimitoMensajero()
    mensajero.transporte = Motocicleta()
    mensajero.realizarEntrega()
    mensajero2.realizarEntrega()
  }

}

/* Abstracción/Interfaz de Mensajero */
protocol Mensajero {
  //var transporte: Bicicleta { get set }
  var transporte: Transporte { get set }
  func realizarEntrega()
}

/* Implementación concreta del mensajero */
class PedroMensajero: Mensajero {
  //var transporte: Bicicleta = Bicicleta()
  var transporte: Transporte = Bicicleta()
  
  func realizarEntrega() {
    print("Iniciando recorrido...")
    transporte.recorrerRuta()
    print("Paquete entregado.")
  }
}

class JaimitoMensajero: Mensajero {
  var transporte: Transporte = Motocicleta()
  
  func realizarEntrega() {
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
