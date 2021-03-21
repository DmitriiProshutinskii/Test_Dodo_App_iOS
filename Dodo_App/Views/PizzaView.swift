//
//  PizzaView.swift
//  Dodo_App
//
//  Created by Физтех.Радио on 18.03.2021.
//

import SwiftUI

struct PizzaView: View {
    let food: Food
    @ObservedObject var imageLoader = ImageLoader()
    
    var body: some View {
        VStack{
            HStack{
                
                if self.imageLoader.image != nil {
                    Image(uiImage: self.imageLoader.image!)
                    .resizable()
                        .frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .aspectRatio(contentMode: .fill)
                }
                PizzaText(title: food.title, overview: food.overview, price: food.price)
            }
            .padding(.trailing, 16)
            .padding(.leading,10)
            .onAppear {
                self.imageLoader.loadImage(with: self.food.imageURL)
            }
            Divider()
        }   
    }
}

struct PizzaImage: View {
    var body: some View {
        Image("chizzi")
            .resizable()
            .frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .aspectRatio(contentMode: .fill)
    }
}

struct PizzaText: View {
    var title: String
    var overview: String
    var price: Int
    
    var body: some View {
        VStack{
            HStack{
                Text(title).bold().font(.headline).multilineTextAlignment(.leading)
                Spacer()
            }
            Text(overview)
                .font(.caption).foregroundColor(.gray).multilineTextAlignment(.leading)
            HStack{
                PizzaPriceView(price: price)
                Spacer()
            }
        }.frame(height: 150, alignment: .leading)
       
    }
    
    
}


struct PizzaPriceView: View {
    var price: Int
    
    var body: some View {
        ZStack{
            Rectangle().stroke(Color.orange, lineWidth: 4)
            Text("от \(price) руб.").font(.footnote).fontWeight(.light)
                .clipped()
        }.frame(width: 85, height:35, alignment: .center)
        .cornerRadius(4, antialiased: true)
    }
}

struct PizzaView_Previews: PreviewProvider {    
    static var previews: some View {
        PizzaView(food: Food(title: "Чиззи чеддер", overview: "Свежие листья салата айсберг, цыпленок, томаты черри, сыры чеддер и пармезан, моцарелла, соус альфредо, соус цезарь", price: 395, imageURL: URL(string: "https://dodopizza-a.akamaihd.net/static/Img/Products/e8611a418a46438d8a14fbe07fbfc051_292x292.jpeg")!))
    }
}
