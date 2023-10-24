//
//  View-Ext.swift
//  DEEP-iOS
//
//  Created by 이민규 on 10/23/23.
//

import SwiftUI

extension View {
    
    @ViewBuilder
    func setFont(_ size: CGFloat, _ weight: Font.Weight = .regular) -> some View {
        self
            .font(.system(size: size, weight: weight))
    }
    
    @ViewBuilder
    func setBackground() -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    @ViewBuilder
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
}
