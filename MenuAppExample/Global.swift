//
//  Global.swift
//  MenuAppExample
//
//  Created by Ignacio on 05/05/2019.
//  Copyright © 2019 Ignacio. All rights reserved.
//

// Las variables globales que defino aquí se calculan en el momento en que se ejecuta el programa, es decir si una vez que se está ejecutando el mismo cambio el modo del sistema, no se modifica la variable, cosa que si sucede en el caso de que se defina de manera local como se ha hecho en TestViewController
import Foundation

class globalVariables {
    public var osxMode = UserDefaults.standard.string(forKey: "AppleInterfaceStyle") ?? "Light"
    public var varTest = 2
    
    class var sharedManager: globalVariables {
        struct Static {
            static let instance = globalVariables()
        }
        return Static.instance
    }
}
