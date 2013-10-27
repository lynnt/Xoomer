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
#import "TagView.h"
#import "APLDecorationView.h"
#import "DataModel.h"

@interface TourViewController () <UIScrollViewDelegate, UIViewControllerTransitioningDelegate, UINavigationControllerDelegate>
@property (nonatomic) UIImageView *imageView;
@property (nonatomic) UIView *snapshot;
@property (nonatomic) UIDynamicAnimator *animator;
@property (nonatomic) NSMutableArray *dynamicArray;
@end

@implementation TourViewController {
    BOOL _inZoomMode;
    Tag *targetTag;
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
    detailViewController.tag = targetTag;
    self.navigationController.delegate = self;
}

- (void)zoomToTapped {
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    Scene *scene = [Scene Canada];
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.scrollView];
    UIImage *tourImage = scene.backgroundImage;
    self.imageView = [[UIImageView alloc] initWithImage:tourImage];
    [self.scrollView addSubview:self.imageView];
    self.scrollView.contentSize = self.imageView.bounds.size;
    self.scrollView.maximumZoomScale = 2;
    self.scrollView.minimumZoomScale = 0.5;
    self.scrollView.delegate = self;
    
    
    self.navigationItem.rightBarButtonItem = [self zoomToButton];
    
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.scrollView];
    
    self.dynamicArray = [[NSMutableArray alloc] init];
    
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] init];
    
    CGFloat attachmentLength = 100;
    
    for (Tag *tag in scene.tags) {
        APLDecorationView *decoView = [[APLDecorationView alloc] initWithFrame:(CGRect){.origin = CGPointZero, .size = self.scrollView.contentSize}];
        [self.scrollView addSubview:decoView];
        
        TagView *tagView1 = [[TagView alloc] initWithFrame:CGRectMake(tag.position.x + attachmentLength, tag.position.y + attachmentLength, 300, 80)];
        
        [self.scrollView addSubview:tagView1];
        CGPoint attachmentPoint = CGPointMake(tagView1.center.x - attachmentLength, tagView1.center.y - attachmentLength);
        UIView *attachmentView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"AttachmentPoint_Mask"]];
        [self.scrollView addSubview:attachmentView];
        attachmentView.center = attachmentPoint;
        
        
        UIAttachmentBehavior *pinBehavior = [[UIAttachmentBehavior alloc] initWithItem:attachmentView attachedToAnchor:attachmentPoint];
        [self.animator addBehavior:pinBehavior];
        
        UIAttachmentBehavior *attachmentBehavior = [[UIAttachmentBehavior alloc] initWithItem:tagView1 attachedToItem:attachmentView];
        [self.animator addBehavior:attachmentBehavior];
        [gravityBehavior addItem:tagView1];
        [attachmentBehavior setDamping:0.5];
        
        [decoView trackAndDrawAttachmentFromView:attachmentView toView:tagView1 withAttachmentOffset:CGPointZero];
        
        // Add user interaction to the tag
        tagView1.t = tag;
        
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tagTapped:)];
        [tagView1 addGestureRecognizer:tapGestureRecognizer];
    }
}

- (void)tagTapped:(UITapGestureRecognizer *)recognizer {
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        targetTag = [(TagView *)recognizer.view t];
        [self performSegueWithIdentifier:@"Detail" sender:self];
    }
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

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    TGTransitionAnimator *animator = [TGTransitionAnimator new];
    animator.presenting = operation == UINavigationControllerOperationPush;
    return animator;
}

@end
