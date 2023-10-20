//
//  ViewController.swift
//  BuilderPattern
//
//  Created by Rose on 05/10/23.
//

/*
 Implementar el patrón de diseño Builder con la analogía de productos de supermercado
 Comidas, bebidas y electrónicos
*/

import UIKit

class ViewController: UIViewController {
  
  let foodBuilder = FoodProductBuilder()
  let electronicBuilder = ElectronicProductBuilder()
  let drinkBuilder = DrinkProductBuilder()
  
  override  func viewDidLoad() {
    super.viewDidLoad()
    let director = Director(foodBuilder: foodBuilder, electronicBuilder: electronicBuilder, drinkBuilder: drinkBuilder)
    director.getFoodProductA()
    director.getElectronicProduct()
    director.getDrinkProduct()
  }
}

class Director {
  let foodBuilder: FoodProductBuilder
  let electronicBuilder: ElectronicProductBuilder
  let drinkBuilder: DrinkProductBuilder
  
  init(foodBuilder: FoodProductBuilder, electronicBuilder: ElectronicProductBuilder, drinkBuilder: DrinkProductBuilder) {
    self.foodBuilder = foodBuilder
    self.electronicBuilder = electronicBuilder
    self.drinkBuilder = drinkBuilder
  }
  
  func getFoodProductA() {
    /* Usando el inicializador de producto*/
    /*
    let foodWithoutPattern = Product(
      category: .Food,
      name: "Arroz",
      content: 900,
      unitOfMeasure: "gramos",
      price: 30,
      expirationDate: "2024-12-31") // Usarlo así es posible pq -> expirationDate: String? = nil está declarado en el init de Product
     */
    
    /* Usando el patrón Builder*/
    let foodProduct = foodBuilder
      .setName("Arroz")
      .setContent(900)
      .setUnitOfMeasure("gramos")
      .setPrice(30)
      .setExpirationDate("2024-12-31")
      .build()
    
    print(foodProduct.description())
  }
  
  func getElectronicProduct() {
    let electronicProduct = electronicBuilder
      .setName("Audífonos")
      .setContent(1)
      .setUnitOfMeasure("pieza")
      .setPrice(1200)
      .build()
    
    print(electronicProduct.description())
  }
  
  func getDrinkProduct() {
    let drinkProduct = drinkBuilder
      .setName("Mezcal de pechuga")
      .setContent(750)
      .setUnitOfMeasure("mililitros")
      .setPrice(900)
      .setExpirationDate("2028-12-31")
      .build()
    
    print(drinkProduct.description())
  }
}

enum Category: String {
  case Food
  case Drink
  case Electronic
}

class Product {
  var category: Category
  var name: String
  var content: Double
  var unitOfMeasure: String
  var price: Double
  var expirationDate: String?
  
  init(category: Category, name: String, content: Double, unitOfMeasure: String, price: Double, expirationDate: String? = nil) {
    self.category = category
    self.name = name
    self.content = content
    self.unitOfMeasure = unitOfMeasure
    self.price = price
  }
  
  func description() -> String {
    var description = "\(category.rawValue)\n\(name) - \(content) \(unitOfMeasure) - $\(price)"
    
    if let expirationDate = expirationDate {
      description += "\nExpires: \(expirationDate)"
    }
    return description
  }
}

/* Protocolo Builder */
protocol ProductBuilder {
  func setName(_ name: String) -> Self
  func setContent(_ content: Double) -> Self
  func setUnitOfMeasure(_ unitOfMeasure: String) -> Self
  func setPrice(_ price: Double) -> Self
  
  func build() -> Product
}

/* Implementación del Builder para productos de comida */
class FoodProductBuilder: ProductBuilder {
  private var product = Product(category: .Food, name: "", content: 0, unitOfMeasure: "", price: 0)
  
  func setName(_ name: String) -> Self {
    product.name = name
    return self
  }
  
  func setContent(_ content: Double) -> Self {
    product.content = content
    return self
  }
  
  func setUnitOfMeasure(_ unitOfMeasure: String) -> Self {
    product.unitOfMeasure = unitOfMeasure
    return self
  }
  
  func setPrice(_ price: Double) -> Self {
    product.price = price
    return self
  }
  /* Función extra que no hicimos parte del protocolo pq la fecha de expiración es opcional */
  func setExpirationDate(_ expirationDate: String) -> Self {
    product.expirationDate = expirationDate
    return self
  }
  
  func build() -> Product {
    return product
  }
}

/* Implementación del Builder para productos electrónicos */
class ElectronicProductBuilder: ProductBuilder {
  private var eProduct = Product(category: .Electronic, name: "", content: 0, unitOfMeasure: "", price: 0)
  
  func setName(_ name: String) -> Self {
    eProduct.name = name
    return self
  }
  
  func setContent(_ content: Double) -> Self {
    eProduct.content = content
    return self
  }
  
  func setUnitOfMeasure(_ unitOfMeasure: String) -> Self {
    eProduct.unitOfMeasure = unitOfMeasure
    return self
  }
  
  func setPrice(_ price: Double) -> Self {
    eProduct.price = price
    return self
  }
  
  func build() -> Product {
    return eProduct
  }
}

/* Implementación del Builder para bebidas */
class DrinkProductBuilder: ProductBuilder {
  private var drinkProduct = Product(category: .Drink, name: "", content: 0, unitOfMeasure: "", price: 0)
  
  func setName(_ name: String) -> Self {
    drinkProduct.name = name
    return self
  }
  
  func setContent(_ content: Double) -> Self {
    drinkProduct.content = content
    return self
  }
  
  func setUnitOfMeasure(_ unitOfMeasure: String) -> Self {
    drinkProduct.unitOfMeasure = unitOfMeasure
    return self
  }
  
  func setPrice(_ price: Double) -> Self {
    drinkProduct.price = price
    return self
  }
  
  func setExpirationDate(_ expirationDate: String) -> Self {
    drinkProduct.expirationDate = expirationDate
    return self
  }
  
  func build() -> Product {
    return drinkProduct
  }
}
