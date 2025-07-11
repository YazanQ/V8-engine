//
//  UIControl.swift
//  
//
//  Created by Yazan Qaisi on 30/07/2024.
//

import UIKit

public extension UIControl {
    func addAction(
        for controlEvents: UIControl.Event = .touchUpInside,
        _ closure: @escaping()->()
    ) {
        @objc 
        class ClosureSleeve: NSObject {
            let closure:()->()
            init(_ closure: @escaping()->()) { self.closure = closure }
            @objc func invoke() { closure() }
        }

        let sleeve = ClosureSleeve(closure)
        addTarget(sleeve, action: #selector(ClosureSleeve.invoke), for: controlEvents)
        objc_setAssociatedObject(self, "\(UUID())", sleeve, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
}
