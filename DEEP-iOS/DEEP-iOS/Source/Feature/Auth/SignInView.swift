//
//  SignInView.swift
//  DEEP-iOS
//
//  Created by 이민규 on 10/23/23.
//

import SwiftUI

struct SignInView: View {
    
    @State var isLaunched: Bool = true
    
    var body: some View {
        NavigationView {
            VStack {
                
                
                Spacer()
                
                NavigationLink(destination: {
                    MainView()
                }) {
                    Text("로그인")
                        .setFont(18, .medium)
                        .foregroundColor(.white)
                        .frame(height: 49)
                        .frame(maxWidth: .infinity)
                        .background(Colors.blue500)
                        .cornerRadius(16)
                }
            }
            .padding()
        }
    }
}

#Preview {
    StartView()
}
