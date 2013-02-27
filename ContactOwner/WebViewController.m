//
//  WebViewController.m
//  ContactOwner
//
//  Created by 李 威 on 4/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController
@synthesize textField;
@synthesize activityIndicator;
@synthesize webView;

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
  activityIndicator.hidden = YES;
}

- (void)viewDidUnload
{
  [self setTextField:nil];
  [self setActivityIndicator:nil];
  [self setWebView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)editingEndByReturn:(id)sender {
  NSString *userInput = [@"http://" stringByAppendingString: textField.text];
  NSURL *url = [NSURL URLWithString:userInput];
  [webView loadRequest:[NSURLRequest requestWithURL:url]];
}
 
- (void)webViewDidStartLoad:(UIWebView *)webView {
  activityIndicator.hidden = NO;
  [activityIndicator startAnimating];
}

-(void) webViewDidFinishLoad:(UIWebView *)webView {
  [activityIndicator stopAnimating];
  activityIndicator.hidden = YES;
}

@end
