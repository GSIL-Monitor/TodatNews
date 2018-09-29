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
