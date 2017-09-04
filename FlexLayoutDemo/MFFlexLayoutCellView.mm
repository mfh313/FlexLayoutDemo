//
//  MFFlexLayoutCellView.m
//  EekaMShop
//
//  Created by EEKA on 2017/8/26.
//  Copyright © 2017年 eeka. All rights reserved.
//

#import "MFFlexLayoutCellView.h"
#import <VZFlexLayout/VZFlexLayout.h>
#import <VZFlexLayout/VZFlexNode.h>

using namespace VZ;

@implementation MFFlexLayoutCellView

-(void)setName:(NSString *)name title:(NSString *)title
{
    VZFlexNode *node = [VZFlexNode new];
    node.direction = FlexHorizontal;
    
    VZFTextNode *textNode = [VZFTextNode newWithTextAttributes:
                             {
                                 .text = name,
                                 ._font = [UIFont systemFontOfSize:14.0f]
                             }
                                                     NodeSpecs:
                             {
                                 
                             }
                             ];
    
    
    [node layout:self.frame.size];
}

@end
