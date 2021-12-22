//
//  UpdateStore.swift
//  DesginCode
//
//  Created by Jaime Cadena on 22/12/21.
//

import SwiftUI
import Combine

class UpdateStore : ObservableObject {
   
   @Published var updates : [Update] = updateData
   
   
}
