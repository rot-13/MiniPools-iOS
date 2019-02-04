//
//  HomeModel.swift
//  mini-pools-ios
//
//  Created by Davidson, Shay on 31/01/2019.
//  Copyright © 2019 Kaplún, Sebi. All rights reserved.
//

struct HomeModel {
  var pools: [PoolModel]
  var filter: String? = nil
  
  init(pools: [PoolModel], filter: String? = nil) {
    self.pools = pools
    self.filter = filter
  }
  
  func getPoolById(_ id: Int) -> PoolModel? {
    return self.pools.first { $0.id == id }
  }
  
  mutating func setFilter(_ filter: String) {
    self.filter = (filter.isEmpty ) ? nil : filter
  }
  
  var filteredPools: [PoolModel] {
    if let filter = self.filter {
      return self.pools.filter { $0.name!.lowercased().contains(filter.lowercased()) }
    } else {
      return self.pools
    }
  }
}