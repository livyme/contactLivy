//
//  FlipsideViewController.m
//  ContactOwner
//
//  Created by 李 威 on 2/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FlipsideViewController.h"

@implementation FlipsideViewController

@synthesize delegate = _delegate;
@synthesize label,  imgThx;

- (void)awakeFromNib
{
    self.contentSizeForViewInPopover = CGSizeMake(320.0, 480.0);
    [super awakeFromNib];
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [label setText:@"Thank you for finding my iPhone.\nYour effort in returning this iPhone is greatly appreciated."];
    self.imgThx.image = [UIImage imageNamed:@"thanks2.jpg"];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

#pragma mark - Actions

//- (IBAction)done:(id)sender
//{
//    [self.delegate flipsideViewControllerDidFinish:self];
//}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event 
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
