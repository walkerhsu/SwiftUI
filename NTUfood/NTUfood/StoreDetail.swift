//
//  StoreDetail.swift
//  NTUfood
//
//  Created by walker on 2021/9/8.
//

import SwiftUI

struct StoreDetail: View {
    var record : StoreInfo
    var body: some View {
        VStack(alignment: .leading) {
                    Image(record.image)
                        .resizable()
                        .scaledToFit()
                    Spacer()
                        .frame(height: 50)
                    VStack(alignment: .leading) {
                        DetailCell(icon: "restaurant_20pt", info: record.store)
                        DetailCell(icon: "food_banke_20pt", info: record.place)
                        DetailCell(icon: "location_20pt", info: record.address)
                        DetailCell(icon: "monetization_20pt", info: record.price)
                        DetailCell(icon: "ramen_dining_20pt", info: record.type)
                        DetailCell(icon: "menu_book_20pt", info: record.dishes)
                        DetailCell(icon: "menu_20pt", info: record.meat)
                        DetailCell(icon: "dinner_dining_20pt", info: record.staple)
                        DetailCell(icon: "query_builder_20pt", info: record.time)
                    }
                    Spacer()
                }
                .padding(8)
    }
}

struct DetailCell: View {
    let icon: String   // image icon
    let info: String    // info
    var body: some View {
        HStack {
            Image(icon)
            Text(info)
        }
    }
}

//struct StoreDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        StoreDetail()
//    }
//}
