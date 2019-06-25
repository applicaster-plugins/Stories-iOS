//
//  ZappStoriesAdapter
//  Stories
//
//  Created by Javier Casaudoumecq on 6/24/19.
//  Copyright © 2019 Javier Casaudoumecq. All rights reserved.
//

import Foundation
import ZappPlugins

@objc public class ZappStoriesAdapter: NSObject, ZPPluggableScreenProtocol {
    public var configurationJSON: NSDictionary?
    
    var pluginModel: ZPPluginModel?
    var screenModel: ZLScreenModel?
    var dataSourceModel: NSObject?
    
    var viewModel: HomeViewModel = HomeViewModel()
    
    
    required public init?(pluginModel: ZPPluginModel, screenModel: ZLScreenModel, dataSourceModel: NSObject?) {
        super.init()
        self.pluginModel = pluginModel
        self.screenModel = screenModel
        self.dataSourceModel = dataSourceModel
    }
    
    public var screenPluginDelegate: ZPPlugableScreenDelegate?
    
    public func createScreen() -> UIViewController {
        if let stories = self.viewModel.getStories(), let stories_copy = try? stories.copy() {
            let storyViewController = StoryPreviewController.init(stories: stories_copy, handPickedStoryIndex: 0)
            return storyViewController
        }
        
        return UIViewController()
    }
    
    @objc public func executeOnLaunch(completion: (() -> Void)?) {
        completion?()
    }
}
