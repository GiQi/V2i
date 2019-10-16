//
//  Ball.m
//  TimeToTime
//
//  Created by Apple on 2019/8/6.
//  Copyright © 2019 Apple. All rights reserved.
//

#import "Ball.h"

@implementation Ball
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
    }
    
    return self;
}
- (void)drawRect:(CGRect)rect
{
    //1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //2.绘图
    CGContextAddEllipseInRect(ctx, CGRectMake(0, 0, 100, 100));
    //设置颜色
    [[UIColor redColor] set];
    //3.渲染
    CGContextFillPath(ctx);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
