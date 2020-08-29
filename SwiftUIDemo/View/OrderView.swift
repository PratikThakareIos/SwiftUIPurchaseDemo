//
//  OrderView.swift
//  SwiftUIDemo
//
//  Created by Pratik Thakare on 29/08/20.
//  Copyright © 2020 PT GO-JEK INDONESIA. All rights reserved.
//

import SwiftUI
struct OrderView : View {
    @EnvironmentObject var order: Order

    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(order.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }.onDelete(perform: deleteItems)
                }

                Section {
                    NavigationLink(destination: CheckoutView()) {
                        Text("Place Order")
                    }
				}.disabled(order.items.isEmpty)
            }
            .navigationBarTitle("Order")
			.navigationBarItems(trailing: EditButton())
            .listStyle(GroupedListStyle())
        }
    }
	
	func deleteItems(at offsets: IndexSet) {
		order.items.remove(atOffsets: offsets)
	}
}

struct OrderView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        OrderView().environmentObject(order)
    }
}
