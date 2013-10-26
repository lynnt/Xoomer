//
//  TGTransitionAnimator.m
//  iOS 7 Funbox
//
//  Created by Nanyi Jiang on 10/25/2013.
//  Copyright (c) 2013 Nanyi Jiang. All rights reserved.
//

#import "TGTransitionAnimator.h"

@implementation TGTransitionAnimator
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.5f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    // Grab the from and to view controllers from the context
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    
    if (self.presenting) {
        fromViewController.view.userInteractionEnabled = NO;
        
        [transitionContext.containerView addSubview:fromViewController.view];
        [transitionContext.containerView addSubview:toViewController.view];
        
        toViewController.view.alpha = 0;
        toViewController.view.transform = CGAffineTransformMakeScale(0.5, 0.5);
        fromViewController.view.transform = CGAffineTransformIdentity;
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            toViewController.view.transform = CGAffineTransformIdentity;
            fromViewController.view.transform = CGAffineTransformMakeScale(1.5, 1.5);
            toViewController.view.alpha = 1;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    }
    else {
        toViewController.view.userInteractionEnabled = YES;
        
        [transitionContext.containerView addSubview:toViewController.view];
        [transitionContext.containerView addSubview:fromViewController.view];
        toViewController.view.transform = CGAffineTransformMakeScale(1,1);
        toViewController.view.frame = fromViewController.view.bounds;
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            fromViewController.view.alpha = 0;
            fromViewController.view.transform = CGAffineTransformMakeScale(0.5, 0.5);
            toViewController.view.transform = CGAffineTransformMakeScale(1,1);
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    }
}

@end
