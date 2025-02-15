//
//  ShopView.swift
//  MoaBa-iOS
//
//  Created by MAC on 2/16/25.
//

import SwiftUI

struct ShopView: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            Spacer()
                .frame(height: 40)
            
            LazyVGrid(columns: columns) {
                ForEach(0..<10) { _ in
                    ProductCell(imgUrl: "https://d1q3zw97enxzq2.cloudfront.net/images/K65_PLUS_WIRELESS_14_2.width-1000.format-webp.webp", title: "페이커 키보드", price: "10000", description: "동해물과백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세.동해물과백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세.동해물과백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세.")
                }
            }
        }
    }
}

#Preview {
    NavigationView {
        ShopView()
    }
}
