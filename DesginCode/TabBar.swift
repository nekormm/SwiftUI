//
//  TabBar.swift
//  DesginCode
//
//  Created by Jaime Cadena on 22/12/21.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
       TabView {
          Home().tabItem {
             Image(systemName: "play.circle.fill")
             Text("Home")
          }
          
          ContentView().tabItem {
             Image(systemName: "rectangle.stack.fill")
             Text("Card")
          }
       }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
