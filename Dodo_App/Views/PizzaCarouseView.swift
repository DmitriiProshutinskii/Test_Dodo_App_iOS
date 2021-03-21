//
//  PizzaCarouseView.swift
//  Dodo_App
//
//  Created by Физтех.Радио on 20.03.2021.
//

import SwiftUI

struct PizzaCarouseView: View {
    var food: [Food]
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(self.food, id: \.self) { pizza in
                //NavigationLink(destination: MovieDetailView(movieId: movie.id)) {
                PizzaView(food: pizza)
                }
                .buttonStyle(PlainButtonStyle())
            .padding(.bottom, 20)
                    //.padding(.leading, movie.id == self.movies.first!.id ? 16 : 0)
                    //.padding(.trailing, movie.id == self.movies.last!.id ? 16 : 0)
                }
        }
    }

struct PizzaCarouseView_Previews: PreviewProvider {
    static var previews: some View {
        PizzaCarouseView(food: FoodList_TMP.pizzas)
    }
}
