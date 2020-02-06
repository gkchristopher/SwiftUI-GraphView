//
//  ContentView.swift
//  GraphViewExample
//
//  Created by Christopher Moore on 2/6/20.
//  Copyright © 2020 Roving Mobile. All rights reserved.
//

import SwiftUI
import GraphView

struct ContentView: View {
    let values: [CGFloat] = [0.4, 0.7, 0.2, 0.5, 0.9, 0.3, 0.6]
    
    var body: some View {
        GraphView(values: values)
            .frame(height: 300)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
