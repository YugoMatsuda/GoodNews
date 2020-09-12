//
//  NewsListTableViewController.swift
//  GoodNews
//
//  Created by Yugo Matsuda on 2020-09-12.
//  Copyright © 2020 Yugo Matsuda. All rights reserved.
//

import UIKit

class NewsListTableViewController: UITableViewController {

    private var articleListVM: ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
  
    }

    func setUp(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let url =  URL(string: "http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=3f05df85f9914c5bb0488e21a20ddcca")!
        Webservice().getArticle(url: url){ articles in
            if let articles = articles{
                self.articleListVM = ArticleListViewModel(articles: articles)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListVM == nil ? 0 :self.articleListVM.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM.numberOfRowsInSection(section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell",for: indexPath) as? ArticleTableViewCell else{
            fatalError("not found")
        }
        
       let articleVM =  self.articleListVM.articleAtIndex(indexPath.row)
        cell.titleLabel.text = articleVM.title
        cell.descriptionLabel.text = articleVM.description
        
        return cell

    }

}
