//
//  ViewController.swift
//  InjectionWithResolver
//
//  Created by Rose on 09/10/23.
//

import UIKit
import Resolver

extension Resolver {
  static func registrarDependencias() {
    register { Bicicleta() as Transporte }
    //register { Motocicleta() as Transporte } // Esta es la que va a ser utilizada pq para Resolver es la última de ese tipo registrada
  }
}

class ViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    //Resolver.registrarDependencias() // Al dejar de registrar las dependencias con esta línea, se caé en "No hay transporte" 🔥
    ejecutarEjemplo()
  }

  func ejecutarEjemplo() {
    let mensajero = PedroMensajero()
    mensajero.realizarEntrega()
    //let mensajero2 = JaimitoMensajero(transporte: Resolver.resolve())
    //mensajero2.realizarEntrega()
  }
}

/* Abstracción/Interfaz de Mensajero */
protocol Mensajero {
  var transporte: Transporte? { get set }
  func realizarEntrega()
}

/* Implementación concreta del mensajero */
class PedroMensajero: Mensajero {
  //@Injected var transporte: Transporte
  //@OptionalInjected var transporte: Transporte?
  var transporte: Transporte? = Resolver.optional()
  
  func realizarEntrega() {
    guard let transporte = transporte else {
      print("No hay transporte")
      return
    }
    print("Iniciando recorrido...")
    transporte.recorrerRuta()
    print("Paquete entregado.")
  }
}

/*class JaimitoMensajero: Mensajero {
  //@Injected var transporte: Transporte
  var transporte: Transporte = Resolver.resolve()
  
  init(transporte: Transporte) {
    self.transporte = transporte
  }
  
  func realizarEntrega() {
    print("Iniciando recorrido...")
    transporte.recorrerRuta()
    print("Paquete entregado.")
  }
}*/

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
