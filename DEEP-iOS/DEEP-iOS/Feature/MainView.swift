//
//  MainView.swift
//  DEEP-iOS
//
//  Created by 이민규 on 10/23/23.
//

import SwiftUI
import OpenTDS

struct MainView: View {
    
    var body: some View {
        
        NavigationView {
            TossTabView {
                AddBusinessCardView()
                    .tossTabItem("명함 추가", Image(systemName: "person.text.rectangle"))
                StorageView()
                    .tossTabItem("보관함", Image(systemName: "tray"))
                ProfileView()
                    .tossTabItem("수납장", Image(systemName: "person"))
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
