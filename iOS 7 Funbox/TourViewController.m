//
//  TourViewController.m
//  iOS 7 Funbox
//
//  Created by Nanyi Jiang on 10/25/2013.
//  Copyright (c) 2013 Nanyi Jiang. All rights reserved.
//

#import "TourViewController.h"
#import "DetailViewController.h"
#import "TGTransitionAnimator.h"

@interface TourViewController () <UIScrollViewDelegate, UIViewControllerTransitioningDelegate>
@property (nonatomic) UIImageView *imageView;
@property (nonatomic) UIView *snapshot;
@end

@implementation TourViewController {
    BOOL _inZoomMode;
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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [super prepareForSegue:segue sender:sender];
    
    DetailViewController *detailViewController = segue.destinationViewController;
    UIView *view = [self.scrollView snapshotViewAfterScreenUpdates:NO];
    detailViewController.backgroundView = view;
    detailViewController.transitioningDelegate = self;
    detailViewController.modalPresentationStyle = UIModalPresentationCustom;
}

- (void)zoomToTapped {
    [self performSegueWithIdentifier:@"Detail" sender:self];
    
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

#pragma mark UIViewControllerAnimatedTransition Delegate methods

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source {
    TGTransitionAnimator *animator = [TGTransitionAnimator new];
    animator.presenting = YES;
    return animator;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    TGTransitionAnimator *animator = [TGTransitionAnimator new];
    return animator;
}


@end
