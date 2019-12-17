//
//  AnimationView.swift
//  Landmarks
//
//  Created by jaeho on 2019/12/17.
//  Copyright © 2019 Northeast Electric Power University. All rights reserved.
//

import SwiftUI

struct AnimationView: View {
    
    @State private var showDetail = false
    
    var body: some View {
        Button(action: {
            withAnimation {
                self.showDetail = !self.showDetail
            }
        }) {
            Image(systemName: "chevron.right.circle").rotationEffect(.degrees(showDetail ? 90 : 0)).scaleEffect(showDetail ? 1.5 : 1).padding()
        }
    }
}

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView()
    }
}
