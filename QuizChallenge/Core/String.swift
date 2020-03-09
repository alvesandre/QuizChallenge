//
//  String.swift
//  QuizChallenge
//
//  Created by André Alves on 09/03/20.
//  Copyright © 2020 André Alves. All rights reserved.
//

import Foundation

extension String {
    public func leftPadding(toLength: Int, withPad character: Character) -> String {
        return padding(toLength: toLength, withPad: character, left: true)
    }
    private func padding(toLength: Int, withPad character: Character, left: Bool) -> String {
        let newLength = self.count
        guard newLength < toLength else {
            let indexStartOfText = self.index(self.startIndex, offsetBy: newLength - toLength)
            return String(self[indexStartOfText...])
        }
        
        if left {
            return String(repeatElement(character, count: toLength - newLength)) + self
        } else {
            return self + String(repeatElement(character, count: toLength - newLength))
        }
    }
}
