//
//  ItemRow.swift
//  SwiftUIDemo
//
//  Created by Pratik Thakare on 29/08/20.
//  Copyright © 2020 PT GO-JEK INDONESIA. All rights reserved.
//

import SwiftUI
struct ItemRow: View {
	var item: MenuItem
	static let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]
	var body: some View {
		HStack (alignment: .center, spacing: 10) {
			Image(item.thumbnailImage)
				.clipShape(Circle())
				.overlay(Circle().stroke(Color.gray, lineWidth: 2))
			
			VStack(alignment: .leading, spacing: 5) {
				Text(item.name).font(.headline)
				Text(String("$\(item.price)"))
				
			}
			Spacer()
			ForEach(item.restrictions, id: \.self) { restriction in
				Text(restriction)
				.font(.caption)
				.fontWeight(.black)
				.padding(5)
				.background(Self.colors[restriction, default: .black])
				.clipShape(Circle())
				.foregroundColor(.white)
			}
			
		}
	}
	
}

struct ItemRow_Previews: PreviewProvider {
	static var previews: some View {
		ItemRow(item: MenuItem.example)
	}
}
