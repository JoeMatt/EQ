//
//  File.swift
//  
//
//  Created by Joseph Mattiello on 10/4/19.
//

import Foundation

// Auto-KVO?
#if false
extension Bindable where Self: NSObject {
    
    public func bind(with observable: Observable<BindingType>) {
        if let _self = self as? UIControl {
            _self.addTarget(Selector, action: Selector{ self.valueChanged() }, for: [.editingChanged, .valueChanged])
        }
        self.binder = observable
        self.observe(for: observable) { (value) in
            self.updateValue(with: value)
        }
        
    }

    private var binder: Observable<BindingType> {
        get {
            guard let value = objc_getAssociatedObject(self, &AssociatedKeys.binder) as? Observable<BindingType> else {
                let newValue = Observable<BindingType>()
                objc_setAssociatedObject(self, &AssociatedKeys.binder, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                return newValue
            }
            return value
        }
        set(newValue) {
             objc_setAssociatedObject(self, &AssociatedKeys.binder, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    private func getBinderValue() -> BindingType? {
        return binder.value
    }
    
    private func setBinderValue(with value: BindingType?) {
        binder.value = value
    }
    
    private func register(for observable: Observable<BindingType>) {
        binder = observable
    }
    
    private func valueChanged() {
        if binder.value != self.observingValue() {
            setBinderValue(with: self.observingValue())
        }
    }
}
#endif
