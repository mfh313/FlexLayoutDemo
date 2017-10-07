//
//  MFCoverDropTagView.h
//  FlexLayoutDemo
//
//  Created by EEKA on 2017/10/7.
//  Copyright © 2017年 mafanghua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MFCoverDropTagView : UIControl

@property (assign, nonatomic, readwrite) NSUInteger tagIndex;
@property (strong, nonatomic) UIColor *highlightedTitleColor;
@property (strong, nonatomic) UIColor *highlightedBgColor;
@property (strong, nonatomic) UIColor *normalBGColor;
@property (strong, nonatomic) UIColor *normalTitleColor;
@property (nonatomic, readonly) BOOL isHighlighted;

- (void)highlightTagView;
- (void)unhighlightTagView;

@end

#pragma mark - MFCoverDropTagTitleView
@interface MFCoverDropTagTitleView : MFCoverDropTagView

@property (strong, nonatomic) UILabel *title;

@end
