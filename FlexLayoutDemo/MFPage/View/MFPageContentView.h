//
//  MFPageContentView.h
//  Radio
//
//  Created by sparrow on 09/02/2017.
//  Copyright © 2017 qzone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MFPageProtocol.h"

@interface MFPageContentView : UIScrollView<UIScrollViewDelegate>

- (CGRect)calcVisibleViewControllerFrameWithIndex:(NSInteger)index;
- (CGPoint)calOffsetWithIndex:(NSInteger)index;
- (NSInteger)calcIndex;

- (void)setItem:(id<MFPageControllerDataSource>)item;

@end
