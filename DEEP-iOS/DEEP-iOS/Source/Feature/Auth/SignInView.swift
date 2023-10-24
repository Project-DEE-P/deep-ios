//
//  SignInView.swift
//  DEEP-iOS
//
//  Created by 이민규 on 10/23/23.
//

import SwiftUI
import OpenTDS

struct SignInView: View {
    
    @Environment(\.dismiss) private var dismiss

    @State var userId: String = ""
    @State var idRetry: Bool = false
    
    @State var password: String = ""
    @State var passwordRetry: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                TossScrollView("로그인") {
                    VStack(spacing: 6) {
                        CustomTextField(text: $userId, retry: $idRetry, placeholder: "아이디")
                        CustomTextField(text: $password, retry: $passwordRetry, placeholder: "비밀번호")
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
                    Text("로그인")
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

enum TextFieldType {
    case normal
    case secure
    case email
    case numeric
}

// MARK: - Custom Text Field
struct CustomTextField: View {
    
    @Namespace private var animation
    
    @Binding var text: String
    @Binding var retry: Bool
    
    @FocusState private var focus: Bool
    @State private var animatedText: String = String()
    
    let placeholder: String
    var type: TextFieldType?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Spacer()
            
            // MARK: - Placeholder
            if !animatedText.isEmpty {
                Text(placeholder)
                    .scaleEffect(0.7, anchor: .leading)
                    .foregroundColor(focus ? .accentColor : Color.gray)
                    .matchedGeometryEffect(id: "text", in: animation)
            }
            
            // MARK: - Text Field
            ZStack(alignment: .leading) {
                if animatedText.isEmpty {
                    Text(placeholder)
                        .foregroundColor(.gray)
                        .matchedGeometryEffect(id: "text", in: animation)
                }
                switch(type) {
                case .secure:
                    SecureField("", text: $text)
                        .focused($focus)
                case .email:
                    TextField("", text: $text)
                        .focused($focus)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                case .numeric:
                    TextField("", text: $text)
                        .focused($focus)
                        .keyboardType(.numberPad)
                default:
                    TextField("", text: $text)
                        .focused($focus)
                        .autocapitalization(.none)
                }
            }
            .onChange(of: text) { _ in changeText() }
            
            // MARK: - Line
            Rectangle()
                .fill(focus ? Colors.blue500: Colors.gray50)
                .frame(height: 1.3)
                .padding(.top, 10)
        }
        .font(.title3)
        .frame(height: 70)
        .transition(.slide.combined(with: .opacity))
    }
    
    private func changeText() {
        withAnimation(.default) {
            retry = false
        }
        withAnimation(.easeInOut(duration: 0.2)) {
            animatedText = text
        }
    }
}
