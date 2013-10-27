//
//  FloatTextView.m
//  iOS 7 Funbox
//
//  Created by Nanyi Jiang on 10/26/2013.
//  Copyright (c) 2013 Nanyi Jiang. All rights reserved.
//

#import "FloatTextView.h"

@interface FloatTextView ()
@property (nonatomic) NSTimer *timer;
@end

@implementation FloatTextView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)startAnimating {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(spawnRandom) userInfo:nil repeats:YES];
    [self.timer fire];
}

- (void)spawnRandom {
    NSUInteger randomIndex = arc4random() % [self.array count];
    [self spawnText:[self.array objectAtIndex:randomIndex] size:arc4random() % 50 + 10 positionY:arc4random() % (int)self.bounds.size.height];
}

- (void)spawnText:(NSString *)quote size:(CGFloat)size positionY:(CGFloat)y {
    double time = 20 / (size / 20);
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(self.bounds.size.width + 200, y, 400, size)];
    label.font = [UIFont systemFontOfSize:size];
    label.text = quote;
    label.textColor = [UIColor colorWithWhite:0 alpha:(arc4random() % 30) / 100. + 0.2];
    [self addSubview:label];
    [UIView animateWithDuration:time delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        label.frame = CGRectOffset(label.frame, -800, 0);
    } completion:^(BOOL finished) {
        [label removeFromSuperview];
    }];
}

@end
