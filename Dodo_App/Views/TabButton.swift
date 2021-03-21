//
//  TabButton.swift
//  Dodo_App
//
//  Created by Физтех.Радио on 19.03.2021.
//

import SwiftUI

struct TabButton: View {
    var title: String
    @Binding var selected: String
    
    //var animation: Namespace.ID
    
    var body: some View {
        
        Button(action: {
            withAnimation(.spring()) {selected = title}
            
        }) {
            
            ZStack {
                Rectangle()
                    .fill((selected == title ? Color.orange : Color.gray).opacity(0.05))
                    .clipShape(Capsule())
                    //.matchedGeometryEffect(id: "Tab", in: animation)
                
                Text(title)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .font(.system(size: 15))
                    .foregroundColor(selected == title ? .orange : .gray)
                    
            }
            
//            Text(title)
//                .font(.system(size: 15))
//                .foregroundColor(selected == title ? .orange : .gray)
//                .padding(.vertical, 10)
//                .padding(.horizontal, selected == title ? 20 : 0)
//                .background(
//                    //Animation
//                    
//                    ZStack {
//                        (selected == title ? Color.orange : Color.gray)
//                            .clipShape(Capsule())
//                            .matchedGeometryEffect(id: "Tab", in: animation)
//                            .opacity(0.5)
//                    }
//                )
        }
    }
}
