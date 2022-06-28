//
//  StopView.swift
//  Excuses
//
//  Created by Aleksandra Lazarevic on 24.6.22..
//

import SwiftUI

struct StopView: View {
    var body: some View {
            Image("nova_proba").resizable()
                .aspectRatio(contentMode: .fit).padding(EdgeInsets(top: 20, leading: 20, bottom: 30, trailing: 0))
    }
}

struct StopView_Previews: PreviewProvider {
    static var previews: some View {
        StopView()
    }
}
