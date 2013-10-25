//
//  TourViewController.m
//  iOS 7 Funbox
//
//  Created by Nanyi Jiang on 10/25/2013.
//  Copyright (c) 2013 Nanyi Jiang. All rights reserved.
//

#import "TourViewController.h"
#import <FXBlurView.h>

@interface TourViewController () <UIScrollViewDelegate>
@property (nonatomic) UIImageView *imageView;
@property (nonatomic) FXBlurView *blurView;
@property (nonatomic) UIView *snapshot;
@end

@implementation TourViewController {
    BOOL _inZoomMode;
}

- (FXBlurView *)blurView {
    if (!_blurView) {
        _blurView = [[FXBlurView alloc] init];
        _blurView.tintColor = [UIColor whiteColor];
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

- (UIBarButtonItem *)zoomToButton {
    return [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(zoomToTapped)];
}

- (void)zoomToTapped {
    if (_inZoomMode) {
        
    } else {
        self.blurView.frame = self.view.bounds;
        self.blurView.alpha = 0;
        [self.view addSubview:self.blurView];
        [UIView animateWithDuration:.5 animations:^{
            self.scrollView.zoomScale = 1.5;
            self.blurView.alpha = 1;
        }];
    }
    _inZoomMode = !_inZoomMode;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.scrollView];
    UIImage *tourImage = [UIImage imageNamed:@"stuff"];
    self.imageView = [[UIImageView alloc] initWithImage:tourImage];
    [self.scrollView addSubview:self.imageView];
    self.scrollView.contentSize = self.imageView.bounds.size;
    self.scrollView.maximumZoomScale = 2;
    self.scrollView.minimumZoomScale = 0.5;
    self.scrollView.delegate = self;
    
    self.navigationItem.rightBarButtonItem = [self zoomToButton];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}

@end
