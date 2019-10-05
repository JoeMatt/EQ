//
//  File.swift
//  
//
//  Created by Joseph Mattiello on 10/4/19.
//

import Foundation

public protocol StaticAutoBindable: Bindable {
    associatedtype StaticAutoBindableType
    static var BindableKeyPath : ReferenceWritableKeyPath<Self, StaticAutoBindableType> { get }
}

public extension StaticAutoBindable {
    func observingValue() -> StaticAutoBindableType {
        return self[keyPath: Self.BindableKeyPath]
    }
    
    func updateValue(with value: StaticAutoBindableType) {
        self.updateValue(Self.BindableKeyPath, with: value)
    }
}

/// OR


public protocol AutoBindable: Bindable {
    
    associatedtype BindableType

    typealias Root = Self
    typealias Input = BindableType
    typealias BindableKeyPath<T> = ReferenceWritableKeyPath<Self, T>

    var autoKeyPath: BindableKeyPath<BindableType> { get }
}

//public extension AutoBindable where Self: StaticAutoBindable {
//    typealias BindableType = StaticAutoBindable
//    var autoKeyPath: BindableKeyPath<BindableType> {
//        return type(of: self).BindableKeyPath
//    }
//}

public extension AutoBindable {
    func observingValue() -> BindableType {
        return self[keyPath: autoKeyPath]
    }
    
    func updateValue(with value: BindableType) {
        self.updateValue(autoKeyPath, with: value)
    }
}

//#if canImport(UIKit)
//import UIKit
//
//extension UITextField: AutoBindable2 {
//    public var autoKeyPath: BindableKeyPath {
//        return \.text
//    }
//}
//
//#endif
