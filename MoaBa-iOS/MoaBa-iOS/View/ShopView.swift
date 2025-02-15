//
//  ShopView.swift
//  MoaBa-iOS
//
//  Created by MAC on 2/16/25.
//

import SwiftUI

struct ShopView: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    @StateObject var viewModel = ShopViewModel()
    
    var body: some View {
        ScrollView {
            Spacer()
                .frame(height: 40)
            
            LazyVGrid(columns: columns) {
                ForEach(viewModel.productResponses, id: \.idx) { product in
                    ProductCell(
                        imgUrl: product.img,
                        title: product.title,
                        price: "\(product.price)",
                        description: product.body
                    )
                }
            }
        }
        .onAppear {
            viewModel.getProducts()
        }
    }
}

#Preview {
    NavigationView {
        ShopView()
    }
}
