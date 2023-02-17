//
//  ContentView.swift
//  Fitness-walking-tracks
//
//  Created by Man Ho Ching on 17/2/2023.
//

import SwiftUI
import CoreData
import Firebase

struct ContentView: View {
    // Log Status
    @AppStorage("log_status") var logStatus: Bool = false
    
    var body: some View {

        NavigationView {
            if logStatus{
                HomeView().navigationBarBackButtonHidden(false)
            }else {
                SignInView().navigationBarBackButtonHidden(true)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(false)
        .navigationTitle("")
        .onAppear{
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
