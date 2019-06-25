//
//  StoryPreviewModel.swift
//  Stories
//
//  Created by Javier Casaudoumecq on 6/24/19.
//  Copyright © 2019 Javier Casaudoumecq. All rights reserved.
//

import Foundation

class StoryPreviewModel: NSObject {
    
    //MARK:- iVars
    var stories: Stories?
    var handPickedStoryIndex: Int? //starts with(i)
    
    //MARK:- Init method
    init(_ stories: Stories, _ handPickedStoryIndex: Int) {
        self.stories = stories
        self.handPickedStoryIndex = handPickedStoryIndex
    }
    
    //MARK:- Functions
    func numberOfItemsInSection(_ section: Int) -> Int {
        if let count = stories?.count {
            return count
        }
        return 0
    }
    func cellForItemAtIndexPath(_ indexPath: IndexPath) -> Story? {
        guard let count = stories?.count else {return nil}
        if indexPath.item < count {
            return stories?.stories[indexPath.item]
        }else {
            fatalError("Stories Index mis-matched :(")
        }
    }
}
