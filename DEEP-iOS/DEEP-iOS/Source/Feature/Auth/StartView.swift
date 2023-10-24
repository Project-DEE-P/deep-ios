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
            ZStack {
                if isLaunched {
                    Image("logo")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.white)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                self.isLaunched = false
                            }
                        }
                }
                
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
                        
                        Button {
                            
                        } label: {
                            Text("회원가입")
                                .setFont(16, .medium)
                                .foregroundColor(Colors.gray600)
                        }
                    }
                    .padding(.bottom, 6)
                }
                .padding(.horizontal, 24)
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    StartView()
}
