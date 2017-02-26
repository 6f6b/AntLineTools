//
//  AntLineTools.h
//  AntLineTool
//
//  Created by dev.liufeng on 2017/2/23.
//  Copyright © 2017年 dev.liufeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define CIRCLE_WIDTH 40

typedef void(^GetImageBlock)(UIImage*);

@interface AntLineTools : NSObject
@property (nonatomic,assign) CGPoint pointLeftTop;
@property (nonatomic,assign) CGPoint pointTopCenter;
@property (nonatomic,assign) CGPoint pointRightTop;
@property (nonatomic,assign) CGPoint pointRightCenter;
@property (nonatomic,assign) CGPoint pointRightBottom;
@property (nonatomic,assign) CGPoint pointBottomCenter;
@property (nonatomic,assign) CGPoint pointLeftBottom;
@property (nonatomic,assign) CGPoint pointLeftCenter;

@property (nonatomic,assign) CGPoint firstPoint;
@property (nonatomic,assign) CGPoint secondPoint;

@property (nonatomic,assign) CGRect rectFrame;

@property (nonatomic,weak) UIVisualEffectView *pointLeftTopBtn;
@property (nonatomic,weak) UIVisualEffectView * pointTopCenterBtn;
@property (nonatomic,weak) UIVisualEffectView * pointRightTopBtn;
@property (nonatomic,weak) UIVisualEffectView * pointRightCenterBtn;
@property (nonatomic,weak) UIVisualEffectView * pointRightBottomBtn;
@property (nonatomic,weak) UIVisualEffectView * pointBottomCenterBtn;
@property (nonatomic,weak) UIVisualEffectView * pointLeftBottomBtn;
@property (nonatomic,weak) UIVisualEffectView * pointLeftCenterBtn;

@property (nonatomic,weak) UIView *view;
@property (nonatomic,weak) UIView *rectView;
@property (nonatomic,weak) UILabel *infoLabel;
@property (nonatomic,weak) UIButton *cutBtn;

@property (nonatomic,strong) GetImageBlock getImageBlock;

- (instancetype)initWith:(UIView *)view;
@end
