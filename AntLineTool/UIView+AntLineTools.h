//
//  UIView+AntLineTools.h
//  AntLineTool
//
//  Created by dev.liufeng on 2017/2/23.
//  Copyright © 2017年 dev.liufeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AntLineTools.h"

@interface UIView (AntLineTools)
@property (nonatomic,assign) AntLineTools *antLineTools;
- (void)configAntLineToolsWith:(GetImageBlock)getImageBlock;

//隐藏图片大小信息
- (void)showImageSizeInfoWith:(BOOL)hidden;
@end
