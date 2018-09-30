//
//  SqliteManager.swift
//  TodayNews
//
//  Created by tupservice on 2018/9/29.
//  Copyright © 2018年 huawei. All rights reserved.
//

import Foundation
import SQLite
struct SqlManager {
    var database :Connection!
    init() {
        do {
            let path = NSHomeDirectory()+"/Documents/news.sqlite3"
            database = try Connection(path)
        } catch  {
            print(error)
        }
    }
}

struct MineTitleTable {
    let sqlManager = SqlManager()
    let minename = Table("minename")
    let id = Expression<Int64>("id")
    let category = Expression<String>("category")
    let web_url = Expression<String>("web_url")
    let flags = Expression<Bool>("flags")
    let name = Expression<String>("name")
    let tip_new = Expression<Bool>("tip_new")
    let default_add = Expression<Bool>("default_add")
    let concern_id = Expression<String>("concern_id")
    let type = Expression<Bool>("type")
    let icon_url = Expression<String>("icon_url")
    let isSelected = Expression<Bool>("isSelected")
    init() {
        do {
            try sqlManager.database.run(minename.create(ifNotExists: true, block: { t in
                t.column(id, primaryKey: true)
                t.column(category)
                t.column(web_url)
                t.column(flags)
                t.column(tip_new)
                t.column(default_add)
                t.column(concern_id)
                t.column(type)
                t.column(icon_url)
                t.column(name)
                t.column(isSelected)
            }))
        } catch  {
            print(error)
        }
    }
    func insert(_ titles :[OfflineModel])  {
      _ =  titles.map {
            insert($0)
        }
    }
    
    func insert(_ title:OfflineModel)  {
        if !exist(title) {
            let insert = minename.insert(category <- title.category, tip_new <- (title.tip_new), default_add <- (title.default_add), concern_id <- title.concern_id, web_url <- title.web_url, icon_url <- title.icon_url, flags <- (title.flags), type <- (title.type), name <- title.name, isSelected <- title.isSelected)
            do{
                try sqlManager.database.run(insert)
            }catch{
                print(error)
            }
        }
    }
    func exist(_ title:OfflineModel) -> Bool {
         let title = minename.filter(category == title.category)
        do {
            let count = try sqlManager.database.scalar(title.count)
            return count != 0
        } catch  {
            print(error)
        }
        return false
    }
    
    func getAll() -> [OfflineModel]{
        do {
            return try sqlManager.database.prepare(minename).flatMap({title  in
                OfflineModel(category: title[category], web_url: title[web_url], flags: title[flags], name: title[name], tip_new: title[tip_new], default_add: title[default_add], concern_id: title[concern_id], type: title[type], icon_url: title[icon_url], isSelected: title[isSelected])
            })
            
        } catch  {
            print(errno)
        }
        return []
    }
    
    func update(_ newsTitle :OfflineModel)  {
        do {
            let title = minename.filter(category == newsTitle.category)
            try sqlManager.database.run(title.update(isSelected <- newsTitle.isSelected))
        } catch  {
            print(error)
        }
    }
    
    

  
    
}
