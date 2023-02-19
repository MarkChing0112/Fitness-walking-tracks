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
            Image(systemName: "rectangle.portrait.and.arrow.forward")
                .resizable()
                .aspectRatio( contentMode: .fit)
                .frame(width: 40,height: 40)
                .padding(10)
            
            VStack(alignment: .leading ){
                Text("hello")
                
                    .fontWeight(.bold)
                    .font(.title)
                Text("ddd")
                    .foregroundColor(.gray)
            }
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
//        ItemRow(item:HomeView.example)
        ItemRow()

    }
}
