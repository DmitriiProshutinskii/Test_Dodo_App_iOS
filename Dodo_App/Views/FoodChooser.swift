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
    //@Namespace var animation:
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 16) {
                ForEach(tabs, id: \.self) { tab in
                    TabButton(title: tab, selected: $selected)
                }
            }
            .padding(.leading, 11)
        }.frame(height: 33, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        
    }
}

struct FoodChooserTop: View {
    @State var selected = tabs[0]
    //@Namespace var animation:
    
    var body: some View {
        
        VStack{
            ZStack{
                Rectangle()
                    .frame(height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .shadow(radius: 10)
                    .ignoresSafeArea()
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 16) {
                        ForEach(tabs, id: \.self) { tab in
                            TabButton(title: tab, selected: $selected)
                        }
                    }
                    .padding(.leading, 11)
                }.frame(height: 33, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            
            
            Spacer()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FoodChooserTop()
    }
}
