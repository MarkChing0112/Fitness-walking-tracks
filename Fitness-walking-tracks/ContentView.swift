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

    var body: some View {

        NavigationView {
                SignInView().navigationBarHidden(false)
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
