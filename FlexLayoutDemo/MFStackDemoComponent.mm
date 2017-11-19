//
//  MFStackDemoComponent.m
//  FlexLayoutDemo
//
//  Created by mafanghua on 2017/11/17.
//  Copyright © 2017年 mafanghua. All rights reserved.
//

#import "MFStackDemoComponent.h"

@implementation MFStackDemoComponent

+(instancetype)newWithContent:(NSString *)content
{
    return [super newWithComponent:[CKFlexboxComponent
                                    newWithView:{}
                                    size:{}
                                    style:{
                                        .direction = CKFlexboxDirectionHorizontal
                                    }
                                    children:{
                                        {
                                            // Small dark gray rectangle as a bookmark.
                                            .component =
                                            [CKComponent
                                             newWithView:{
                                                 [UIView class],
                                                 {{@selector(setBackgroundColor:), [UIColor darkGrayColor]}}
                                             }
                                             size:{20, 40}],
                                            .spacingBefore = 10
                                        },
                                        {
                                            .component = quoteTextComponent,
                                            .flexShrink = 1,
                                            .flexBasis = CKRelativeDimension::Percent(1.0)
                                        }
                                    }]];
}

@end
