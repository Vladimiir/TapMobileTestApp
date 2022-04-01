//
//  YoutubeService.swift
//  TapMobileTestApp
//
//  Created by Стасенко Владимир on 01.04.2022.
//

import Foundation

struct YoutubeService {
    
    private var urlSession = URLSession.shared
    
    func searchVideos(with text: String,
                      completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: "https://www.youtube.com/results?search_query=\(text)") else { return }
        
        var request = URLRequest(url: url,
                                 cachePolicy: .reloadIgnoringLocalCacheData)
        
        request.httpMethod = "GET"
        
        let task = urlSession.dataTask(with: request,
                                       completionHandler: { data, response, error in
            if let responceData = data,
               let responceString = String(data: responceData, encoding: .utf8) {
                print(responceString)
                
                // Don't know how to get responce with correct values without using API....
            }
        })
        
        task.resume()
    }
}
