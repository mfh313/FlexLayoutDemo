//
//  MFCoverDropView.h
//  FlexLayoutDemo
//
//  Created by EEKA on 2017/10/7.
//  Copyright © 2017年 mafanghua. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MFCoverDropViewDataSource <NSObject>

@required
- (CGPoint)innerMenuStartOrigin;
- (NSInteger)numberOfMenu;
- (NSString *)titleForIndex:(NSInteger)index;

@optional
- (CGFloat)innerMenuWidth;
- (CGFloat)innerMenuItemHeight;
- (CGFloat)innerMenuUpArrowOffSetX;
- (UIColor *)titleColorForIndex:(NSInteger)index;
- (UIColor *)titleHighlightColorForIndex:(NSInteger)index;
- (UIColor *)backgroundColorForIndex:(NSInteger)index;
- (UIColor *)backgroundColorHighlightColorForIndex:(NSInteger)index;

@end


@protocol MFCoverDropViewDelegate <NSObject>

@optional
- (void)didSelectDropMenuIndex:(NSInteger)index;

@end

@interface MFCoverDropView : UIControl

@property (nonatomic,weak) id<MFCoverDropViewDataSource> m_dataSource;
@property (nonatomic,weak) id<MFCoverDropViewDelegate> m_delegate;

-(void)layoutMenuView;
-(void)reloadHighlightToIndex:(NSInteger)index;

@end
