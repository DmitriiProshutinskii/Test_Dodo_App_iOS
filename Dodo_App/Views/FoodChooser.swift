//
//  ContentView.swift
//  Dodo_App
//
//  Created by Физтех.Радио on 18.03.2021.
//

import SwiftUI

var tabs = ["Пицца","Комбо","Закуски","Десерты", "Напитки", "Другие товары"]

struct FoodChooser: View {
    
    @State var selected = tabs[0]
    @State var horizontalOffset: CGFloat
    @State var startHorizontalOffset: CGFloat
    
    var body: some View {
        
        ZStack{            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 16) {
                    ForEach(tabs, id: \.self) { tab in
                        TabButton(title: tab, selected: $selected)
                    }
                }
                .padding(.leading, 11)
                .overlay(
                    GeometryReader { proxy -> Color in
                        let minX = proxy.frame(in: .global).minX
                        
                        DispatchQueue.main.async {
                            if startHorizontalOffset == 0 {
                                startHorizontalOffset = minX
                            }
                            
                            horizontalOffset = startHorizontalOffset - minX
                            print(horizontalOffset)
                        }
                        return Color.clear
                    }
                    .frame(width: 0, height: 0)
                )
            }.frame(height: 33, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            //.offset(if isChanged : CGSize(width: horizontalOffset, height: 0) : 0)
        }
        
        
        
    }
}
