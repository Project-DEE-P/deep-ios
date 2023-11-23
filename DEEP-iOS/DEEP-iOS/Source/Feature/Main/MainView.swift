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
                StorageView()
                    .tossTabItem("보관함", Image(systemName: "tray"))
                PurchaseView()
                        .tossTabItem("구매", Image(systemName: "person.text.rectangle"))
                ProfileView()
                    .tossTabItem("프로필", Image(systemName: "person"))
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
