//
//  AppView.swift
//  SwiftUIDemo
//
//  Created by Pratik Thakare on 29/08/20.
//  Copyright © 2020 PT GO-JEK INDONESIA. All rights reserved.
//

import SwiftUI
struct AppView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Menu")
                }

            OrderView()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("Order")
                }
        }
    }
}
struct AppView_Previews: PreviewProvider {
    static let order = Order()

    static var previews: some View {
        AppView().environmentObject(order)
    }
}
