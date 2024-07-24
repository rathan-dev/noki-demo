//
//  noki_demoApp.swift
//  noki-demo
//
//  Created by rathan on 22/07/24.
//

import SwiftUI
import Firebase

@main
struct noki_demoApp: App {
    @StateObject var dataManager=Datamanager()
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
