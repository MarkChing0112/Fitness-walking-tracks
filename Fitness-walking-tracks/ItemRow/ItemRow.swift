//
//  ItemRow.swift
//  Fitness-walking-tracks
//
//  Created by Holung Cheng on 18/2/2023.


import SwiftUI

struct ItemRow: View {
//    let item : HomeView
    
    var body: some View{
        HStack{
            Image("testimg")
                .resizable()
                .frame(width: 50,height: 70)

            
            VStack(alignment: .leading ){
                Text("hello")
                
                    .fontWeight(.bold)
                    .font(.title)
                Text("ddd")
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
//        ItemRow(item:HomeView.example)
        ItemRow()

    }
}
