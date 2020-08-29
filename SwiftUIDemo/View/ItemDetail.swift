//
//  ItemDetail.swift
//  SwiftUIDemo
//
//  Created by Pratik Thakare on 29/08/20.
//  Copyright © 2020 PT GO-JEK INDONESIA. All rights reserved.
//

import SwiftUI

struct ItemDetail: View {
	var item: MenuItem
	@EnvironmentObject var order: Order
	var body: some View {
		VStack {
			ZStack(alignment: .bottomTrailing)  {
				Image(item.mainImage)
				.padding()
				Text(item.photoCredit)
					.padding(8)
					.background(Color.black)
					.font(.caption)
					.foregroundColor(.white)
				    .cornerRadius(16)
					.offset(x: -50, y: -20)
			}
            Text(item.description)
				.padding()
			Button("Order This") { self.order.add(item: self.item)}
				.font(.headline)
				.padding(10)
			Spacer()
		}
        .navigationBarTitle(Text(item.name), displayMode: .inline)
	}
	
	
}

struct ItemDetail_Previews: PreviewProvider {
	static let order = Order()
	static var previews: some View {
		ItemDetail(item: MenuItem.example).environmentObject(order)
	}
}
