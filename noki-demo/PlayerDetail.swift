//
//  PlayerDetail.swift
//  noki-demo
//
//  Created by rathan on 23/07/24.
//

import SwiftUI

struct PlayerDetail: View {
    var name:String
    var age:Int
    var body: some View {
        VStack{
            Text(name).font(.custom(FontStyle.NokiBold,size: 32))
            Text("\(age)").font(.custom(FontStyle.NokiBold,size: 32))
        }
        
    }
}

#Preview {
    PlayerDetail(name:"Mahish", age: 27)
}
