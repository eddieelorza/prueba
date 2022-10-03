//
//  ContentView.swift
//  formulario
//
//  Created by Eddie Elorza on 03/10/22.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State var onlyNumbersValue: String = ""
    var body: some View {
        Group {
            TextField("Solo numeros", text: $onlyNumbersValue)
                           .keyboardType(.numberPad)
                           .frame(width: 200, height: 50, alignment: .center)
                           .cornerRadius(10)
                           .padding()
                           .onChange(of: onlyNumbersValue, perform: { value in
                               if onlyNumbersValue.count > 16 {
                                   onlyNumbersValue.removeLast()
                               }
                           })
            Button(action: {
                                var numbers = [Int]()
                                for number in onlyNumbersValue {
                                    numbers.append(Int(String(number))!)
                                }
                                var numbersCount = [Int: Int]()
                                for number in numbers {
                                    if numbersCount[number] == nil {
                                        numbersCount[number] = 1
                                    } else {
                                        numbersCount[number]! += 1
                                    }
                                }
                                var mostRepeatedNumber = 0
                                var mostRepeatedNumberCount = 0
                                for (number, count) in numbersCount {
                                    if count > mostRepeatedNumberCount {
                                        mostRepeatedNumber = number
                                        mostRepeatedNumberCount = count
                                    }
                                }
                                print("El numero que mas se repite es \(mostRepeatedNumber) y se repite \(mostRepeatedNumberCount) veces")
                            }, label: {
                                Text("Contar")
                                    .frame(width: 200, height: 50, alignment: .center)
                                    .cornerRadius(10)
                                    .padding()
                            })
      
            
                        
                }
     }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
