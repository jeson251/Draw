//
//  RoundProgressView1.m
//  ProgressView
//
//  Created by huangjiong on 16/7/25.
//  Copyright © 2016年 huangjiong. All rights reserved.
//

#import "RoundProgressView1.h"

@interface RoundProgressView1 ()
@property (nonatomic, weak) UILabel *progressLabel;
@end

@implementation RoundProgressView1

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initStatus];
    }
    return self;
}

- (void)awakeFromNib {
    [self initStatus];
}

- (void)initStatus {
    self.progressLabel.text = @"0.00 %";
    _borderWidth = 6;
}

- (void)setProgressValue:(CGFloat)progressValue {
    _progressValue = progressValue;
    self.progressLabel.text = [NSString stringWithFormat:@"%.2f %%",progressValue * 100];
    //标记需要重绘
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    
    CGFloat radius = MIN(rect.size.width, rect.size.height) * 0.5 - _borderWidth;
    CGPoint center = CGPointMake(rect.size.width  * 0.5, rect.size.height  * 0.5);
    

    //圆圈
    UIBezierPath *roundPath = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    roundPath.lineWidth = _borderWidth;
    [[UIColor lightGrayColor] set];
    [roundPath stroke];
    
    //进度
    CGFloat startAngle = -M_PI_2;
    CGFloat endAngle = -M_PI_2 + _progressValue * M_PI * 2;
    UIBezierPath *progressPath = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startAngle endAngle:endAngle  clockwise:YES];
    progressPath.lineWidth = _borderWidth;
    progressPath.lineCapStyle = kCGLineCapRound;
    [[UIColor blackColor] set];
    [progressPath stroke];
}

- (UILabel *)progressLabel {
    if (_progressLabel == nil) {
        CGFloat selfWidth = self.frame.size.width;
        CGFloat selfHeight = self.frame.size.height;
        UILabel *progressLabel = [[UILabel alloc] initWithFrame:CGRectMake(_borderWidth, _borderWidth, selfWidth - _borderWidth * 2, selfHeight - _borderWidth * 2)];
        progressLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:progressLabel];
        _progressLabel = progressLabel;
    }
    return _progressLabel;
}
@end
