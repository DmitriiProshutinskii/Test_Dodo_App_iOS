//
//  MainMenuView.swift
//  Dodo_App
//
//  Created by Физтех.Радио on 18.03.2021.
//

import SwiftUI

struct MainMenuView: View {
    @State var offset: CGFloat = 0
    @State var startOffset: CGFloat = 0
    @State private var showingSheet = false
    @State var horizontalOffset: CGFloat = 0
    @State var startHorizontalOffset: CGFloat = 0
    let topFloat: CGFloat = 170
    
    
    var body: some View {
        ZStack{
            ScrollView(.vertical, showsIndicators: false) {
                VStack{
                    NewsView()
                    FoodChooser(horizontalOffset: horizontalOffset, startHorizontalOffset: startHorizontalOffset)   
                    PizzaCarouseView(food: FoodList_TMP.pizzas)
                    PizzaCarouseView(food: FoodList_TMP.snacks)
                    Spacer()
                }
                .overlay(
                    GeometryReader { proxy -> Color in
                        let minY = proxy.frame(in: .global).minY
                        
                        DispatchQueue.main.async {
                            if startOffset == 0 {
                                startOffset = minY
                            }
                            
                            offset = startOffset - minY
                        }
                        return Color.clear
                    }
                    .frame(width: 0, height: 0)
                )
            }.zIndex(0)
            
            VStack{
                ZStack{
                    Rectangle()
                        .frame(height: 50)
                        .foregroundColor(.white)
                        .shadow(radius: 10)
                    FoodChooser(horizontalOffset: horizontalOffset, startHorizontalOffset: startHorizontalOffset)

                }
                Spacer()
            }
            .opacity(offset >= topFloat ? 1 : 0)
        }
    }
    
    
    func getOffset() -> CGSize {
        var size: CGSize = .zero
        size.width = offset
        size.height = -offset
        return size
    }
}


struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
