//protocol ObservableValue {
//    associatedtype T
//
//    typealias DidUpdateClosure = (T) -> Self
//
//    var didUpdate : DidUpdateClosure { get }
//}
//
//protocol ObservableVariable: ObservableValue {
//    associatedtype T
//
//    typealias SetClosure = (T?) -> Self
//
//    var setValue : SetClosure { get }
//}
//
//struct ObservableLet<O>: ObservableValue {
//    typealias T = O
//
//    private(set) var value: O
//
//}

// Also see: https://www.raywenderlich.com/34-design-patterns-by-tutorials-mvvm

/// https://codeburst.io/swift-mvvm-two-way-binding-win-b447edc55ff5

public class Observable<ObservedType> {
    public typealias Observer = (_ observable: Observable<ObservedType>, ObservedType) -> Void
    
    private var observers: [Observer]
    
    public var value: ObservedType {
        didSet {
            notifyObservers(value)
        }
    }
    
    public init(_ value: ObservedType) {
        self.value = value
        observers = []
    }
    
    public func bind(observer: @escaping Observer) {
        self.observers.append(observer)
    }
    
    private func notifyObservers(_ value: ObservedType) {
        self.observers.forEach { [unowned self](observer) in
            observer(self, value)
        }
    }
}

public extension Observable where ObservedType: ExpressibleByNilLiteral {
    convenience init() {
        self.init(nil)
    }
}

public extension Observable {
    // Testing filters
    func map<MappedTyped>(_ f: (_ observable: ObservedType) -> MappedTyped) -> Observable<MappedTyped> {
        let mapped = f(value)
        return Observable<MappedTyped>(mapped)
    }
}

// TODO: Add Sequence mapping
//extension Observable where ObservedType: Sequence {
//    func compactMap<MappedTyped>(_ f: (_ observable: ObservedType) -> MappedTyped) -> Observable<[MappedTyped]> {
//        return ...
//    }
//}
