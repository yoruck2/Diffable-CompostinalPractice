//
//  String+.swift
//  Diffable&CompostinalPractice
//
//  Created by dopamint on 7/20/24.
//

import Foundation

extension String {
    var formattedDotDate: Self {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        guard let date = formatter.date(from: self) else {
            return self
        }
        
        formatter.dateFormat = "yy.MM.dd"
        
        let outputDate = formatter.string(from: date)
        return outputDate
    }
}
