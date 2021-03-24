//
//  ActivityIndicator.swift
//  Movie Selector
//
//  Created by Andreas Velounias on 24/03/2021.
//

import SwiftUI

struct ActivityIndicator: View {
    let color: Color
    let size: CGFloat
    @State private var degrees = 0.0
    var body: some View {
        Circle()
            .trim(from: 0.0, to: 0.8)
            .stroke(color, lineWidth: 5.0)
            .frame(width: size, height: size, alignment: .center)
            .rotationEffect(Angle(degrees: degrees))
        onAppear(perform: {
            self.start()
        })
    }
    
    func start() {
        Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { timer in
            withAnimation {
                self.degrees += 10.0
            }
            if self.degrees == 360.0 {
                self.degrees = 0.0
            }
        }
    }
}

struct ActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicator(color: Color.blue, size: 80)
    }
}
