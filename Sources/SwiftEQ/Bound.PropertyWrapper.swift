//
//  File.swift
//  
//
//  Created by Joseph Mattiello on 10/4/19.
//

import Foundation

#if compiler(>=5.1)

@propertyWrapper
public struct Bound<ValueType> {
    
//    private let initialValue: ValueType
    private var innerValue: ValueType
    
    // TODO: A lazy `propertyWrapper` for has been created?
    typealias ValueClosure = () -> Observable<ValueType>
//    private var creator: ValueClosure?
    private var innerObservable: Observable<ValueType>?
    
    mutating
    public func asObservable() -> Observable<ValueType> {
        if let innerObservable = innerObservable {
            return innerObservable
        } else {
            let obs = Observable(innerValue)
            innerObservable = obs
            return obs
        }
    }
    
    public var wrappedValue: ValueType {
        get {
            return innerObservable?.value ?? innerValue
        }
        set {
            innerValue = newValue
            innerObservable?.value = newValue
        }
    }
//    public var wrappedValue: ValueType {
//        get {
//
//        }
//    }

    public init(wrappedValue initialValue: ValueType) {
        innerValue = initialValue
    }
}

//extension Bound: Bindable {
//    public func observingValue<T>(_ keyPath: WritableKeyPath<Self,T>) -> T? {
//        return self[keyPath: keyPath]
//    }
//    
//    public func updateValue<T>(_ keyPath: ReferenceWritableKeyPath<Self,T>, with value: T) {
//        self[keyPath: keyPath] = value
//    }
//    
//    public func bind<T>(_: WritableKeyPath<Bound<ValueType>, T>, with observable: Observable<T>) {
//        
//    }
//}
#endif
