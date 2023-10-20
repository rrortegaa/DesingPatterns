//
//  TestFile.swift
//  Singleton
//
//  Created by Rose on 06/10/23.
//

import Foundation

/* Primer ejercicio con patrón Singleton */
/*
class Tester {
  init()  {}
  static func useSingleton() {
    let mySingleton = MyFirstSingleton.shared
    mySingleton.info = "Cambio el mensaje"
    print(mySingleton.info)
  }
}
 */


/* Segundo ejercicio con patrón Singleton */
class Tester {
    static func useSingleton() {
        let userManager = UserManager.shared
        userManager.addUser(username: "Usuario5")
        let connectedUsers = userManager.getConnectedUsers()
        print("Usuarios Conectados:")
        for user in connectedUsers {
            print("- \(user)")
        }
    }
}
