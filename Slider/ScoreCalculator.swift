//
//  ScoreCalculator.swift
//  Slider
//
//  Created by Николай on 09.11.2021.
//

import Foundation

class ScoreCalculator {
    
    static let shared = ScoreCalculator()
    
    init() { }
    
    func computeScore(targetValue: Int, sliderValue: Float) -> Int {
        let difference = abs(targetValue - lround(Double(sliderValue)))
        return 100 - difference
    }
    
}
