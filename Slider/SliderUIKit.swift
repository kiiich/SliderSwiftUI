//
//  SliderUIKit.swift
//  Slider
//
//  Created by Николай on 09.11.2021.
//

import SwiftUI

struct SliderUIKit: UIViewRepresentable {

    @Binding var sliderValue: Float
    @Binding var targetValue: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.sliderDidChange),
            for: .valueChanged)
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = sliderValue
        let alpha = CGFloat(ScoreCalculator.shared.computeScore(targetValue: targetValue, sliderValue: sliderValue)) / 100
        uiView.thumbTintColor = UIColor(red: 255, green: 0, blue: 0, alpha: alpha)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(sliderValue: $sliderValue)
    }
        
}

extension SliderUIKit {
    class Coordinator: NSObject {
        @Binding var sliderValue: Float
        
        init(sliderValue: Binding<Float>) {
            self._sliderValue = sliderValue
        }
        
        @objc func sliderDidChange(_ sender: UISlider) {
            sliderValue = sender.value
        }
    }
}

struct SliderUIKit_Previews: PreviewProvider {
    static var previews: some View {
        SliderUIKit(
            sliderValue: .constant(10.5),
            targetValue: .constant(80))
    }
}
