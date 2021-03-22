//
//  HomeView.swift
//  Dodo_App
//
//  Created by Физтех.Радио on 22.03.2021.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView{
            TabView {
                MainMenuView().tabItem { TabButtonView(title: "Меню", icon: "house") }                
                ProfileView().tabItem { TabButtonView(title: "Профиль", icon: "person") }
                LocationView().tabItem { TabButtonView(title: "Контакты", icon: "location") }
                BasketView().tabItem { TabButtonView(title: "Корзина", icon: "bag") }
            }
            
            
        }.navigationBarHidden(true)
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
