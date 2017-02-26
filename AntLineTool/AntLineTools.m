//
//  AntLineTools.m
//  AntLineTool
//
//  Created by dev.liufeng on 2017/2/23.
//  Copyright © 2017年 dev.liufeng. All rights reserved.
//

#import "AntLineTools.h"
@implementation AntLineTools

- (instancetype)initWith:(UIView *)view{
    if(self = [super init]){
        self.view = view;
        view.userInteractionEnabled = true;
        CGFloat width = view.frame.size.height>=view.frame.size.width ? view.frame.size.height:view.frame.size.width;
        width = width*0.2;
        CGPoint center = view.center;
        self.firstPoint = CGPointMake(center.x-width, center.y+width);
        self.secondPoint = CGPointMake(center.x+width, center.y-width);
        
        UIView *rectView = [[UIView alloc] initWithFrame:self.rectFrame];
        rectView.layer.borderWidth = 1;
        rectView.layer.borderColor = [[UIColor whiteColor] CGColor];
        self.rectView = rectView;
        [self.view addSubview:rectView];
        UIPanGestureRecognizer *rectViewPan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dealRectViewPan:)];
        [self.rectView addGestureRecognizer:rectViewPan];
        
        UILabel *infoLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 20)];
        infoLabel.layer.cornerRadius = 3;
        infoLabel.clipsToBounds = true;
        self.infoLabel = infoLabel;
        infoLabel.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        infoLabel.textColor = [UIColor whiteColor];
        infoLabel.font = [UIFont systemFontOfSize:8];
        infoLabel.textAlignment = NSTextAlignmentCenter;
        infoLabel.hidden = true;
        self.infoLabel.text = [NSString stringWithFormat:@"(%0.f,%0.f)",self.rectFrame.size.width ,self.rectFrame.size.height];
        [self.rectView addSubview:self.infoLabel];
        
        UIButton *cutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.cutBtn = cutBtn;
        cutBtn.frame = CGRectMake(0, 0, 40, 30);
        [cutBtn setBackgroundImage:[UIImage imageNamed:@"截图"] forState:UIControlStateNormal];
        cutBtn.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        [cutBtn addTarget:self action:@selector(dealCut) forControlEvents:UIControlEventTouchUpInside];
        [self.rectView addSubview:cutBtn];
        
        [self adjustInfoLabelAndCutBtn];
        
        UIVisualEffectView *pointLeftBottomBtn = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
        pointLeftBottomBtn.alpha = 0.5;
        UIPanGestureRecognizer *leftBottomPan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dealLeftBottomPan:)];
        [pointLeftBottomBtn addGestureRecognizer:leftBottomPan];
        self.pointLeftBottomBtn = pointLeftBottomBtn;
        self.pointLeftBottomBtn.frame = CGRectMake(self.firstPoint.x, self.firstPoint.y, CIRCLE_WIDTH, CIRCLE_WIDTH);
        self.pointLeftBottomBtn.center = CGPointMake(self.firstPoint.x, self.firstPoint.y);
        self.pointLeftBottomBtn.layer.cornerRadius = CIRCLE_WIDTH*0.5;
        self.pointLeftBottomBtn.clipsToBounds = true;
        [self.view addSubview:self.pointLeftBottomBtn];
        
        UIVisualEffectView *pointRightTopBtn = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
        pointRightTopBtn.alpha = 0.5;
        UIPanGestureRecognizer *rightTopPan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dealRightTopPan:)];
        [pointRightTopBtn addGestureRecognizer:rightTopPan];
        self.pointRightTopBtn = pointRightTopBtn;
        self.pointRightTopBtn.frame = CGRectMake(self.secondPoint.x, self.secondPoint.y, CIRCLE_WIDTH, CIRCLE_WIDTH);
        self.pointRightTopBtn.center = CGPointMake(self.secondPoint.x, self.secondPoint.y);
        self.pointRightTopBtn.backgroundColor = [UIColor blackColor];
        self.pointRightTopBtn.layer.cornerRadius = CIRCLE_WIDTH*0.5;
        self.pointRightTopBtn.clipsToBounds = true;
        [self.view addSubview:self.pointRightTopBtn];
    }
    return  self;
}

- (CGRect)rectFrame{
    CGFloat x = self.firstPoint.x<self.secondPoint.x ? self.firstPoint.x:self.secondPoint.x;
    CGFloat y = self.firstPoint.y<self.secondPoint.y ? self.firstPoint.y:self.secondPoint.y;
    CGFloat width = self.firstPoint.x>self.secondPoint.x ? (self.firstPoint.x-self.secondPoint.x):(self.secondPoint.x-self.firstPoint.x);
    CGFloat height = self.firstPoint.y>self.secondPoint.y ? (self.firstPoint.y-self.secondPoint.y):(self.secondPoint.y-self.firstPoint.y);
    return  CGRectMake(x, y, width, height);
}

- (void)setFirstPoint:(CGPoint)firstPoint{
    if (firstPoint.x<=0){
        firstPoint.x = 0;
    }
    if (firstPoint.x>=self.view.frame.size.width){
        firstPoint.x = self.view.frame.size.width;
    }
    if (firstPoint.y>=self.view.frame.size.height){
        firstPoint.y = self.view.frame.size.height;
    }
    if (firstPoint.y<=0){
        firstPoint.y = 0;
    }
    _firstPoint = firstPoint;
    self.rectView.frame = self.rectFrame;
    self.infoLabel.text = [NSString stringWithFormat:@"(%0.f,%0.f)",self.rectFrame.size.width ,self.rectFrame.size.height];
    [self adjustInfoLabelAndCutBtn];
    self.pointLeftBottomBtn.center = firstPoint;
}

- (void)setSecondPoint:(CGPoint)secondPoint{
    if (secondPoint.x<=0){
        secondPoint.x = 0;
    }
    if (secondPoint.x>=self.view.frame.size.width){
        secondPoint.x = self.view.frame.size.width;
    }
    if (secondPoint.y>=self.view.frame.size.height){
        secondPoint.y = self.view.frame.size.height;
    }
    if (secondPoint.y<=0){
        secondPoint.y = 0;
    }
    _secondPoint = secondPoint;
    self.rectView.frame = self.rectFrame;
    self.infoLabel.text = [NSString stringWithFormat:@"(%0.f,%0.f)",self.rectFrame.size.width ,self.rectFrame.size.height];
     [self adjustInfoLabelAndCutBtn];
    self.pointRightTopBtn.center = secondPoint;
}

- (void)dealRectViewPan:(UIPanGestureRecognizer *)pan{
    CGPoint location = [pan locationInView:self.view];
    NSLog(@"%@",NSStringFromCGPoint(location));
    if (location.x<=self.rectFrame.size.width*0.5){
        location.x = self.rectFrame.size.width*0.5;
    }
    if ((location.x+self.rectFrame.size.width*0.5)>=self.view.frame.size.width){
        location.x = self.view.frame.size.width-self.rectFrame.size.width*0.5;
    }
    if (location.y<=self.rectFrame.size.height*0.5){
        location.y = self.rectFrame.size.height*0.5;
    }
    if ((location.y+self.rectFrame.size.height*0.5)>=self.view.frame.size.height){
        location.y = self.view.frame.size.height-self.rectFrame.size.height*0.5;
    }
    self.rectView.center = location;
    CGRect tempRect = self.rectFrame;
    if (self.firstPoint.x<=self.secondPoint.x && self.secondPoint.y<=self.firstPoint.y){
        self.firstPoint = CGPointMake(location.x-tempRect.size.width*0.5, location.y+tempRect.size.height*0.5);
        self.secondPoint = CGPointMake(location.x+tempRect.size.width*0.5, location.y-tempRect.size.height*0.5);
    }
    if (self.firstPoint.x<=self.secondPoint.x   && self.secondPoint.y>=self.firstPoint.y){
        self.firstPoint = CGPointMake(location.x-tempRect.size.width*0.5, location.y-tempRect.size.height*0.5);
        self.secondPoint = CGPointMake(location.x+tempRect.size.width*0.5, location.y+tempRect.size.height*0.5);
    }
    if (self.firstPoint.x>=self.secondPoint.x   && self.secondPoint.y<=self.firstPoint.y){
        self.firstPoint = CGPointMake(location.x+tempRect.size.width*0.5, location.y-tempRect.size.height*0.5);
        self.secondPoint = CGPointMake(location.x-tempRect.size.width*0.5, location.y+tempRect.size.height*0.5);
    }
    if (self.firstPoint.x>=self.secondPoint.x   && self.secondPoint.y>=self.firstPoint.y){
        self.firstPoint = CGPointMake(location.x+tempRect.size.width*0.5, location.y+tempRect.size.height*0.5);
        self.secondPoint = CGPointMake(location.x-tempRect.size.width*0.5, location.y-tempRect.size.height*0.5);
    }
}

- (void)adjustInfoLabelAndCutBtn{
    if (self.cutBtn.hidden || self.infoLabel.hidden){
        self.cutBtn.center = CGPointMake(self.rectFrame.size.width*0.5, self.rectFrame.size.height*0.5);
        self.infoLabel.center = CGPointMake(self.rectFrame.size.width*0.5, self.rectFrame.size.height*0.5);
        return;
    }
    self.cutBtn.center = CGPointMake(self.rectFrame.size.width*0.5, self.rectFrame.size.height*0.5-16);
    self.infoLabel.center = CGPointMake(self.rectFrame.size.width*0.5, self.rectFrame.size.height*0.5+11);
}

- (void)dealLeftBottomPan:(UIPanGestureRecognizer *)pan{
    CGPoint location = [pan locationInView:self.view];
    self.firstPoint = location;
    [self.view drawRect:self.rectFrame];
}

- (void)dealRightTopPan:(UIPanGestureRecognizer *)pan{
    CGPoint location = [pan locationInView:self.view];
    self.secondPoint = location;
}

- (void)dealCut{
    for (UIView *subV in self.view.subviews){
        subV.hidden = true;
    }
    UIGraphicsBeginImageContext(self.view.bounds.size);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImage *endImage = [UIImage imageWithCGImage:CGImageCreateWithImageInRect(image.CGImage, self.rectFrame)];
    if (nil != self.getImageBlock){
        self.getImageBlock(endImage);
    }
    for (UIView *subV in self.view.subviews){
        subV.hidden = false;
    }
}

@end
