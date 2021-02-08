//
//  ArtistsProvider.swift
//  WhoSings
//
//  Created by Matteo Vitolo on 07/02/2021.
//

import Foundation
import ReactiveSwift

class ArtistProvider {
    struct Answer {
        let name: String
        let right: Bool
    }
    
    let artists: MutableProperty<[Model.Artist]> = MutableProperty<[Model.Artist]>([])
    let artistsAreReady: MutableProperty<Bool> = MutableProperty<Bool>(false)
    
    private let apiClient: APIClient = ApiClientLocal()
 //   private let apiClient: APIClient = APIClientAlamofire()
    
    init() {
        apiClient.execute(API.ChartArtistsGet(), completion: { result in
            switch result {
                case .success(let s) :
                    self.artists.value = s.message
                        .body
                        .artistLists
                        .map {
                            $0.artist
                        }
            default:
                print("ArtistsProvider: Something went wrong")
                break
            }
            
        })
        
        artistsAreReady <~ artists.map { $0.count > 0 }
    }

    func random(winner: Int) -> [Answer]  {

        let a1 = artists.value[Int.random(in: 0...(artists.value.count - 1))]
        let a2 = artists.value[Int.random(in: 0...(artists.value.count - 1))]
        guard let a3 = artists.value
                .first(where: { $0.artistID == winner}) else { return [] }
            
        return [a1,a2,a3].map {
                Answer(name: $0.artistName, right: $0.artistID == winner)
            }
    }
}
