//
//  CircleImage.swift
//  Landmarks
//
//  Created by jaeho on 2019/12/17.
//  Copyright © 2019 Northeast Electric Power University. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("ymy").clipShape(Circle()).overlay(Circle().stroke(Color.white, lineWidth: 4)).shadow(radius: 10)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
