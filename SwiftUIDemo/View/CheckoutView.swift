//
//  CheckoutView.swift
//  SwiftUIDemo
//
//  Created by Pratik Thakare on 29/08/20.
//  Copyright © 2020 PT GO-JEK INDONESIA. All rights reserved.
//

import SwiftUI
struct CheckoutView: View {
	@EnvironmentObject var order: Order
	static let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
	static let tipAmounts = [10, 15, 20, 25, 0]
	@State private var tipAmount = 0
	@State private var paymentType = 0
	@State private var addLoyaltyDetails = false
	@State private var loyaltyNumber = ""
	@State private var showingPaymentAlert = false
	
	var totalPrice: Double {
		let total = Double(order.total)
		let tipValue = total / 100 * Double(Self.tipAmounts[tipAmount])
		return total + tipValue
	}
	var body: some View {
		
		Form {
			Section {
				Picker("Percentage:", selection: $tipAmount) {
					ForEach(0 ..< Self.tipAmounts.count) {
						Text("\(Self.tipAmounts[$0])%")
					}
				}.pickerStyle(SegmentedPickerStyle())
				
				Picker("How do you want to pay?", selection: $paymentType) {
					ForEach(0 ..< Self.paymentTypes.count) {
						Text(Self.paymentTypes[$0])
					}
				}
				
				if paymentType == 2 {
					Toggle(isOn: $addLoyaltyDetails.animation()) {
						Text("Add iDine loyalty card")
					}
				}
				
				if addLoyaltyDetails {
					TextField("Enter your iDine ID", text: $loyaltyNumber)
				}
				
				Section(header: Text("TOTAL: $\(totalPrice, specifier: "%.2f")")) {
					Button("Confirm order") {
						self.showingPaymentAlert.toggle()
					}
				}
			}
			.navigationBarTitle(Text("Payment"), displayMode: .inline)
		}.alert(isPresented: $showingPaymentAlert) { () -> Alert in
			Alert(title: Text("Order confirmed"),
				  message: Text("Your total was $\(totalPrice, specifier: "%.2f") – thank you!"),
				  dismissButton: .default(Text("OK")))
		}
	}
	
}
struct CheckoutView_Previews: PreviewProvider {
    static let order = Order()

    static var previews: some View {
        CheckoutView().environmentObject(order)
    }
}
