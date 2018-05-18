//
//  MFTagBarScrollView.h
//  Radio
//
//  Created by sparrow on 20/10/2016.
//  Copyright © 2016 qzone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MFTabProtocol.h"

@interface MFTagBarScrollView : UIScrollView

- (instancetype)initWithFrame:(CGRect)frame dataSource:(id<MFTabDataSource>)dataSource delegate:(id<MFTabDelegate>) delegate;

@property (nonatomic, weak, readonly) id<MFTabDataSource> tabDataSource;
@property (nonatomic, weak, readonly) id<MFTabDelegate> tabDelegate;
@property (assign, nonatomic) BOOL markViewScroll;//解决滑动bug

- (void)markViewScrollToContentRatio:(CGFloat)contentRatio;

- (void)markViewScrollToIndex:(NSInteger)index;

- (void)reloadHighlightToIndex:(NSInteger)index;

- (void)scrollTagToIndex:(NSUInteger)toIndex;

- (void)reloadTabBarTitleColor;

@end
