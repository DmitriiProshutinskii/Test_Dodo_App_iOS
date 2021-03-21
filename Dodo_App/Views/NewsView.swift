//
//  NewsView.swift
//  Dodo_App
//
//  Created by Физтех.Радио on 19.03.2021.
//

import SwiftUI

struct NewsView: View {
    
    var newsImageNames = ["first", "second", "third"]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 16) {
                ForEach(newsImageNames, id: \.self) { news in
                    //NavigationLink(destination: MovieDetailView(movieId: movie.id)) {
                        NewsBackdropCard(news: news)
                            .frame(width: 300, height: 120)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding(.leading,  -5)
                }
            .padding(.leading, 16)
            }
        }
    }

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
