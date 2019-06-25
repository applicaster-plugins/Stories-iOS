//
//  HomeViewModel.swift
//  Stories
//
//  Created by Javier Casaudoumecq on 6/25/19.
//  Copyright © 2019 Javier Casaudoumecq. All rights reserved.
//

import Foundation

struct HomeViewModel {
    
    //MARK: - iVars
    //Keep it Immutable! don't get Dirty :P
    private let stories: Stories? = {
        do {
            return try IGMockLoader.loadMockFile(named: "stories.json", bundle: .main)
        }catch let e as MockLoaderError {
            debugPrint(e.description)
        }catch{
            debugPrint("could not read Mock json file :(")
        }
        return nil
    }()
    
    //MARK: - Public functions
    public func getStories() -> Stories? {
        return stories
    }
    public func numberOfItemsInSection(_ section:Int) -> Int {
        if let count = stories?.count {
            return count + 1 // Add Story cell
        }
        return 1
    }
    public func cellForItemAt(indexPath:IndexPath) -> Story? {
        return stories?.stories[indexPath.row-1]
    }
    
}
