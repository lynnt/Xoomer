//
//  GalleryViewCell.h
//  iOS 7 Funbox
//
//  Created by Nanyi Jiang on 10/26/2013.
//  Copyright (c) 2013 Nanyi Jiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GalleryViewCell : UIButton
@property (nonatomic) BOOL fullscreen;
@property (nonatomic) UILabel *titleLabelView;
- (void)setFullscreen:(BOOL)fullscreen animated:(BOOL)animted;
@end
