//
//  EGTReviewPromptViewController.m
//  EGTReviewPromptTest
//
//  Created by Trung Nguyen Van on 12/17/13.
//  Copyright (c) 2013 Trung Nguyen Van. All rights reserved.
//

#import "EGTReviewPrompt.h"
#import "EGTReviewPromptMainView.h"
#import <MessageUI/MessageUI.h>

@implementation BlockAlertView


-(void)showWithHandler:(AlertViewHandler)handler
{
    self.delegate = self;
    self.handler = handler;
    [self show];
}

#pragma mark - UIAlertView
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(self.handler)
        self.handler(alertView,buttonIndex);
    
}

@end


@interface EGTReviewPrompt ()<MFMailComposeViewControllerDelegate>
{
    EGTReviewPromptMainView *mainView;
    NSNotificationCenter* notifcationCenter;
}
-(void)_showReviewScreen;
-(void)_showFeedbackScreen;

@end

@implementation EGTReviewPrompt

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        notifcationCenter = [NSNotificationCenter defaultCenter];
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [notifcationCenter addObserver:self selector:@selector(_dismissView) name:DISMISS_PROMPT_VIEW object:nil];
    [notifcationCenter addObserver:self selector:@selector(_sendFeedBack) name:SEND_FEEDBACK object:nil];
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [notifcationCenter removeObserver:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    mainView = [[NSBundle mainBundle] loadNibNamed:@"EGTReviewPromptMainView" owner:self options:nil][0];
    self.view = mainView;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - MFMailComposeViewController
- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    BOOL dismiss = NO;
    switch (result) {
        case MFMailComposeResultCancelled:
        case MFMailComposeResultFailed:
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"Feedback sent unsuccessfully." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alertView show];
            break;
        }
        case MFMailComposeResultSent:
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"Feedback sent successfully" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alertView show];
            dismiss = YES;
            break;
        }
        case MFMailComposeResultSaved:
            dismiss = YES;
            break;
        default:
            break;
    }
    if(dismiss)
    {
        [controller dismissViewControllerAnimated:NO completion:nil];
        double delayInSeconds = 0.1;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [self dismissViewControllerAnimated:YES completion:nil];
        });
    }
}

#pragma mark - Methods
-(void)_sendFeedBack
{
    Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
	if (mailClass != nil)
    {
        if ([mailClass canSendMail])
        {
            MFMailComposeViewController *mailComposer = [[MFMailComposeViewController alloc] init];
            mailComposer.mailComposeDelegate = self;
            if(_feedBackEmail)
                [mailComposer setToRecipients:@[_feedBackEmail]];
            [self presentViewController:mailComposer animated:YES completion:nil];
            return;
        }
    }
//    NSString *email = [NSString stringWithFormat:@"mailto:&subject=%@&body=%@",title,body];
//    email = [email stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:email]];
}

-(void)_dismissView
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)interruptUserFromViewController:(UIViewController*)viewController
{
    self.fromViewController = viewController;
    
    BlockAlertView* alertView = [[BlockAlertView alloc] initWithTitle:nil message:@"Are you enjoying the app?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
    [alertView showWithHandler:^(UIAlertView *alertView, NSInteger selectedIndex) {
        UIWindow* window = [UIApplication sharedApplication].keyWindow;
        window.rootViewController.modalPresentationStyle = UIModalPresentationCurrentContext;
        [_fromViewController presentViewController:self animated:YES completion:nil];
        if(selectedIndex == alertView.cancelButtonIndex)
        {
            [self _showFeedbackScreen];
        }
        else
        {
            [self _showReviewScreen];
        }
    }];
}

-(void)_showReviewScreen
{
    mainView.reviewURL = _reviewURL;
    [mainView showView:PopupViewTypeReview];
}

-(void)_showFeedbackScreen
{
    [mainView showView:PopupViewTypeFeedback];
}

@end


