//
//  MFPageProtocol.h
//  Example
//
//  Created by sparrow on 30/07/2017.
//  Copyright © 2017 tencent. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class MFPageController;
@protocol MFPageControllerDelegate <NSObject>

@optional

//交互切换回调
- (void)pageviewController:(MFPageController*)pageController willTransitionFromVC:(UIViewController *)fromVC toViewController:(UIViewController *)toVC;
- (void)pageviewController:(MFPageController*)pageController didTransitionFromVC:(UIViewController *)fromVC toViewController:(UIViewController *)toVC;
//非交互切换回调
- (void)pageviewController:(MFPageController*)pageController willLeaveFromVC:(UIViewController *)fromVC toViewController:(UIViewController *)toVC;
- (void)pageviewController:(MFPageController*)pageController didLeaveFromVC:(UIViewController *)fromVC toViewController:(UIViewController *)toVC;

//横向滑动回调
- (void)scrollViewContentOffsetWithRatio:(CGFloat)ratio draging:(BOOL)draging;

//垂直滑动的回调
- (void)scrollWithPageOffset:(CGFloat)realOffset index:(NSInteger)index;

- (void)willChangeInit;//针对初始化.

- (BOOL)cannotScrollWithPageOffset;

@end

@protocol MFPageControllerDataSource <NSObject>
@required
- (UIViewController *)controllerAtIndex:(NSInteger)index;
- (NSInteger)numberOfControllers;
- (CGRect)preferPageFrame;//默认情况下是整屏幕.通常情况下，cover在最上面 tab在中间 page在下面的情况不用设这个frame

@optional
- (CGFloat)pageTopAtIndex:(NSInteger)index;//用于设子controller的scrollview的 inset
- (UIScreenEdgePanGestureRecognizer *)screenEdgePanGestureRecognizer;//解决侧滑失效的问题
- (BOOL)isPreLoad;//交互切换的时候 是否预加载

- (BOOL)isSubPageCanScrollForIndex:(NSInteger)index;//表示这个页面是否可用


@end


//如ChildController实现了这个协议，表示Tab和Cover会跟随Page纵向滑动
@protocol MFPageSubControllerDataSource <NSObject>

@optional
- (UIScrollView *)preferScrollView;//子controller需要实现这个方法,如果需要cover跟着上下滑动

@end
