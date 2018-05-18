//
//  MFMainTagView.h
//  Radio
//
//  Created by WealongCai on 15/12/10.
//  Copyright (c) 2015年 qzone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MFPageTagView : UIControl

@property (assign, nonatomic, readwrite) NSUInteger tagIndex;
@property (strong, nonatomic) UIColor *highlightedTitleColor;
@property (strong, nonatomic) UIColor *normalTitleColor;
@property (nonatomic, readonly) BOOL isHighlighted;

- (void)highlightTagView;
- (void)unhighlightTagView;

@end


@interface MFPageTagTitleView : MFPageTagView

@property (strong, nonatomic) UILabel *title;

@end
