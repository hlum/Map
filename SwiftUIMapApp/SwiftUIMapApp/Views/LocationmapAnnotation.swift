//
//  LocationmapAnnotation.swift
//  SwiftUIMapApp
//
//  Created by Hlwan Aung Phyo on 2024/06/20.
//

import SwiftUI

struct LocationmapAnnotation: View {
    let accentColor = Color("AccentColor")
    var body: some View {
        VStack(spacing: 0){
            Image(systemName:"map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width:30,height: 30)
                .font(.headline)
                .foregroundColor(.white)
                .padding(6)
                .background(accentColor)
                .cornerRadius(36)
            Image(systemName:"triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(accentColor)
                .frame(width: 10,height: 10)
                .rotationEffect(Angle(degrees: 180))
                .offset(y:-3)
                .padding(.bottom,40)
        }

    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        LocationmapAnnotation()
    }
}
