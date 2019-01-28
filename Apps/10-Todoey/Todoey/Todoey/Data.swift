//
//  Data.swift
//  Todoey
//
//  Created by Jubeen shah on 1/27/19.
//  Copyright © 2019 Jubeen shah. All rights reserved.
//

import Foundation
import RealmSwift


class Data: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var age:  Int    = 0
}
