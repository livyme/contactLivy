//
//  Page2.m
//  ContactOwner
//
//  Created by 李 威 on 2/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Page2.h"

@implementation Page2
@synthesize sliderRed;
@synthesize sliderGreen;
@synthesize sliderBlue;
@synthesize sliderAlpha;
@synthesize redValue;
@synthesize greenValue;
@synthesize blueValue;
@synthesize alphaValue;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toggleNavBar:)];
    [self.view addGestureRecognizer:gesture];
}

//- (void)viewDidUnload
//{
//    [self setSliderRed:nil];
//    [self setSliderGreen:nil];
//    [self setSliderBlue:nil];
//    [self setSliderAlpha:nil];
//    [self setRedValue:nil];
//    [self setGreenValue:nil];
//    [self setBlueValue:nil];
//    [self setAlphaValue:nil];
//    [super viewDidUnload];
//    // Release any retained subviews of the main view.
//    // e.g. self.myOutlet = nil;
//}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
- (void)toggleNavBar:(UITapGestureRecognizer *)gesture {
    BOOL barsHidden = self.navigationController.navigationBar.hidden;
    [self.navigationController setNavigationBarHidden:!barsHidden animated:YES];
}

- (IBAction) updateBackgroundColor {
    self.view.backgroundColor = [UIColor colorWithRed:sliderRed.value/255 green:sliderGreen.value/255 blue:sliderBlue.value/255 alpha:sliderAlpha.value];
//    self.view.backgroundColor = [UIColor colorWithRed:34 green:55/255 blue:12/255 alpha:01];
  redValue.text = [NSString stringWithFormat:@"%.0f", sliderRed.value];
  greenValue.text = [NSString stringWithFormat:@"%.0f", sliderGreen.value];
  blueValue.text = [NSString stringWithFormat:@"%.0f", sliderBlue.value];
  alphaValue.text = [NSString stringWithFormat:@"%.2f", sliderAlpha.value];  
}


@end
