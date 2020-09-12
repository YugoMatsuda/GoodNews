//
//  Article.swift
//  GoodNews
//
//  Created by Yugo Matsuda on 2020-09-12.
//  Copyright © 2020 Yugo Matsuda. All rights reserved.
//

import Foundation

struct ArticleList:Decodable {
    
    let articles :[Article]
}

struct Article:Decodable{
    let title: String?
    let description: String?
    
}
