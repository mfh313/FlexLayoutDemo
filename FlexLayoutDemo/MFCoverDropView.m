//
//  MFCoverDropView.m
//  FlexLayoutDemo
//
//  Created by EEKA on 2017/10/7.
//  Copyright © 2017年 mafanghua. All rights reserved.
//

#import "MFCoverDropView.h"
#import "MFCoverDropTagView.h"
#import "HexColors.h"

@interface MFCoverDropView ()
{
    UIView *m_innerView;
    UIView *m_innerUpView;
    UIScrollView *m_innerMenuView;
}

@property (strong, nonatomic) NSMutableArray <MFCoverDropTagView *> *tagViewsCache;
@property (assign, nonatomic) NSInteger index;

@end

@implementation MFCoverDropView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor hx_colorWithHexString:@"000000" alpha:0.1];
        self.userInteractionEnabled = YES;
        [self addTarget:self action:@selector(onClickDismiss:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return self;
}

-(void)layoutMenuView
{
    CGFloat innerWidth = 200;
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
    m_innerView.backgroundColor = [UIColor clearColor];
    CGFloat innerRealHeight = innerHeight + [self menuUpViewHeight];
    m_innerView.frame = CGRectMake(menuStartOrigin.x - innerWidth / 2, menuStartOrigin.y, innerWidth,innerRealHeight);
    [self addSubview:m_innerView];
    
    [self initMenuUpView];
    
    [self layoutInnerMenuView];
}

-(void)layoutInnerMenuView
{
    m_innerMenuView = [[UIScrollView alloc] initWithFrame:CGRectZero];
    m_innerMenuView.directionalLockEnabled = YES;
    m_innerMenuView.scrollsToTop = NO;
    m_innerMenuView.showsHorizontalScrollIndicator = NO;
    m_innerMenuView.showsVerticalScrollIndicator = YES;
    m_innerMenuView.backgroundColor = [UIColor lightGrayColor];
    [m_innerView addSubview:m_innerMenuView];
    
    CGFloat innerHeight = 0;
    if ([self.m_dataSource respondsToSelector:@selector(innerMenuItemHeight)]) {
        innerHeight = [self.m_dataSource numberOfMenu] * [self.m_dataSource innerMenuItemHeight];
    }
    
    CGRect innerMenuFrame = CGRectMake(0, CGRectGetMaxY(m_innerUpView.frame), CGRectGetWidth(m_innerView.frame), innerHeight);
    m_innerMenuView.frame = innerMenuFrame;
    
    self.tagViewsCache = [NSMutableArray new];
    for (UIView *view in m_innerMenuView.subviews) {
        [view removeFromSuperview];
    }
    
    CGFloat offsetY = 0;
    CGFloat itemVSpace = 0;
    for (int i = 0; i < [self.m_dataSource numberOfMenu]; i++) {
        
        CGFloat itemHeight = [self.m_dataSource respondsToSelector:@selector(innerMenuItemHeight)] ? [self.m_dataSource innerMenuItemHeight] : 44;
        
        MFCoverDropTagTitleView *titleView = [[MFCoverDropTagTitleView alloc] initWithFrame:CGRectMake(0, offsetY, CGRectGetWidth(m_innerMenuView.frame), itemHeight)];
        if ([self.m_dataSource respondsToSelector:@selector(titleColorForIndex:)]) {
            titleView.normalTitleColor = [self.m_dataSource titleColorForIndex:i];
        }
        else
        {
            titleView.normalTitleColor = [UIColor hx_colorWithHexString:@"2d2c2c"];
        }
        
        if ([self.m_dataSource respondsToSelector:@selector(backgroundColorForIndex:)]) {
            titleView.normalBGColor = [self.m_dataSource backgroundColorForIndex:i];
        }
        else
        {
            titleView.normalBGColor = [UIColor whiteColor];
        }
        
        if ([self.m_dataSource respondsToSelector:@selector(titleHighlightColorForIndex:)]) {
            titleView.highlightedTitleColor = [self.m_dataSource titleHighlightColorForIndex:i];
        }
        else
        {
            titleView.highlightedTitleColor = [UIColor whiteColor];
        }
        
        if ([self.m_dataSource respondsToSelector:@selector(backgroundColorHighlightColorForIndex:)]) {
            titleView.highlightedBgColor = [self.m_dataSource backgroundColorHighlightColorForIndex:i];
        }
        else
        {
            titleView.highlightedBgColor = [UIColor hx_colorWithHexString:@"232733"];
        }
        
        titleView.title.text = [self.m_dataSource titleForIndex:i];
        titleView.title.font = [UIFont systemFontOfSize:15.0];
        
        titleView.tag = i;
        titleView.userInteractionEnabled = YES;
        [titleView addTarget:self action:@selector(pressTab:) forControlEvents:UIControlEventTouchUpInside];
        
        [m_innerMenuView addSubview:titleView];
        [self.tagViewsCache addObject:titleView];
        offsetY += itemHeight + itemVSpace;
    }
    
    [self reloadHighlight];
    
    m_innerMenuView.contentSize = CGSizeMake(0, CGRectGetHeight(m_innerMenuView.frame));
}

- (void)pressTab:(UIControl *)sender
{
    NSInteger i = sender.tag;
    if  (self.index == i) {
        return;
    }
    
    if ([self.m_delegate respondsToSelector:@selector(didSelectDropMenuIndex:)]) {
        [self.m_delegate didSelectDropMenuIndex:i];
    }
    self.index = i;
    [self reloadHighlight];
    
}

- (void)reloadHighlightToIndex:(NSInteger)index
{
    self.index = index;
    [self reloadHighlight];
}

- (void)reloadHighlight
{
    for (int i=0;i<self.tagViewsCache.count;i++) {
        MFCoverDropTagView *view = (MFCoverDropTagView *)self.tagViewsCache[i];
        if (i == self.index) {
            [view highlightTagView];
        } else {
            [view unhighlightTagView];
        }
    }
}

-(void)initMenuUpView
{
    m_innerUpView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(m_innerView.frame), [self menuUpViewHeight])];
    m_innerUpView.backgroundColor = [UIColor clearColor];
    m_innerUpView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [m_innerView addSubview:m_innerUpView];
    
    UIImage *upImage = [UIImage imageNamed:@"up"];
    UIImageView *upimageView = [[UIImageView alloc] initWithImage:upImage];
    upimageView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin;
    upimageView.backgroundColor = [UIColor clearColor];
    [m_innerUpView addSubview:upimageView];
    
    CGFloat innerMenuUpArrowOffSetX = (CGRectGetWidth(m_innerUpView.frame) - upImage.size.width) / 2;
    if ([self.m_dataSource respondsToSelector:@selector(innerMenuUpArrowOffSetX)]) {
        innerMenuUpArrowOffSetX = [self.m_dataSource innerMenuUpArrowOffSetX];
        if (innerMenuUpArrowOffSetX > CGRectGetWidth(m_innerUpView.frame) - upImage.size.width) {
            innerMenuUpArrowOffSetX = CGRectGetWidth(m_innerUpView.frame) - upImage.size.width;
        }
    }
    
    upimageView.frame = CGRectMake(innerMenuUpArrowOffSetX, 0, upImage.size.width, upImage.size.height);
    
    UIImage *bottomImage = [UIImage imageNamed:@"color"];
    UIImageView *bottomView = [[UIImageView alloc] initWithImage:bottomImage];
    bottomView.frame = CGRectMake(0, CGRectGetHeight(m_innerUpView.frame) - bottomImage.size.height, CGRectGetWidth(m_innerUpView.frame), bottomImage.size.height);
    bottomView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    [m_innerUpView addSubview:bottomView];
}

-(void)onClickDismiss:(UIControl *)sender
{
    [self removeFromSuperview];
}

-(CGFloat)menuUpViewHeight
{
    return 9;
}

@end
