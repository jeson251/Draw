//
//  RoundProgressView2.m
//  ProgressView
//
//  Created by huangjiong on 16/7/25.
//  Copyright © 2016年 huangjiong. All rights reserved.
//

#import "RoundProgressView2.h"

@interface RoundProgressView2 ()
@property (nonatomic, weak) CAShapeLayer *roundLayer;
@property (nonatomic, weak) CAShapeLayer *progressLayer;
@property (nonatomic, weak) UILabel *progressLabel;
@end

@implementation RoundProgressView2

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
    
    _borderWidth = 6;
    self.progressLabel.text = @"0.00 %";
    
    CGFloat selfWidth = self.frame.size.width;
    CGFloat selfHeight = self.frame.size.height;
    
    CGFloat radius = MIN(selfWidth, selfHeight) * 0.5 - _borderWidth;
    CGPoint center = CGPointMake(selfWidth * 0.5, selfHeight * 0.5);
    
    
    //圆圈
    UIBezierPath *roundPath = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    self.roundLayer.path = roundPath.CGPath;
    
    //进度
    UIBezierPath *progressPath = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:-M_PI_2 endAngle:-M_PI_2 + M_PI * 2 clockwise:YES];
    self.progressLayer.path = progressPath.CGPath;
}

- (void)setProgressValue:(CGFloat)progressValue {
    _progressValue = progressValue;
    self.progressLabel.text = [NSString stringWithFormat:@"%.2f %%",progressValue * 100];
    
    self.progressLayer.strokeEnd = progressValue;
}


- (CAShapeLayer *)roundLayer {
    if (_roundLayer == nil) {
        CAShapeLayer *roundLayer = [CAShapeLayer layer];
        roundLayer.frame = self.bounds;
        roundLayer.lineWidth = _borderWidth;
        roundLayer.strokeColor = [UIColor lightGrayColor].CGColor;
        roundLayer.fillColor = [UIColor clearColor].CGColor;
        roundLayer.lineCap = kCALineCapRound;
        roundLayer.strokeStart = 0;
        roundLayer.strokeEnd = 1;
        [self.layer addSublayer:roundLayer];
        _roundLayer = roundLayer;
    }
    return _roundLayer;
}

- (CAShapeLayer *)progressLayer {
    if (_progressLayer == nil) {
        CAShapeLayer *progressLayer = [CAShapeLayer layer];
        progressLayer.frame = self.bounds;
        progressLayer.lineWidth = _borderWidth;
        progressLayer.strokeColor = [UIColor blackColor].CGColor;
        progressLayer.fillColor = [UIColor clearColor].CGColor;
        progressLayer.lineCap = kCALineCapRound;
        progressLayer.strokeStart = 0;
        progressLayer.strokeEnd = 0;
        [self.layer addSublayer:progressLayer];
        _progressLayer = progressLayer;
    }
    return _progressLayer;
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
