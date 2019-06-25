//
//  ZappStoriesAdapter
//  Stories
//
//  Created by Javier Casaudoumecq on 6/25/19.
//  Copyright © 2019 Javier Casaudoumecq. All rights reserved.
//

import Foundation
import ZappPlugins

@objc public class ZappStoriesAdapter: NSObject, ZPPluggableScreenProtocol, ZPAppLoadingHookProtocol {
    /**
        Full documentation for Screen plugins can be found at https://developer.applicaster.com/ui-builder/ios/ScreenPlugin.html.

        The ZPPluggableScreenProtocol provides a simple initialization for your plugin.
        
        The interface provides 3 parameters to the plugin:
        pluginModel- Plugin Model itself will be passed in any case.
        screenModel- ScreenModel that connected to your plugin.
        dataSourceModel` - Data source of your screen plugin (optional).
    */

    var pluginModel: ZPPluginModel?
    var screenModel: ZLScreenModel?
    var dataSourceModel: NSObject?
    
    required public init?(pluginModel: ZPPluginModel, screenModel: ZLScreenModel, dataSourceModel: NSObject?) {
        super.init()
        self.pluginModel = pluginModel
        self.screenModel = screenModel
        self.dataSourceModel = dataSourceModel
    }
    
    public var screenPluginDelegate: ZPPlugableScreenDelegate?
    
    public func createScreen() -> UIViewController {
        // Make sure to replace <MyViewController> with your View Controller name.
        let viewController = <MyViewController>.init(nibName: nil, bundle: Bundle(for: <MyViewController>.self))        
        return viewController
    }

    /**
        Implement this method if you need the plugin to run code/APIs on the application launching time.
        In case you are implementing the executeOnLaunch method please make sure that you are also declare that on the plugin_manifest.json.
        You can do that by setting the "require_startup_execution" to true.

        The application lifecycle will wait until you call the completion.
    */
    @objc public func executeOnLaunch(completion: (() -> Void)?) {
        completion?()
    
    }
}