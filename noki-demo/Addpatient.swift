//
//  Addpatient.swift
//  noki-demo
//
//  Created by rathan on 24/07/24.
//

import SwiftUI

struct Addpatient: View {
    @EnvironmentObject var dataManager:Datamanager
    @State var newPatient=""
    var body: some View {
        VStack{
            TextField("Add patient",text:$newPatient)
            
            Button(action: {
                dataManager.addPatient(patientName: newPatient)
            }){
                Text("Save")
            }
        }
    }
}

#Preview {
    Addpatient()
}
