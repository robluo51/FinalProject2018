//
//  API.swift
//  FinalProject2018
//
//  Created by PeterChen on 2018/7/5.
//  Copyright © 2018年 User02. All rights reserved.
//

import Foundation
class Decode {
    func getFIFAData(jsonData: Data) throws -> MatchResults {
        let decoder = JSONDecoder()
        let jsonResult = try decoder.decode(MatchResults.self, from: jsonData)
        for result in jsonResult.results {
            print(result.winner)
            print(result.homeTeamEvents)
        }
        return jsonResult
    }
}

class API {
    func getAPIData(API APIString: String, handler: @escaping (Data) -> ()) {
        let url =  URL(string: APIString)
        if url == nil {
            print("URL Error")
            return
        }
        let request = URLRequest(url: url!)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    //                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(MatchResults.self, from: data)
                    for result in response.results {
                        print(result.winner)
                    }
                    //                    print("JSON data: \(json)")
                    handler(data)
                } catch {
                    print("JSON Error, \(error)")
                }
            } else {
                print("Data Error")
            }
        }
        task.resume()
        
    }
}
