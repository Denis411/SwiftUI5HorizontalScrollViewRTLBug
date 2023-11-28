//
//  ContentView.swift
//  ScrollViewRTLBug
//
//  Created by dulianov on 28.11.23.
//

import SwiftUI

struct Element: Identifiable {
    var id = UUID()
    let value: String

    init(_ value: Int) {
        self.value = "Element \(value)"
    }
}

let bubbles: [Element] = {
    var array: [Element] = []
    for num in 0...5 {
        array.append(Element(num))
    }
    return array
}()

struct ContentView: View {
    let elements = bubbles
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(elements) { element in
                    Text(element.value)
                        .padding(5)
                        .background(Color.yellow)
                        .cornerRadius(5)
                }
            }
        }
        .environment(\.layoutDirection, .rightToLeft)
    }
}

#Preview {
    ContentView()
}
