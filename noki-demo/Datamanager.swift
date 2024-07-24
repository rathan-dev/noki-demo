//
//  Datamanager.swift
//  noki-demo
//
//  Created by rathan on 24/07/24.
//

import SwiftUI
import Firebase

class Datamanager:ObservableObject{
    @Published var pateints:[Pateint]=[]
    
    
    init(){
        fetchAllPateints()
    }
    
    
    func fetchAllPateints(){
        pateints.removeAll()
        let db=Firestore.firestore()
        let ref=db.collection("Patients")
        ref.getDocuments{ snapshot, error in
            guard error==nil else{
                print(error!.localizedDescription)
                return
            }
             
            if let snapshot=snapshot{
                for document in snapshot.documents{
                    let data=document.data()
                    
                    let id=data["id"] as? String ?? ""
                    let name=data["name"] as? String ?? ""
                    
                    let patient=Pateint(id: id, name: name)
                    
                    self.pateints.append(patient)
                }
            }
            
        }
    }
    
    
    func addPatient(patientName:String){
        let db=Firestore.firestore()
        let ref=db.collection("Patients").document(patientName)
        
        ref.setData(["name" : patientName,"id":Int.random(in:1...10000)]){ error in
            if let error = error{
                print(error.localizedDescription)
            }
        }
    }
    
}
