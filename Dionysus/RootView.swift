//
//  RootView.swift
//  Dionysus
//
//  Created by Ginny Huang on 1/11/20.
//  Copyright © 2020 Ginny Huang. All rights reserved.
//

import SwiftUI
import UIKit

struct RootView: View {
    @ObservedObject var state: AppState
    let statusBarHeight : CGFloat
 
    var body: some View {
        TabBar([
            TabBar.Tab(
                view: SearchView(state: state, statusBarHeight: statusBarHeight),
                barItem: UITabBarItem(
                    title: "Search",
                    image: UIImage(systemName: "magnifyingglass"),
                    tag: 0
                )
            ),
            TabBar.Tab(
                view: VStack{
                    Text("About Author")
                    Spacer()
                },
                barItem: UITabBarItem(
                    title: "About",
                    image: UIImage(systemName: "info.circle"),
                    tag: 2
                )
            )
        ])
        /**Text("Settings...")
            .font(.title)
            .tabItem {
                VStack {
                    Image(systemName: "gear")
                    Text("Settings")
                }
            }
            .tag(1)
        }*/
    }
}

let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
let statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 20
let previewState = AppState()
struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(state: previewState, statusBarHeight: statusBarHeight)
        //.previewDevice(PreviewDevice(rawValue: "iPhone 8"))
    }
}
