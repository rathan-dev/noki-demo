//
//  Pateints.swift
//  noki-demo
//
//  Created by rathan on 24/07/24.
//

import SwiftUI

struct Pateints: View {
    @EnvironmentObject var dataManager:Datamanager
    @State private var showPopup=false
    var body: some View {
        NavigationView{
            List(dataManager.pateints,id:\.id){ patient in
                Text(patient.name)
            }.navigationTitle("Patients").navigationBarItems(trailing:Button(action:{
                showPopup.toggle()
            }, label:{
                Image(systemName: "plus")
            })).sheet(isPresented: $showPopup){
                Addpatient()
            }
        }
    }
}

#Preview {
    Pateints().environmentObject(Datamanager())
}
