//
//  MFCoverDropView.m
//  FlexLayoutDemo
//
//  Created by EEKA on 2017/10/7.
//  Copyright © 2017年 mafanghua. All rights reserved.
//

#import "MFCoverDropView.h"

@interface MFCoverDropView ()
{
    UIView *m_innerUpView;
    UIView *m_innerView;
}

@end

@implementation MFCoverDropView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    
    return self;
}

-(void)initInnerView
{
    CGFloat innerWidth = 240;
    if ([self.m_dataSource respondsToSelector:@selector(innerMenuWidth)]) {
        innerWidth = [self.m_dataSource innerMenuWidth];
    }
    
    CGFloat innerHeight = 0;
    if ([self.m_dataSource respondsToSelector:@selector(innerMenuItemHeight)]) {
        innerHeight = [self.m_dataSource numberOfMenu] * [self.m_dataSource innerMenuItemHeight];
    }
    
    CGPoint menuStartOrigin = CGPointMake(self.center.x, self.center.y - innerHeight - [self menuUpViewHeight]);
    if ([self.m_dataSource respondsToSelector:@selector(innerMenuStartOrigin)]) {
        menuStartOrigin = [self.m_dataSource innerMenuStartOrigin];
    }
    
    m_innerView = [[UIView alloc] initWithFrame:CGRectZero];
    m_innerView.backgroundColor = [UIColor redColor];
    CGFloat innerRealHeight = innerHeight + [self menuUpViewHeight];
    m_innerView.frame = CGRectMake(menuStartOrigin.x - innerWidth / 2, menuStartOrigin.y, innerWidth,innerRealHeight);
    [self addSubview:m_innerView];
    
    [self initMenuUpView];
}

-(CGFloat)menuUpViewHeight
{
    return 9;
}

-(void)initMenuUpView
{
    m_innerUpView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(m_innerView.frame), [self menuUpViewHeight])];
    m_innerUpView.backgroundColor = [UIColor blueColor];
    m_innerUpView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [m_innerView addSubview:m_innerUpView];
    
    UIImage *upImage = [UIImage imageNamed:@"up"];
    UIImageView *upimageView = [[UIImageView alloc] initWithImage:upImage];
    upimageView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin;
    [m_innerUpView addSubview:upimageView];
    
    CGFloat innerMenuUpArrowOffSetX = (CGRectGetWidth(m_innerUpView.frame) - upImage.size.width) / 2;
    if ([self.m_dataSource respondsToSelector:@selector(innerMenuUpArrowOffSetX)]) {
        innerMenuUpArrowOffSetX = [self.m_dataSource innerMenuUpArrowOffSetX];
    }
    upimageView.frame = CGRectMake(innerMenuUpArrowOffSetX, 0, upImage.size.width, upImage.size.height);
    
    UIImage *bottomImage = [UIImage imageNamed:@"color"];
    UIImageView *bottomView = [[UIImageView alloc] initWithImage:bottomImage];
    bottomView.frame = CGRectMake(0, CGRectGetHeight(m_innerUpView.frame) - bottomImage.size.height, CGRectGetWidth(m_innerUpView.frame), bottomImage.size.height);
    bottomView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    [m_innerUpView addSubview:bottomView];
}

@end
