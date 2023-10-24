//
//  SignUpView.swift
//  DEEP-iOS
//
//  Created by 이민규 on 10/24/23.
//

import SwiftUI
import OpenTDS

struct SignUpView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State var name: String = ""
    @State var nameRetry: Bool = false
    
    @State var userId: String = ""
    @State var idRetry: Bool = false
    
    @State var password: String = ""
    @State var passwordRetry: Bool = false
    
    @State var email: String = ""
    @State var emailRetry: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                TossScrollView("회원가입") {
                    VStack(spacing: 6) {
                        CustomTextField(text: $name, retry: $nameRetry, placeholder: "이름")
                        CustomTextField(text: $userId, retry: $idRetry, placeholder: "아이디")
                        CustomTextField(text: $password, retry: $passwordRetry, placeholder: "비밀번호")
                        CustomTextField(text: $email, retry: $emailRetry, placeholder: "이메일")
                    }
                    .padding(.horizontal, 24)
                }
                .backButton {
                    dismiss()
                }
                
                Spacer()
                
                NavigationLink(destination: {
                    MainView()
                }) {
                    Text("회원가입")
                        .setFont(18, .medium)
                        .foregroundColor(.white)
                        .frame(height: 49)
                        .frame(maxWidth: .infinity)
                        .background(Colors.blue500)
                        .cornerRadius(16)
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 20)
            }
        }
        .navigationBarHidden(true)
    }
}
