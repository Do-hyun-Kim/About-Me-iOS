//
//  AdvisoryPostList.swift
//  About-Me-iOS
//
//  Created by Hyeyeon Lee on 2021/05/06.
//

import Foundation

struct AdvisoryPostList: Codable {
    let user: Int
    let stage: Int
    let theme: String
    let answerLists: [AnswerList]
}

struct AnswerList: Codable {
    let level: Int
    let question: String
    let answer: String
}
