//
//  Observable.swift
//  Diffable&CompostinalPractice
//
//  Created by dopamint on 7/20/24.
//

import Foundation

class Observable<T> {
    var closure: ((T) -> Void)?
    
    var value: T {
        didSet {
            print("바인딩 메서드 실행")
            closure?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bindEarly(closure: @escaping (T) -> Void) {
        closure(value)
        self.closure = closure
    }
    
    func bind(closure: @escaping (T) -> Void) {
//        closure(value)
        self.closure = closure
    }
}
