//
//  TagView.m
//  iOS 7 Funbox
//
//  Created by Nanyi Jiang on 10/26/2013.
//  Copyright (c) 2013 Nanyi Jiang. All rights reserved.
//

#import "TagView.h"

@interface TagView ()
@property (nonatomic) UILabel *titleLabel;
@property (nonatomic) UILabel *descriptionLabel;
@end

@implementation TagView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.tintColor = [UIColor blackColor];
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.textColor = [UIColor redColor];
        self.descriptionLabel = [[UILabel alloc] init];
        self.descriptionLabel.textColor = [UIColor blackColor];
        self.descriptionLabel.shadowColor = [UIColor whiteColor];
        [self addSubview:self.titleLabel];
        [self addSubview:self.descriptionLabel];
        
        UIFont *font = [UIFont systemFontOfSize:12];
        self.descriptionLabel.font = font;
        
        self.layer.cornerRadius = 5;
        self.layer.borderColor = [UIColor redColor].CGColor;
    }
    return self;
}

- (void)setTag:(Tag *)tag {
    self.titleLabel.text = tag.title;
    self.descriptionLabel.text = tag.description;
}

- (void)layoutSubviews {
    self.titleLabel.frame = CGRectMake(70, 0, self.bounds.size.width - 40, 60);
    CGFloat constrainedWidth = self.bounds.size.width - 80;
    self.descriptionLabel.frame = CGRectMake(70, 30, constrainedWidth, 60);
}


@end
