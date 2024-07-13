//
//  ContentView.swift
//  UnitConverter
//
//  Created by Daren Darnell on 7/13/24.
//

import SwiftUI

struct ContentView: View {
    @State private var input = 0.0
    @State private var inputUnit = "l"
    @State private var outputUnit = "l"
    
    private var output : Measurement<UnitVolume> {
        let base = Measurement(value: input, unit: volumes[inputUnit] ?? UnitVolume.liters)
        return base.converted(to: volumes[outputUnit] ?? UnitVolume.liters)
    }
    
    let volumes = [
        "ml":UnitVolume.milliliters,
        "l":UnitVolume.liters,
        "cups":UnitVolume.cups,
        "pints":UnitVolume.pints,
        "gallons":UnitVolume.gallons
    ]
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Input") {
                    TextField("Input value", value: $input, format: .number)
                    Picker("Unit", selection: $inputUnit) {
                        ForEach(Array(volumes.keys).sorted(), id: \.self){
                            Text("\($0)")
                        }
                    }.pickerStyle(.segmented)
                }
                Section("Output") {
                    Text("\(output)")
                    Picker("Unit", selection: $outputUnit) {
                        ForEach(Array(volumes.keys).sorted(), id: \.self){
                            Text("\($0)")
                        }
                    }.pickerStyle(.segmented)
                }
            }.navigationTitle("Unit Converter")
        }
    }
}

#Preview {
    ContentView()
}
