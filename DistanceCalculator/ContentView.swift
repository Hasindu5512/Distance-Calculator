//
//  ContentView.swift
//  DistanceCalculator
//
//  Created by Pubudu Mihiranga on 2023-03-12.
//

import SwiftUI

enum ConversionType: String {
    case cm = "CM"
    case inch = "INCH"
    case foot = "FOOT"
    case km = "KM"
}

struct ContentView: View {
    
    @AppStorage("distanceText") private var distanceText = ""
    @State private var convertedValue = "<<Value>>"
    @State private var selectedOperation = "<<Unit>>"
    
    var body: some View {
        VStack(spacing: 30) {
            
            Text("Distance Converter")
                .font(.largeTitle)
                .bold()
            
            Image("logo")
                .resizable()
                .frame(width: 100, height: 100)
            
            TextField("Distance in M", text: $distanceText)
                .textFieldStyle(.roundedBorder)
                .border(.black)
            
            HStack {
                Button(ConversionType.cm.rawValue) {
                    convertDistance(type: .cm)
                }
                .buttonStyle(.bordered)
                .foregroundColor(.white)
                .background(.red)
                .cornerRadius(10)
                
                Button(ConversionType.inch.rawValue) {
                    convertDistance(type: .inch)
                }
                .buttonStyle(.bordered)
                .foregroundColor(.white)
                .background(.green)
                .cornerRadius(10)
                
                Button(ConversionType.foot.rawValue) {
                    convertDistance(type: .foot)
                }
                .buttonStyle(.bordered)
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(10)
                
                Button(ConversionType.km.rawValue) {
                    convertDistance(type: .km)
                }
                .buttonStyle(.bordered)
                .foregroundColor(.white)
                .background(.orange)
                .cornerRadius(10)
            }
            
            Text("Converted Value in \(selectedOperation) is \(convertedValue)")
                .multilineTextAlignment(.center)
            
            Image("image01")
                .resizable()
            
            Button("Reset") {
                distanceText = ""
                convertedValue = "<<Value>>"
                selectedOperation = "<<Unit>>"
            }
            
            Spacer()
        }
        .padding()
    }
    
    func convertDistance(type: ConversionType) {
        guard let givenDistance = Double(distanceText) else { return }
        
        switch type {
            case .cm:
                let newDistance = givenDistance * 100
                convertedValue = String(format: "%.2f", newDistance)
                selectedOperation = ConversionType.cm.rawValue
            case .inch:
                let newDistance = givenDistance * 39.37
                convertedValue = String(format: "%.2f", newDistance)
                selectedOperation = ConversionType.inch.rawValue
            case .foot:
                let newDistance = givenDistance * 3.28084
                convertedValue = String(format: "%.2f", newDistance)
                selectedOperation = ConversionType.foot.rawValue
            default:
                let newDistance = givenDistance / 1000
                convertedValue = String(format: "%.3f", newDistance)
                selectedOperation = ConversionType.km.rawValue
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
