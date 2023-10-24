//
//  StartView.swift
//  DEEP-iOS
//
//  Created by 이민규 on 10/23/23.
//

import SwiftUI

struct StartView: View {
    
    @State var isLaunched: Bool = true
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Image("logo2")
                    .resizable()
                    .frame(width: 140, height: 40)
                
                Spacer()
                
                NavigationLink(destination: {
                    SignInView()
                }) {
                    Text("로그인")
                        .setFont(18, .medium)
                        .foregroundColor(.white)
                        .frame(height: 49)
                        .frame(maxWidth: .infinity)
                        .background(Colors.blue500)
                        .cornerRadius(16)
                }
                
                HStack(spacing: 8) {
                    Text("DEEP 유저가 아니라면?")
                        .setFont(13, .regular)
                        .foregroundColor(Colors.gray300)
                    
                    NavigationLink(destination: {
                        SignUpView()
                    }) {
                        Text("회원가입")
                            .setFont(16, .medium)
                            .foregroundColor(Colors.gray600)
                    }
                }
                .padding(.vertical, 6)
            }
            .padding(.horizontal, 24)
            .overlay {
                if isLaunched {
                    VStack {
                        Image("logo")
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                    withAnimation(.easeIn) {
                                        self.isLaunched = false
                                    }
                                }
                            }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white)
                }
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    StartView()
}
