//
//  DetailViewController.h
//  iOS 7 Funbox
//
//  Created by Nanyi Jiang on 10/25/2013.
//  Copyright (c) 2013 Nanyi Jiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Tag;

@interface DetailViewController : UIViewController
@property (nonatomic) UIView *backgroundView;
@property (nonatomic) Tag *tag;
@end
