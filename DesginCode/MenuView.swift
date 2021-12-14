//
//  MenuView.swift
//  DesginCode
//
//  Created by Jaime Cadena on 14/12/21.
//

import SwiftUI
import UIKit

struct MenuView: View {
    var body: some View {
        VStack {
            Spacer()
            
            VStack (spacing : 16){
                Text("Nekormm - 31% complete")
                    .font(.caption)
                
                Color.white
                    .frame(width: 38, height: 6)
                    .cornerRadius(3)
                    .frame(width: 130, height: 6, alignment: .leading)
                    .background(Color.black.opacity(0.08))
                    .cornerRadius(3)
                    .padding()
                    .frame(width: 150, height: 24)
                    .background(Color.black.opacity( 0.1))
                    .cornerRadius(12)
                
                MenuRow(title: "Account", icon: "gear")
                MenuRow(title: "Billing", icon: "creditcard")
                MenuRow(title: "Sign out", icon: "person.crop.circle")
            }
            
            .frame(maxWidth: .infinity)
            .frame(height: 300)
            .background(LinearGradient(colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.8954151273, green: 0.9160741568, blue: 0.9564130902, alpha: 1))], startPoint: .top, endPoint: .bottom))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 20, y: 0)
            .padding(.horizontal, 30)
            .overlay(
                Image("Avatar")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60 )
                    .clipShape(Circle())
                    .offset(y: -150)
            )
        
        }
        .padding(.bottom , 30)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
 
 

struct MenuRow: View {
    var title : String
    var icon: String
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .font(.system(size: 20, weight: .light))
                .imageScale(.large)
                .frame(width: 32, height: 32)
                .foregroundColor(Color.gray)
            Text(title)
                .font(.system(size: 20, weight: .bold, design: .default))
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .frame(width: 120, alignment: .leading )
        }
    }
}
