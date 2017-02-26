//
//  ViewController.m
//  AntLineTool
//
//  Created by dev.liufeng on 2017/2/22.
//  Copyright © 2017年 dev.liufeng. All rights reserved.
//

#import "ViewController.h"
#import "UIView+AntLineTools.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    UIImageView *imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"zxy.JPEG"]];
    GetImageBlock getImageBlock = ^(UIImage *image){
        UIImageView *imagev = [[UIImageView alloc] initWithImage:image];
        [self.view addSubview:imagev];
    };
    [imageV configAntLineToolsWith:getImageBlock];
    imageV.center = self.view.center;
    imageV.backgroundColor = [UIColor greenColor];
    [self.view addSubview:imageV];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
