//
//  Planet.swift
//  SolarSystem2
//
//  Created by Ben on 5/8/17.
//  Copyright © 2017 Ben. All rights reserved.
//

import Foundation

class Planet {
    
    private var _name: String!
    private var _planetID: Int!
    private var _description: String!
    private var _descriptionImageDetail: String!
    private var _surfaceDetail: String!
    private var _geologyDetail: String!
    
    
    var name: String {
        return _name
    }
    
    var planetID: Int {
        return _planetID
    }
    
    var description: String {
        return _description
    }
    
    var descriptionImageDetail: String {
        return _descriptionImageDetail
    }
    
    var surfaceDetail: String {
        return _surfaceDetail
    }
    
    var geologyDetail: String {
        return _geologyDetail
    }
    
    init(name: String, planetID: Int, description: String, descriotionImageDetail: String, surfaceDetail: String!, geologyDetail: String) {
        self._name = name
        self._planetID = planetID
        self._description = description
        self._descriptionImageDetail = descriotionImageDetail
        self._surfaceDetail = surfaceDetail
        self._geologyDetail = geologyDetail
    }

}
