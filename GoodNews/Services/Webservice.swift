//
//  Webservice.swift
//  GoodNews
//
//  Created by Yugo Matsuda on 2020-09-12.
//  Copyright © 2020 Yugo Matsuda. All rights reserved.
//

import Foundation


class Webservice {
    
    
    func getArticle(url:URL,completion :@escaping([Article]?) -> ()){
        URLSession.shared.dataTask(with: url){ data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data{
                do {
                    let articleList =  try JSONDecoder().decode(ArticleList.self, from: data)
                    print(articleList.articles)
                    completion(articleList.articles)
                } catch {
                    print(error.localizedDescription)
                }
                
            }
            
        }.resume()
        
    }
}
