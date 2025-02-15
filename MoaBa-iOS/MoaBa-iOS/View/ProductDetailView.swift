//
//  ProductDetailView.swift
//  MoaBa-iOS
//
//  Created by MAC on 2/16/25.
//

import SwiftUI

struct ProductDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let imgUrl: String
    let title: String
    let price: String
    let description: String
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    AsyncImage(url: URL(string: imgUrl)!) { image in
                        image.image?
                            .resizable()
                            .frame(width: .infinity, height: 393)
                    }
                    
                    Group {
                        Text("판매가")
                            .mbFont(size: 14, weight: .medium, color: .black)
                            .padding(.vertical)
                        
                        Text("\(price)원")
                            .mbFont(size: 20, weight: .semiBold, color: .black)
                        
                        Text(title)
                            .mbFont(size: 16, weight: .medium, color: .black)
                            .padding(.bottom)
                        
                        Text(description)
                            .multilineTextAlignment(.leading)
                            .mbFont(size: 14, weight: .medium, color: .black)
                    }
                    .padding(.horizontal, 20)
                }
            }
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                            .foregroundStyle(.black)
                    }
                }
            }
            
            VStack {
                Spacer()
                
                RoundedRectangle(cornerRadius: 13)
                    .frame(width: .infinity, height: 52)
                    .foregroundStyle(Color.MoaBa.purple)
                    .overlay {
                        MBButton(text: "구매하기") {
                            
                        }
                    }
            }
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    NavigationView {
        ProductDetailView(imgUrl: "https://d1q3zw97enxzq2.cloudfront.net/images/K65_PLUS_WIRELESS_14_2.width-1000.format-webp.webp", title: "페이커 키보드", price: "10000", description: "동해물과백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세.동해물과백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세.동해물과백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세.")
    }
}
