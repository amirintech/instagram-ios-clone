//
//  Timestamp.swift
//  Instagram
//
//  Created by Amir on 10/01/2024.
//

import Firebase

extension Timestamp {
    func toString() -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: self.dateValue(), to: Date()) ?? ""
    }
}
