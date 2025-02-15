//
//  ProductCell.swift
//  MoaBa-iOS
//
//  Created by MAC on 2/16/25.
//

import SwiftUI

struct ProductCell: View {
    let imgUrl: String
    let title: String
    let price: String
    let description: String
    
    var body: some View {
        NavigationLink(destination: ProductDetailView(imgUrl: imgUrl, title: title, price: price, description: description)) {
            VStack(alignment: .leading, spacing: 0) {
                if let url = URL(string: imgUrl) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .frame(width: 180, height: 180)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    } placeholder: {
                        ProgressView()
                            .frame(width: 180, height: 180)
                    }
                } else {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 180, height: 180)
                        .foregroundStyle(.white)
                        .overlay {
                            ProgressView()
                        }
                }
                
                Text(title)
                    .mbFont(size: 14, weight: .medium, color: .black)
                    .padding(.top, 10)
                
                Text("\(price)원")
                    .mbFont(size: 20, weight: .medium, color: .black)
            }
        }
    }
}

#Preview {
    ProductCell(imgUrl: "https://d1q3zw97enxzq2.cloudfront.net/images/K65_PLUS_WIRELESS_14_2.width-1000.format-webp.webp", title: "페이커 키보드", price: "10000", description: "동해물과백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세.동해물과백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세.동해물과백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세.")
}
