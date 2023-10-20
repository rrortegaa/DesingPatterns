//
//  ViewController.swift
//  Singleton
//
//  Created by Rose on 06/10/23.
//

import UIKit

/* Primer ejercicio con patrón Singleton */
/*
class ViewController: UIViewController {
  let firstSingleton = MyFirstSingleton.shared // Solo así puedo acceder a propiedades por medio del singleton, shared ejecuta el closure la primera vez que se ejecuta y las siguientes solo proporciona lo que ya guardó previamente

  override func viewDidLoad() {
    super.viewDidLoad()
    firstSingleton.info = "Hola mundo! Este es mi primer singleton"
    print(firstSingleton.info)
    Tester.useSingleton()
    print(firstSingleton.info) // Cuál frase se pondrá en consola? La última que se le asignó, en este ejemplo: Cambio el mensaje
    firstSingleton.info = "De nuevo el Hola mundo"
    print(firstSingleton.info)
  }
}

class MyFirstSingleton {
  /* Propiedad estática que permite acceder a la instancia única desde cualquier parte del código */
  /* Este es un closure de creación */
  static let shared: MyFirstSingleton = {
    let instance = MyFirstSingleton()
    return instance
  }()
  
  /* Otras propiedades */
  var info: String = ""
  
  /* Constructor privado para evitar la creación de instancias desde fuera de la clase */
  private init() {}
}
*/


/* Segundo ejercicio con patrón Singleton */
class ViewController: UIViewController {
    let userManager = UserManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        /* Acceder a sus propiedades y métodos */
        userManager.addUser(username: "Usuario1")
        userManager.addUser(username: "Usuario2")
        userManager.addUser(username: "Usuario3")
        let connectedUsers = userManager.getConnectedUsers()
        print("Usuarios Conectados:")
        for user in connectedUsers {
            print("- \(user)")
        }
        userManager.addUser(username: "Usuario4")
        Tester.useSingleton()
    }
}

class UserManager {
    static let shared: UserManager = {
        let instance = UserManager()
        return instance
    }()
    
    /* Lista de usuarios conectados */
    private var connectedUsers: [String] = []
    
    private init() {}
    
    /* Agregar un usuario a la lista de usuarios conectados */
    func addUser(username: String) {
        connectedUsers.append(username)
        print("\(username) se ha conectado.")
    }
    
    /* Obtener la lista de usuarios conectados */
    func getConnectedUsers() -> [String] {
        return connectedUsers
    }
}
