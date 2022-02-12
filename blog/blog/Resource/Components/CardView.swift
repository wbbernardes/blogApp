//
//  CardView.swift
//  blog
//
//  Created by Wesley Brito Bernardes on 11/02/22.
//

import SwiftUI

struct CardView: View {
    let cardObject: News

    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text(cardObject.title)
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .foregroundColor(.white)
            }.padding(.leading, 20)
            .padding(.vertical, 10)
            Spacer()
            Image(systemName: cardObject.isFavorite ? "heart.fill" : "heart")
                .resizable()
                .frame(width: 24, height: 20)
                .foregroundColor(.white)
                .padding(.trailing, 16)
            
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .background(UIKit.Colors.cardBackground)
        .CardRadius()
        .padding(.all, 10)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let cardObject: News = News()
        CardView(cardObject: cardObject)
    }
}


