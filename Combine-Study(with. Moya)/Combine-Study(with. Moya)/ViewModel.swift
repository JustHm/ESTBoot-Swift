//
//  ViewModel.swift
//  Combine-Study(with. Moya)
//
//  Created by 안정흠 on 2/26/25.
//

import SwiftUI
import Moya
import CombineMoya
import Combine

@Observable
final class ViewModel: ObservableObject {
    private var bag = Set<AnyCancellable>()
    private var provider = MoyaProvider<DummyAPI>()
    var model = Model(message: "Message", author: "Author", authorProfile: "Profile")
    init() {
        getMessageFromAPI()
    }
    
    
    func getMessageFromAPI(){
        provider.request(.getMessage) { [weak self] response in
            switch response {
            case let .success(data):
                if let model = try? data.map(Model.self) {
                    self?.model = model
                }
            case let .failure(error):
                print(error)
            }
        }
    }
    
    func getMessageWithCombine() {
        provider.requestPublisher(.getMessage)
            .sink { completion in
                switch completion {
                case let .failure(error):
                    print("Failure: \(error.localizedDescription)")
                case .finished:
                    print("Complete")
                }
            } receiveValue: { response in
                guard let model = try? response.map(Model.self) else { return }
                self.model = model
            }
            .store(in: &bag)
    }
}
