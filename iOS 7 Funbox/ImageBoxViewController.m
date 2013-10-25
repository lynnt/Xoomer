//
//  ImageBoxViewController.m
//  iOS 7 Funbox
//
//  Created by Nanyi Jiang on 10/24/2013.
//  Copyright (c) 2013 Nanyi Jiang. All rights reserved.
//

#import "ImageBoxViewController.h"
#import <FXBlurView.h>

@interface ImageBoxViewController ()
@property (nonatomic) UIView *blurView;
@property (nonatomic) UIDynamicAnimator *animator;
@property (nonatomic) UIGravityBehavior *gravityBehavior;
@property (nonatomic) UIPanGestureRecognizer *recognizer;
@property (nonatomic) UIAttachmentBehavior *attachmentBehavior;
@property (nonatomic) UIPushBehavior *pushBehavior;
@property (nonatomic) UIDynamicItemBehavior *itemBehavior;
@end

@implementation ImageBoxViewController

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
	self.blurView = [[FXBlurView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height/3)];
    self.blurView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.blurView];
    //self.blurView.blurEnabled = NO;
    
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    self.gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[self.blurView]];
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[self.blurView]];
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    
    UIDynamicItemBehavior *itemBehaviur = [[UIDynamicItemBehavior alloc] initWithItems:@[self.blurView]];
    itemBehaviur.elasticity = 0.45f;
    [self.animator addBehavior:itemBehaviur];
    [self.animator addBehavior:self.gravityBehavior];
    [self.animator addBehavior:collisionBehavior];
    
    
    self.recognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    [self.blurView addGestureRecognizer:self.recognizer];
    
}

- (void)handleGesture:(UIPanGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        //[self.animator addBehavior:self.attachmentBehavior];
        
        CGPoint anchorPoint = CGPointMake(self.blurView.center.x, self.blurView.center.y - 0);
        UIAttachmentBehavior *attachmentBehavior = [[UIAttachmentBehavior alloc] initWithItem:self.blurView attachedToAnchor:anchorPoint];
        
        // These parameters set the attachment in spring mode, instead of a rigid
        // connection.
        [attachmentBehavior setFrequency:1.0];
        [attachmentBehavior setDamping:0.7];
        self.attachmentBehavior = attachmentBehavior;
        [self.animator addBehavior:attachmentBehavior];
    } else if (gestureRecognizer.state == UIGestureRecognizerStateEnded) {
        [self.animator removeBehavior:self.attachmentBehavior];
    }
    [self.attachmentBehavior setAnchorPoint:[gestureRecognizer locationInView:self.view]];
    //self.attachmentView.center = self.attachmentBehavior.anchorPoint;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
