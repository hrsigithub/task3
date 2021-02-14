//
//  ContentView.swift
//  task3
//
//  Created by Hiroshi.Nakai on 2021/02/14.
//

import SwiftUI

struct ContentView: View {
    @State private var textArray = Array(repeating: "", count: 2)

    @State private var flagLeft = true
    @State private var flagRight = true

    @State private var leftNum = ""
    @State private var rightNum = ""

    @State private var result = "結果"

    var body: some View {
        VStack {
            HStack {
                InputView(text: $textArray[0])
                InputView(text: $textArray[1])
            }.padding()

            HStack {
                Text("+")
                Toggle("", isOn: $flagLeft)
                    .labelsHidden()
                Text("-")

                Text("+")
                Toggle("", isOn: $flagRight)
                    .labelsHidden()
                Text("-")
            }

            Button("計算") {
                // 計算
                let num1 = Int(textArray[0]) ?? 0
                let num2 = Int(textArray[1]) ?? 0

                leftNum = String(flagLeft ? num1  * -1 : num1)
                rightNum = String(flagRight ? num2  * -1 : num2)

                let resultNum1 = Int(leftNum) ?? 0
                let resultNum2 = Int(rightNum) ?? 0

                result = String(resultNum1 + resultNum2)


            }.padding()

            HStack {
                Text(leftNum)
                Text("+")
                Text(rightNum )
            }.padding()

            HStack {
                Text(result)
            }.padding()

            Spacer()
        }
    }
}
struct InputView: View {
    @Binding var text: String

    var body: some View {
        TextField("", text: $text)
//            .keyboardType(.decimalPad)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.black.opacity(0.5), lineWidth: 1)
            )
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
