//
//  EGTReviewPromptMainView.m
//  EGTReviewPromptTest
//
//  Created by Trung Nguyen Van on 12/17/13.
//  Copyright (c) 2013 Trung Nguyen Van. All rights reserved.
//

#import "EGTReviewPromptMainView.h"

@implementation EGTReviewPromptMainView

-(void)awakeFromNib
{
    notifcationCenter = [NSNotificationCenter defaultCenter];
}

- (IBAction)reviewInITunes:(id)sender
{
    //[self showView:PopupViewTypeWebView];
    //[_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_reviewURL]]];
    [self dismissView:nil];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:_reviewURL]];
}

- (IBAction)dismissView:(id)sender
{
    [notifcationCenter postNotificationName:DISMISS_PROMPT_VIEW object:nil];
}

- (IBAction)sendFeedback:(id)sender
{
    [notifcationCenter postNotificationName:SEND_FEEDBACK object:nil];
}

-(void)showView:(PopupViewType)type
{
    if(currentView && [currentView superview])
        [currentView removeFromSuperview];
    switch (type) {
        case PopupViewTypeReview:
            currentView = self.reviewView;
            break;
        case PopupViewTypeFeedback:
            currentView = self.feedbackView;
            break;
        case PopupViewTypeWebView:
            currentView = self.iTunesView;
            break;
        default:
            break;
    }
    currentView.frame = self.bounds;
    [self addSubview:currentView];
}


@end
