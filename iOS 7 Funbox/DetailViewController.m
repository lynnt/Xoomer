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
#import <PCPieChart.h>
#import <PCLineChartView.h>
#import "DataModel.h"
#import "FloatTextView.h"

@interface DetailViewController ()
@property (nonatomic) FXBlurView *blurView;
@property (nonatomic) GalleryViewController *galleyViewController;
@property (nonatomic) PCPieChart *pieChart;
@property (nonatomic) FloatTextView *floatTextView;
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
        } else if ([obj class] == [PieGraph class]) {
            
            self.pieChart = [[PCPieChart alloc] initWithFrame:CGRectMake(10, 300, self.view.bounds.size.width - 20, 120)];
            [self.view addSubview:self.pieChart];
            self.pieChart.diameter = 100;
            NSMutableArray *array = [[NSMutableArray alloc] init];
            for (NSString *key in ((PieGraph *)obj).data) {
                float percent = [((PieGraph *)obj).data[key] floatValue];
                PCPieComponent *comp = [PCPieComponent pieComponentWithTitle:key value:percent * 360];
                if ([[((PieGraph *)obj) primary] isEqualToString:key]) {
                    comp.colour = PCColorBlue;
                } else {
                    comp.colour = PCColorDefault;
                }
                [array addObject:comp];
            }
            self.pieChart.components = array;
            [self.view addSubview:self.pieChart];
            
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 420, self.view.bounds.size.width - 20, 30)];
            label.font = [UIFont boldSystemFontOfSize:20];
            label.text = @"POPULATION";
            [self.view addSubview:label];
            label.textAlignment = NSTextAlignmentCenter;
        }
    }
    
    CGRect rect = CGRectMake(0, 380, self.view.bounds.size.width - 20, self.view.bounds.size.height - 400);
    self.floatTextView = [[FloatTextView alloc] initWithFrame:rect];
    self.floatTextView.array = tag.quotes;
    if ([tag.quotes count]) {
        [self.floatTextView startAnimating];
    }
    [self.view insertSubview:self.floatTextView belowSubview:self.pieChart];
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
