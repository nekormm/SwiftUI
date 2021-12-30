//
//  RingView.swift
//  DesginCode
//
//  Created by Jaime Cadena on 22/12/21.
//

import SwiftUI

struct RingView: View {
    var body: some View {
       ZStack {
          
          Circle()
             .stroke(Color.black.opacity(0.2), style: StrokeStyle(lineWidth: 5))
             .frame(width: 44, height: 44)
          
          Circle()
             .trim(from: 0.2, to: 1)
             .stroke(
               LinearGradient(colors: [Color.red, Color.green], startPoint: .leading, endPoint: .trailing), style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [20,0], dashPhase: 5)
             )
             .rotationEffect(Angle(degrees: 90))
             .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
             .frame(width: 44, height: 44)
          .shadow(color: Color.red.opacity(0.3), radius: 3, x: 0, y: 3)
          
          Text("80%")
             .font(.subheadline)
             .fontWeight(.medium)
       }
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView()
    }
}
