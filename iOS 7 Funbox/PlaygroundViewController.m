//
//  PlaygroundViewController.m
//  iOS 7 Funbox
//
//  Created by Nanyi Jiang on 10/24/2013.
//  Copyright (c) 2013 Nanyi Jiang. All rights reserved.
//

#import "PlaygroundViewController.h"

@interface PlaygroundViewController ()

@end

@implementation PlaygroundViewController

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
	// Do any additional setup after loading the view.
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
    v.backgroundColor = [UIColor blackColor];
    [self.view addSubview:v];
    [UIView animateWithDuration:5 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.3 options:0 animations:^{
        v.frame = CGRectMake(100, 100, 100, 50);
    } completion:nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [UIView animateWithDuration:5 animations:^{
            CGRect frame = self.imageView.frame;
            frame.origin.y = 300;
            self.imageView.frame = frame;
        }];
    });
    
}

@end
