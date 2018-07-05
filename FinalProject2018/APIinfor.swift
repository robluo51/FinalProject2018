//
//  APIinfor.swift
//  FinalProject2018
//
//  Created by User02 on 2018/6/29.
//  Copyright © 2018年 User02. All rights reserved.
//

import Foundation

import Foundation

struct HomeTeam: Codable{
    var country: String
    var code: String
    var goals: Int
}
struct AwayTeam: Codable{
    var country: String
    var code: String
    var goals: Int
}

struct TeamEvents: Codable{
    var typeOfEvent: String
    var player: String
    var time: String
    enum CodingKeys: String, CodingKey {
        case typeOfEvent = "type_of_event"
        case player, time
    }
}

struct MatchResult: Codable {
    let location: String
    let status: String
    let dateTime: String
    let winner: String
    let homeTeam: HomeTeam
    let awayTeam: AwayTeam
    let homeTeamEvents: [TeamEvents]
    let awayTeamEvents: [TeamEvents]
    
    enum CodingKeys: String, CodingKey {
        case location, status, winner
        case dateTime = "datetime"
        case homeTeam = "home_team"
        case awayTeam = "away_team"
        case homeTeamEvents = "home_team_events"
        case awayTeamEvents = "away_team_events"
    }
    
}
struct MatchResults: Codable {
    var results: [MatchResult]
    init(from decoder: Decoder) throws {
        var result = [MatchResult]()
        var container = try decoder.unkeyedContainer()
        while !container.isAtEnd {
            if let route = try? container.decode(MatchResult.self) {
                result.append(route)
            } else {
                _ = try? container.decode(DummyCodable.self)
            }
        }
        self.results = result
    }
}
private struct DummyCodable: Codable {}


