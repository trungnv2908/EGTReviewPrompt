//
//  EGTReviewPromptViewController.h
//  EGTReviewPromptTest
//
//  Created by Trung Nguyen Van on 12/17/13.
//  Copyright (c) 2013 Trung Nguyen Van. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^AlertViewHandler)(UIAlertView* alertView,NSInteger selectedIndex);

@interface BlockAlertView : UIAlertView

@property (nonatomic,strong)AlertViewHandler handler;

@end

@interface EGTReviewPrompt : UIViewController <UIAlertViewDelegate>

@property (nonatomic,readwrite)UIViewController* fromViewController;
@property (nonatomic,strong)NSString* feedBackEmail;
@property (nonatomic,strong)NSString* reviewURL;

-(void) interruptUserFromViewController:(UIViewController*)viewController;

@end

