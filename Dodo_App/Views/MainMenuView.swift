//
//  MainMenuView.swift
//  Dodo_App
//
//  Created by Физтех.Радио on 18.03.2021.
//

import SwiftUI

struct MainMenuView: View {
    
    
    var body: some View {
        
        NavigationView{
            TabView {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack{
                        NewsView()
                        //body(for: FoodChooser(), viewTop: FoodChooserTop())
                        FoodChooser()
                        PizzaCarouseView(food: FoodList_TMP.pizzas)
                        PizzaCarouseView(food: FoodList_TMP.snacks)
                        Spacer()
                    }
                }.tabItem { TabButtonView(title: "Меню", icon: "house") }
                
                ProfileView().tabItem { TabButtonView(title: "Профиль", icon: "person") }
                LocationView().tabItem { TabButtonView(title: "Контакты", icon: "location") }
                BasketView().tabItem { TabButtonView(title: "Корзина", icon: "bag") }
            }
            
            
        }
        
        
        
    }
    
    private func body<T:View>(for viewFloat: T, viewTop: T) -> some View {
        GeometryReader {
            geometry in viewFloat
            let intersection = UIScreen.main.bounds.intersection(geometry.frame(in: CoordinateSpace.global))
            if !intersection.equalTo(geometry.frame(in: CoordinateSpace.global)) {
                viewTop
            }
            else {
                viewFloat
            }
        }
    }
}

struct TabButtonView: View {
    var title: String
    var icon: String
    
    var body: some View {
        VStack{
            Image(systemName: icon)
            Text(title)
        }
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
