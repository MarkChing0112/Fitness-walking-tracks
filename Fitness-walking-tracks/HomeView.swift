//
//  HomeView.swift
//  Fitness-walking-tracks
//
//  Created by Man Ho Ching on 17/2/2023.
//

import SwiftUI
import Firebase

struct HomeView: View {
    // Log Status
    @AppStorage("log_status") var logStatus: Bool = false
    @Binding var text:String
    @State private var Search = false
    
//    let item = Bundle.main.decode([FacilityElement].self, from:"facillity-fw.json")
    var body: some View {
        
        VStack(){
          
            HStack(){
                Text("Fitness Walking Tracks")
                    .fontWeight(.bold)
                    .font(.title)
//                    Image(systemName: "gear").resizable().aspectRatio( contentMode: .fit).frame(width: 50,height: 50)
                Spacer()
                
                Button(action:{},label: {
                    Image(systemName: "gear").resizable().aspectRatio( contentMode: .fit).frame(width: 50,height: 50)
                })
                
            }
           
            HStack{
                TextField("Search...",text: $text)
                    .padding(7)
                    .padding(.horizontal,25)
                    .shadow(color: .black, radius: 10)
                    .background(Color(.systemGray3))
                    .cornerRadius(8)
                    .padding(.horizontal,10)
                    .onTapGesture {
                        self.Search = true
                    }
                if Search{
                    Button(action:{
                        self.Search = false
                        self.text = ""
                    })
                    {
                        Text("Cancel")
                    }
                    .padding(.trailing, 10)
                    .transition(.move(edge: .trailing))
                }
            }
            
                HStack{
                    Text("推薦路線")
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity,alignment: .leading)
                }
            HStack{
                Button(action:{},label: {
                    Image(systemName: "gear").resizable().aspectRatio( contentMode: .fit).frame(width: 200,height: 200)
                })
            
            }
            
//            NavigationStack{
//                List{
//                    ForEach(menu) {section in Text(Section.name)
//
//                        ForEach(section.item) {item in ItemRow(item:item)}
//                    }
//                }
//                .navigationTitle("Hello")
//            }
        
                
            
        }

       
        VStack(spacing: 20){
            if logStatus{
                Text("Logged In")
                
                Button("Loggout") {
                    try? Auth.auth().signOut()
                    logStatus = false
                }
                
            }else{
                Text("Came as Guset")
            }
            
        }
        .navigationBarBackButtonHidden(false)
        .navigationTitle("Home")
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(text:.constant(""))
    }
}
