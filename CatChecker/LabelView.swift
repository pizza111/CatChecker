//
//  LabelView.swift
//  CatChecker
//
//  Created by Piotr Woźniak on 02/07/2022.
//

import SwiftUI

struct LabelView: View {
    let cat: Element
    
    var body: some View {
        HStack {
            if cat.image?.url != nil {
                AsyncImage(url: URL(string: cat.image!.url!)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .clipped()
                    } else if phase.error != nil {
                        Color.red
                            .frame(width: 100, height: 100)
                    } else {
                        ProgressView()
                            .frame(width: 100, height: 100)
                    }
                }
            } else {
                Color.gray
                    .frame(width: 100, height: 100)
            }
            VStack(alignment: .leading) {
                Text(cat.name ?? "")
                    .font(.headline.bold())
                Text(cat.temperament ?? "")
                    .italic()
            }
        }
    }
}

struct LabelView_Previews: PreviewProvider {
    static var previews: some View {
        LabelView(cat: Element.exampleOfBreed)
    }
}
