//
//  DetailsView.swift
//  CatChecker
//
//  Created by Piotr Woźniak on 02/07/2022.
//

import SwiftUI

struct DetailsView: View {
    let cat: Element
    
    var body: some View {
        ScrollView {
            if cat.image?.url != nil {
                AsyncImage(url: URL(string: cat.image!.url!)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                    } else if phase.error != nil {
                        Color.red
                            .frame(width: 300, height: 300)
                    } else {
                        ProgressView()
                            .frame(width: 300, height: 300)
                    }
                }
            } else {
                Color.gray
                    .frame(width: 300, height: 300)
            }
            VStack(alignment: .leading) {
                if cat.name != nil {
                    Text(cat.name!)
                        .font(.headline.bold())
                }
                if cat.temperament != nil {
                    Text(cat.temperament!)
                        .font(.caption)
                }
                if cat.purpleDescription != nil {
                    Divider()
                    Text(cat.purpleDescription!)
                        .italic()
                    Divider()
                }
                HStack {
                    Text("Energy level")
                        .font(.headline.bold())
                    Spacer()
                    ForEach(1..<6) { number in
                        Image(systemName: "heart.fill")
                            .foregroundColor(number > cat.energyLevel! ? .gray : .blue)
                    }
                }
            }
        }
        .padding()
        .navigationTitle(cat.name != nil ? "Details about \(cat.name!)" : "")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(cat: Element.exampleOfBreed)
    }
}
