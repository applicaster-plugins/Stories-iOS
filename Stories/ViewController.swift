//
//  ViewController
//  Stories
//
//  Created by Javier Casaudoumecq on 6/25/19.
//  Copyright © 2019 Javier Casaudoumecq. All rights reserved.
//

import UIKit
import StoriesPlugin
import ZappPlugins

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func createPluginButtonClicked(_ sender: Any) {
        let dict = Dictionary(dictionaryLiteral: ("foo", "bar"))
        if let model = ZPPluginManager.pluginModels()?.first {
            let pluginAdapter = FullScreenPlugin(pluginModel:model,
                                                 screenModel: ZLScreenModel(object: dict),
                                                 dataSourceModel: nil)
            if let vc = pluginAdapter?.createScreen() {
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }

}

