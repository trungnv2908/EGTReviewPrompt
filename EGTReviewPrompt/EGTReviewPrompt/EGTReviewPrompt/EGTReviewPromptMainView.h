//
//  EGTReviewPromptMainView.h
//  EGTReviewPromptTest
//
//  Created by Trung Nguyen Van on 12/17/13.
//  Copyright (c) 2013 Trung Nguyen Van. All rights reserved.
//

#import <UIKit/UIKit.h>

#define DISMISS_PROMPT_VIEW         @"DISMISS_PROMPT_VIEW"
#define SEND_FEEDBACK               @"SEND_FEEDBACK"

typedef NS_ENUM(int, PopupViewType)
{
    PopupViewTypeReview = 0,
    PopupViewTypeWebView,
    PopupViewTypeFeedback,
};

@interface EGTReviewPromptMainView : UIView
{
    UIView* currentView;
    NSNotificationCenter* notifcationCenter;
}
@property (strong, nonatomic) IBOutlet UIView *reviewView;
@property (strong, nonatomic) IBOutlet UIView *iTunesView;
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) IBOutlet UIView *feedbackView;

@property (nonatomic,strong)NSString* feedBackEmail;
@property (nonatomic,strong)NSString* reviewURL;

- (IBAction)reviewInITunes:(id)sender;
- (IBAction)dismissView:(id)sender;
- (IBAction)sendFeedback:(id)sender;
-(void)showView:(PopupViewType)type;
@end
