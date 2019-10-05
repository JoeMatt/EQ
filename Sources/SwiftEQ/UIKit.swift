//
//  File.swift
//  
//
//  Created by Joseph Mattiello on 10/4/19.
//

#if canImport(UIKit)
import UIKit

extension AutoBindable where Self: UITextField {
    public var autoKeyPath: BindableKeyPath<String?> {
            return \.text
        }
}

//extension AutoBindable : ValueBindable {
//    public static let BindableKeyPath = #keyPath(UITextField.text)
//}

#endif
