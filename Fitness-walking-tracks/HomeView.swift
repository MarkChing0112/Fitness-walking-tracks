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
    var body: some View {
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
        HomeView()
    }
}
