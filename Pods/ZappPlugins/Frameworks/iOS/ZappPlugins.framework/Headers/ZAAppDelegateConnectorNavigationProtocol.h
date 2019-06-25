//
//  ZAAppDelegatelConnectorNavigationProtocol.h
//  ZappAppManager
//
//  Created by Alex Zchut on 02/07/2017.
//  Copyright © 2017 Applicaster Ltd. All rights reserved.
//

@import UIKit;
@class ZPNavigationBarBaseAdapter;
@protocol ZPAdapterNavBarProtocol;

typedef NS_ENUM(NSUInteger, ZAAppDelegateConnectorNavigationType) {
    push,
    present,
    asChild,
    pushNoNavigation
};

@protocol ZAAppDelegateConnectorNavigationProtocol<NSObject>

- (void)navigateToHomeScreen;
- (void)navigateToHomeOfflineScreen;

- (void)customizeNavigationWithModel:(id)model
                          dataSource:(id)dataSource
                   forViewController:(UIViewController *)viewControllerToUpdate;

- (BOOL)isNavigationBarRNScreenForcedHiddenForModel:(id)model
                                         dataSource:(id)dataSource;
- (UIViewController *) topmostModal;

/**
 Retrieve navigationbar height with status bar

 @return Returns: height on the navigation bar container including status bar
 */
- (CGFloat)navigationBarHeightPlusStatusBar;

- (UIViewController *) currentViewController;
- (UIViewController *) rootViewController;


/**
 Present a view controller on top of the current stack
 @param viewController - View controller to present
 @param presentationType - ZAAppDelegateConnectorNavigationType Presentation type enum
 @param animated - boolean stating if the presentation should be animated or not
 */
- (void)presentViewController:(UIViewController *)viewController
             presentationType:(ZAAppDelegateConnectorNavigationType)presentationType
                     animated:(BOOL)animated;

- (BOOL)isPreloadViewController:(UIViewController *)viewController;

@optional

/**
 Can be used for invoking actions on the root using the url schemes params
 For example: the root will navigate to a selected screen defined in the url scheme's params
 */
- (void)rootViewControllerPerformActionForUrlSchemeParams:(NSDictionary *)params;

@end
