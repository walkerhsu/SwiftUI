//
//  ContentView.swift
//  NTUfood
//
//  Created by walker on 2021/9/8.
//

import SwiftUI

struct ContentView: View {
    var records : [StoreInfo] = []
    var body: some View {
        NavigationView {
            List(records) { record in
                StoreCell(record : record)
//                    Image(record.image)
//                        .resizable()
//                        .frame(width: 40.0, height: 40.0)
//                        .cornerRadius(20.0)
//                    VStack(alignment: .leading) {
//                        Text(record.store)
//                        Text(record.address)
//                            .font(.subheadline)
//                            .foregroundColor(Color.gray)
//                    }
            }
            .navigationBarTitle(Text("NTU Foods"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct StoreCell: View {
    let record: StoreInfo
    var body: some View {
        NavigationLink(destination: StoreDetail(record: record)) {
            Image(record.image)
                .resizable()
                .frame(width: 40.0, height: 40.0)
                .cornerRadius(20.0)
            VStack(alignment: .leading) {
                Text(record.store)
                Text(record.address)
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
            }
        }
    }
}

