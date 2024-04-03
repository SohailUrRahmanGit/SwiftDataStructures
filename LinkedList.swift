//
//  LinkedList.swift
//  LinkedList
//
//  Created by Sohail Ur Rahman Shaik on 03/04/24.
//

import Foundation

public class Node<T> {
    var val: T
    var next: Node?
    
    public init(val: T, next: Node? = nil) {
        self.val = val
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    public var description: String {
        guard let next = next else {
            return "\(String(describing: val))"
        }
        return "\(val) -> \(String(describing: next.val))"
    }
    
}
