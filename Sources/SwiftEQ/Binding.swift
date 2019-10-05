//
//  File.swift
//  
//
//  Created by Joseph Mattiello on 10/4/19.
//

import Foundation

public protocol Bindable {
    func observingValue<T>(_ : WritableKeyPath<Self,T>) -> T?
    func updateValue<T>(_ :ReferenceWritableKeyPath<Self,T>, with value: T)
    func bind<T>(_ :WritableKeyPath<Self,T>, with observable: Observable<T>)
}

// TODO, Property wrapper out of Bindable,  called observable?
public extension Bindable {
    func observingValue<T>(_ keyPath: WritableKeyPath<Self,T>) -> T? {
        return self[keyPath: keyPath]
    }
    
    func updateValue<T>(_ keyPath: ReferenceWritableKeyPath<Self,T>, with value: T) {
        self[keyPath: keyPath] = value
    }
}

fileprivate struct AssociatedKeys {
    static var binder: UInt8 = 0
}

struct Binder<BindingType> {
    
}
