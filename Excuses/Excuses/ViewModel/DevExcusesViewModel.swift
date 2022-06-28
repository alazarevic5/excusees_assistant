//
//  DevExcuses.swift
//  Excuses
//
//  Created by Aleksandra Lazarevic on 25.6.22..
//

import Foundation
import Combine

class DevExcusesViewModel: ObservableObject {
    
    private var baseURL = "https://api.devexcus.es/"
    private var task: AnyCancellable?
    
    @Published var excuse: DevExcuse = DevExcuse(id: "", text: "---")
    
    func getDevExcuse() {

        task = URLSession.shared.dataTaskPublisher(for: URL(string: baseURL)!)
            .map { $0.data }
            .decode(type: DevExcuse.self, decoder: JSONDecoder())
            .replaceError(with: DevExcuse(id: "", text: "..."))
            .eraseToAnyPublisher()
            .receive(on: RunLoop.main)
            .assign(to: \DevExcusesViewModel.excuse, on: self)
        
        print(excuse)
    }
}
