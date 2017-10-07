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
- (CGPoint)innerMenuUPArrowOffSetX;

@end


@protocol MFCoverDropViewDelegate <NSObject>
@optional
-(void)didSelectDropMenuIndex:(NSInteger)index;

@end

@interface MFCoverDropView : UIView

@property (nonatomic,weak) id<MFCoverDropViewDataSource> m_dataSource;
@property (nonatomic,weak) id<MFCoverDropViewDelegate> m_delegate;

@end
