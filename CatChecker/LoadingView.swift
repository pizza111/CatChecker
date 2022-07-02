//
//  LoadingView.swift
//  CatChecker
//
//  Created by Piotr Woźniak on 02/07/2022.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [
                Color(uiColor: .blue),
                Color(uiColor: .systemPink)
            ], startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
            
            VStack {
                Text("😺")
                    .font(.system(size: 70))
                ProgressView()
                    .scaleEffect(3)
                    .padding(.bottom, 30)
                
                Text("Getting the cats...")
                    .font(.title)
                    .foregroundColor(.white)
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
