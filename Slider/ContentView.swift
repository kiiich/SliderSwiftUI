//
//  ContentView.swift
//  Slider
//
//  Created by Николай on 09.11.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var targetValue = Int.random(in: 0...100)
    @State private var sliderValue: Float = Float.random(in: 0...100)
    @State private var isPresented = false
    @State private var score = 0
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Подвиньте слайдер, как можно ближе к: \(targetValue)")
                .padding()
            SliderLine(sliderValue: $sliderValue, targetValue: $targetValue)
            Button("Проверь меня!") {
                score = ScoreCalculator.shared.computeScore(
                    targetValue: targetValue,
                    sliderValue: sliderValue
                )
                isPresented.toggle()
            }.alert(isPresented: $isPresented) {
                Alert(
                    title: Text("Your score is:"),
                    message: Text("\(score)"),
                    dismissButton: .cancel(Text("OK"))
                )
            }
            Button("Начать заново") {
                targetValue = Int.random(in: 0...100)
            }
        }
    }
    
}

struct SliderLine: View {
    
    @Binding var sliderValue: Float
    @Binding var targetValue: Int
    
    var body: some View {
        HStack {
            Text("0")
            SliderUIKit(
                sliderValue: $sliderValue,
                targetValue: $targetValue)
            Text("100")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
