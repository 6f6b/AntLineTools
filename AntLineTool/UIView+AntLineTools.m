//
//  UIView+AntLineTools.m
//  AntLineTool
//
//  Created by dev.liufeng on 2017/2/23.
//  Copyright © 2017年 dev.liufeng. All rights reserved.
//

#import "UIView+AntLineTools.h"
#import <objc/runtime.h>

static const void *antLineToolsKey = &antLineToolsKey;
@implementation UIView (AntLineTools)

- (void)configAntLineToolsWith:(GetImageBlock)getImageBlock{
    AntLineTools *antLineTools = [[AntLineTools alloc] initWith:self];
    self.antLineTools = antLineTools;
    self.antLineTools.getImageBlock = getImageBlock;
}

- (void)showImageSizeInfoWith:(BOOL)hidden{
    if(hidden){
        self.antLineTools.infoLabel.hidden = !hidden;
    }
}

- (NSString *)antLineTools {
    return objc_getAssociatedObject(self, antLineToolsKey);
}

- (void)setAntLineTools:(AntLineTools *)antLineTools{
     objc_setAssociatedObject(self, antLineToolsKey, antLineTools, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
