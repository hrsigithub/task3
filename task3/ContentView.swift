//
//  ContentView.swift
//  task3
//
//  Created by Hiroshi.Nakai on 2021/02/14.
//

import SwiftUI

struct ContentView: View {
    @State private var textArray = Array(repeating: "", count: 2)

    @State private var flagLeft = false
    @State private var flagRight = false

    @State private var signedLeftNum: Int?
    @State private var signedRightNum: Int?

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
            }.padding()

            HStack {
                Text("+")
                Toggle("", isOn: $flagRight)
                    .labelsHidden()
                Text("-")
            }.padding()

            Button("計算") {
                // 計算
                let num1 = Int(textArray[0]) ?? 0
                let num2 = Int(textArray[1]) ?? 0

                signedLeftNum = flagLeft ? num1  * -1 : num1
                signedRightNum = flagRight ? num2  * -1 : num2

                if let signedLeftNum = signedLeftNum,
                   let signedRightNum = signedRightNum {
                    result = String(signedLeftNum + signedRightNum)
                } else {
                    result = "結果"
                }

            }.padding()

            HStack {
                Text(signedLeftNum.map { String($0) } ?? "")
                Text("+")
                Text(signedRightNum.map { String($0) } ?? "")
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
