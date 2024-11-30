//
//  onboardingView.swift
//  vbGrocery
//
//  Created by Faizan ios developer on 26/11/24.
//

import SwiftUI

struct onboardingView: View {
    @State var index: Int
   
    var body: some View {
        ZStack {
            Color(red: 217/255, green: 217/255, blue: 217/255, opacity: 1.0)
                .edgesIgnoringSafeArea(.all)
       
            VStack {
                HStack {
                    Spacer()
                    Button {
                        index = 0
                    } label: {
                        Text("Skip")
                            .font(.system(size: 18))
                            .padding(14)
                            .foregroundStyle(.black)
                    }

                }
              
                Image(index == 0 ? "1": index == 1 ? "2": "3")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 350,height: 350)
                    .padding()
                Text("shop now")
                    .font(.system(size: 14))
                    .bold()
                    .padding(20.0)
                Text("Easy and Fast way of shopping to save your valuable time")
                    .font(.system(size: 18,design: .rounded))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity,alignment: .center)
                    .padding()
                
                PageControlView(currentPage: $index, numberOfPages: 3,activeImage:
                                    UIImage(named:"select")!,
                                inactiveImage: UIImage(named:"unselect")!)
                    .frame(height: 30)
                    .padding()
                Button {
                    if index < 3 - 1 {
                        index += 1 // Navigate to the next page
                                       }
                } label: {
                    Text("Next")
                        .font(.system(size: 22,design:.rounded))
                        .frame(width: 228,height: 50)
                        .foregroundStyle(.white)
                        .background(Color.black)
                        .cornerRadius(10.0)
                         
                }
                .frame(height: nil)
                
                Spacer()
                  
                    
                    
                    
                    
                    

                   
                
                    
                
                    
            }
            
        }
    }
}

#Preview {
    onboardingView(index: 0)
}
