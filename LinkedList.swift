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
        return "\(val) -> " + String(describing: next) + " "
    }
    
}

public struct LinkedList<T> {
    public var head: Node<T>?
    public var tail: Node<T>?
    
    public init() {}
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    mutating public func push(_ value: T) {
        head = Node(val: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    mutating public func append(_ value: T) {
        guard !isEmpty else {
            push(value)
            return
        }
        tail!.next = Node(val: value, next: nil)
        tail = tail!.next
    }
    
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        guard let head = head else {
            return "Empty List"
        }
        return String(describing: head)
    }
}
