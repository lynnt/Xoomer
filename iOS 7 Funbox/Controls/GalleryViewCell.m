//
//  GalleryViewCell.m
//  iOS 7 Funbox
//
//  Created by Nanyi Jiang on 10/26/2013.
//  Copyright (c) 2013 Nanyi Jiang. All rights reserved.
//

#import "GalleryViewCell.h"

@interface GalleryViewCell ()
@end

@implementation GalleryViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //self.imageView = [[UIImageView alloc] init];
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
        //self.imageView.clipsToBounds = YES;
        [self addSubview:self.imageView];
        self.titleLabelView = [[UILabel alloc] initWithFrame:CGRectZero];
        [self.titleLabelView setTextColor:[UIColor whiteColor]];
        [self.titleLabelView setShadowColor:[UIColor blackColor]];
    }
    return self;
}

- (void)layoutSubviews {
    self.imageView.frame = self.bounds;
    self.titleLabelView.frame = CGRectMake(10, 0, self.bounds.size.width, 40);
}

- (void)setFullscreen:(BOOL)fullscreen animated:(BOOL)animted {
    _fullscreen = fullscreen;
    if (fullscreen) {
        
        self.titleLabelView.alpha = 0;
        [UIView animateWithDuration:.5 animations:^{
            [self addSubview:self.titleLabelView];
            self.titleLabelView.alpha = 1;
        } completion:^(BOOL finished) {
        }];
        
    } else {
        [UIView animateWithDuration:.5 animations:^{
            [self addSubview:self.titleLabelView];
            self.titleLabelView.alpha = 0;
        } completion:^(BOOL finished) {
            [self.titleLabelView removeFromSuperview];
        }];
    }
}

- (void)setFullscreen:(BOOL)fullscreen {
    [self setFullscreen:fullscreen animated:NO];
    
}

@end
