//
//  StoryPreviewView.swift
//  Stories
//
//  Created by Javier Casaudoumecq on 6/24/19.
//  Copyright © 2019 Javier Casaudoumecq. All rights reserved.
//

import UIKit

class StoryPreviewView: UIView {
    
    //MARK:- iVars
    var layoutType: layoutType?
    /**Layout Animate options(ie.choose which kinda animation you want!)*/
    lazy var layoutAnimator: (LayoutAttributesAnimator, Bool, Int, Int) = (layoutType!.animator, true, 1, 1)
    lazy var snapsCollectionViewFlowLayout: AnimatedCollectionViewLayout = {
        let flowLayout = AnimatedCollectionViewLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.animator = layoutAnimator.0
        flowLayout.minimumLineSpacing = 0.0
        flowLayout.minimumInteritemSpacing = 0.0
        flowLayout.sectionInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        return flowLayout
    }()
    lazy var snapsCollectionView: UICollectionView! = {
        let cv = UICollectionView.init(frame: CGRect(x: 0,y: 0,width: UIScreen.main.bounds.width,height:  UIScreen.main.bounds.height), collectionViewLayout: snapsCollectionViewFlowLayout)
        cv.backgroundColor = .black
        cv.showsVerticalScrollIndicator = false
        cv.showsHorizontalScrollIndicator = false
        cv.register(StoryPreviewCell.self, forCellWithReuseIdentifier: StoryPreviewCell.reuseIdentifier)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.isPagingEnabled = true
        cv.isPrefetchingEnabled = false
        cv.collectionViewLayout = snapsCollectionViewFlowLayout
        return cv
    }()
    
    //MARK:- Overridden functions
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    convenience init(layoutType: layoutType) {
        self.init()
        self.layoutType = layoutType
        createUIElements()
        installLayoutConstraints()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - Private functions
    private func createUIElements(){
        backgroundColor = .black
        addSubview(snapsCollectionView)
    }
    private func installLayoutConstraints(){
        //Setting constraints for snapsCollectionview
        NSLayoutConstraint.activate([
            leftAnchor.constraint(equalTo: snapsCollectionView.leftAnchor),
            topAnchor.constraint(equalTo: snapsCollectionView.topAnchor),
            snapsCollectionView.rightAnchor.constraint(equalTo: rightAnchor),
            snapsCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)])
    }
}
