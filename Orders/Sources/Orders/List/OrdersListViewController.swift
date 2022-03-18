//
//  OrdersListViewController.swift
//  
//
//  Created by Errol Cheong on 2022-03-16.
//

import SwiftUI

struct OrdersList: View {
    let viewModel: OrdersListViewModel
    init(_ viewModel: OrdersListViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        VStack(content: {
            Text("Orders").font(.system(size: 40)).padding()
            Button("Show Settings") {
                viewModel.showSettings()
            }
        })
    }
}
