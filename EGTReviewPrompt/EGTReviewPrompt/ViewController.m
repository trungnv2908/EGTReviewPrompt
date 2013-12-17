//
//  ViewController.m
//  EGTReviewPrompt
//
//  Created by Trung Nguyen Van on 12/17/13.
//  Copyright (c) 2013 Trung Nguyen Van. All rights reserved.
//

#import "ViewController.h"
#import "EGTReviewPrompt.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    EGTReviewPrompt* viewController = [[EGTReviewPrompt alloc] init];
    viewController.feedBackEmail = @"trungnv2908@gmail.com";
    viewController.reviewURL = @"https://itunes.apple.com/vn/app/valet-up/id680467299?mt=8";
    [viewController interruptUserFromViewController:self];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
