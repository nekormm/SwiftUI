//
//  HomeView.swift
//  DesginCode
//
//  Created by Jaime Cadena on 15/12/21.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var showProfile : Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("Watching")
                    .font(.system(size: 28 , weight: .bold))
                
                Spacer()
                
                AvatarView(showProfile: $showProfile)
            }
            .padding(.horizontal)
            .padding(.top , 30)
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false))
    }
}
