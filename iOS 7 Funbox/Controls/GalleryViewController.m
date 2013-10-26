//
//  GalleryViewController.m
//  iOS 7 Funbox
//
//  Created by Nanyi Jiang on 10/26/2013.
//  Copyright (c) 2013 Nanyi Jiang. All rights reserved.
//

#import "GalleryViewController.h"
#import "GalleryViewCell.h"

#define kCellDim 70
#define kCellGap 5
#define kCellAmt 4

@interface GalleryViewController ()
@property (nonatomic) NSMutableArray *views;
@property (nonatomic) UIButton *button;
@property (nonatomic) UIDynamicAnimator *animator;
@end

@implementation GalleryViewController

- (id)init {
    if (self = [super init]) {
        self.views = [[NSMutableArray alloc] init];
    }
    return self;
    
}

- (void)setTransformForCell:(GalleryViewCell *)cell forIndex:(NSInteger)index {
    CALayer *layer = cell.layer;
    CGFloat scale = 3.f - index * 0.2;
    CATransform3D rotationAndPerspectiveTransform = CATransform3DMakeScale(scale,scale,scale);
    rotationAndPerspectiveTransform.m34 = 1.0 / -500;
    rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, 45.0f * M_PI / 180.0f, 0.0f, 1.0f, 0.0f);
    layer.transform = rotationAndPerspectiveTransform;
}

- (void)addImage:(UIImage *)image {
    
}

- (void)addItem:(NSDictionary *)item {
    UIImage *image = item[@"image"];
    NSString *title = [item[@"title"] uppercaseString];
    NSInteger index = [self.views count];
    GalleryViewCell *cell = [[GalleryViewCell alloc] initWithFrame:CGRectMake(150 - 30 * index, 50, kCellDim, kCellDim)];
    [self setTransformForCell:cell forIndex:index];
    [self.view insertSubview:cell belowSubview:self.button];
    if (title) {
        [cell.titleLabelView setText:title];
    }
    if (image) {
        [cell.imageView setImage:image];
    } else {
        cell.backgroundColor = [UIColor blueColor];
    }
    cell.tag = index;
    [cell addTarget:self action:@selector(snapToFullscreen:) forControlEvents:UIControlEventTouchUpInside];
    [self.views addObject:cell];
}

- (CGRect)frameForCellIndex:(NSInteger)index {
    return CGRectMake((index % kCellAmt) * (kCellDim + kCellGap) + kCellGap, (index / kCellAmt) * (kCellDim + kCellGap) + kCellGap, kCellDim, kCellDim);
}

- (CGPoint)snapPointForCellIndex:(NSInteger)index {
    return CGPointMake((index % kCellAmt) * (kCellDim + kCellGap) + kCellDim / 2, (index / kCellAmt) * (kCellDim + kCellGap) + kCellDim / 2);
}

- (void)flatOut:(UIButton *)button {
    [self.animator removeAllBehaviors];
    [UIView animateWithDuration:.5 animations:^{
        for (NSInteger i = 0; i < [self.views count]; i++) {
            GalleryViewCell *cell = [self.views objectAtIndex:i];
            UISnapBehavior *snapBehavior = [[UISnapBehavior alloc] initWithItem:cell snapToPoint:[self snapPointForCellIndex:i]];
            [self.animator addBehavior:snapBehavior];
            
            cell.layer.transform = CATransform3DIdentity;
        }
    } completion:^(BOOL finished) {
    }];
    [button removeFromSuperview];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.frame = self.view.bounds;
    [self.view addSubview:self.button];
    [self.button addTarget:self action:@selector(flatOut:) forControlEvents:UIControlEventTouchUpInside];
    
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
}

- (void)snapToFullscreen:(GalleryViewCell *)cell {
    [self.animator removeAllBehaviors];
    if (cell.fullscreen) {
        [cell setFullscreen:NO animated:YES];
        [UIView animateWithDuration:.25 animations:^{
            CGPoint p = [self snapPointForCellIndex:(NSInteger)cell.tag];
            cell.frame = CGRectMake(p.x, p.y, kCellDim, kCellDim);
        } completion:^(BOOL finished) {
            UISnapBehavior *snapBehavior = [[UISnapBehavior alloc] initWithItem:cell snapToPoint:[self snapPointForCellIndex:cell.tag]];
            [self.animator addBehavior:snapBehavior];
        }];
        
    } else {
        [cell setFullscreen:YES animated:YES];
        [self.view bringSubviewToFront:cell];
        [UIView animateWithDuration:.5 animations:^{
            cell.frame = self.view.bounds;
        }];
    }
    
}

@end
