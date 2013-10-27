//
//  DetailViewController.m
//  iOS 7 Funbox
//
//  Created by Nanyi Jiang on 10/25/2013.
//  Copyright (c) 2013 Nanyi Jiang. All rights reserved.
//

#import "DetailViewController.h"
#import "GalleryViewController.h"
#import <FXBlurView.h>
#import "DataModel.h"

@interface DetailViewController ()
@property (nonatomic) FXBlurView *blurView;
@property (nonatomic) GalleryViewController *galleyViewController;
@end

@implementation DetailViewController

- (FXBlurView *)blurView {
    if (!_blurView) {
        _blurView = [[FXBlurView alloc] init];
        _blurView.tintColor = [UIColor blackColor];
    }
    return _blurView;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIToolbar* bgToolbar = [[UIToolbar alloc] initWithFrame:self.view.bounds];
    bgToolbar.barStyle = UIBarStyleDefault;
    [self.view addSubview:bgToolbar];
    
    
}

- (void)setTag:(Tag *)tag {
    GalleryViewController *vc = [[GalleryViewController alloc] init];
    vc.view.frame = CGRectMake(10, 100, self.view.bounds.size.width - 20, 200);
    [self.view addSubview:vc.view];
    
    for (NSObject *obj in tag.items) {
        if ([obj class] == [GalleryItem class]) {
            [vc addItem:(GalleryItem *)obj];
        }
    }
    
    self.galleyViewController = vc;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setBackgroundView:(UIView *)backgroundView {
    if (_backgroundView != backgroundView) {
        [_backgroundView removeFromSuperview];
        [self.view insertSubview:backgroundView atIndex:0];
        backgroundView.transform = CGAffineTransformMakeScale(1.5, 1.5);
        _backgroundView = backgroundView;
    }
}

@end
