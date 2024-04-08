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
    
    public func node(at index: Int) -> Node<T>? {
        var currentNode = head
        var currentIndex = 0
        
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode!.next
            currentIndex += 1
        }
        return currentNode
    }
    
    @discardableResult
    public mutating func insert(_ value: T, after node: Node<T>) -> Node<T> {
        guard tail !== node else {
            append(value)
            return tail!
        }
        node.next = Node(val: value, next: node.next)
        return node.next!
    }
    
    @discardableResult
    public mutating func pop() -> T? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.val
    }
                
    @discardableResult
    public mutating func removeLast() -> T? {
        guard let head = head else {
            return nil
        }
        guard head.next != nil else {
            return pop()
        }
        var prev = head
        var current = head
        
        while let next = current.next {
            prev = current
            current = next
        }
        
        prev.next = nil
        tail = prev
        return current.val
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

