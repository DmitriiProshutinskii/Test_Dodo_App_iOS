//
//  NewsBackdropCard.swift
//  Dodo_App
//
//  Created by Физтех.Радио on 19.03.2021.
//

import SwiftUI

struct NewsBackdropCard: View {
    
    let news: String
    @ObservedObject var imageLoader = ImageLoader()
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                Image(news).resizable()
//                if self.imageLoader.image != nil {
//                    self.imageLoader.image!
//                    .resizable()
//                }
            }
            .aspectRatio(8/3, contentMode: .fit)
            .cornerRadius(15)
            .shadow(radius: 4)
            
            //Text(movie.title)
        }
        .lineLimit(1)
    }
}


struct NewsBackdropCard_Previews: PreviewProvider {
    static var previews: some View {
        NewsBackdropCard(news: "first")
    }
}
