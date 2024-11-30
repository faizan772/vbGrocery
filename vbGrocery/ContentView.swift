//
//  ContentView.swift
//  vbGrocery
//
//  Created by Faizan ios developer on 25/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var currentPage = 0
     let totalPages = 3
    var body: some View {
        VStack {
            TabView(selection:$currentPage) {
                ForEach(0..<totalPages,id: \.self)  { index in
                    onboardingView(index: index)
                        .edgesIgnoringSafeArea(.all)
                    
                }
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
           
        }
    }
}

#Preview {
    ContentView()
}


struct LaunchView: View {
    @State private var isActive = false 
       @State private var opacity = 0.0
    var body: some View {
        if isActive {
            ContentView()
        }else{
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.green.opacity(0.5),.white,.green.opacity(0.5)]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                VStack {
                    Image("first")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300,height: 300)
                }
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeInOut(duration: 1.0)) {
                        opacity = 1.0
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                      isActive = true
                                  }
                }
            }
        }
    }
}
