//
//  Page22.m
//  ContactOwner
//
//  Created by 李 威 on 2/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Page22.h"
#import "Brain.h"

@interface Page22 ()
@property (nonatomic, strong) Brain *brain;
@property (nonatomic) CGPoint originalCenter;
@end

@implementation Page22
@synthesize meters;
@synthesize feet;
@synthesize feetInt;
@synthesize inch;
@synthesize gasCNY;
@synthesize gasUSD;
@synthesize usdToCNY;
@synthesize mpg;
@synthesize lper100km;
@synthesize brain=_brain;
@synthesize originalCenter;

-(Brain *) brain {
    if (!_brain) _brain= [[Brain alloc]init];
    return _brain;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)didReceiveMemoryWarning {
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
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Length Converter";
    self.originalCenter = self.view.center;
}


//- (void)viewDidUnload
//{
//  [self setMeters:nil];
//  [self setFeet:nil];
//  [self setFeetInt:nil];
//  [self setInch:nil];
//  [self setGasCNY:nil];
//  [self setGasUSD:nil];
//  [self setUsdToCNY:nil];
//  [self setMpg:nil];
//  [self setLper100km:nil];
//  [super viewDidUnload];
//  // Release any retained subviews of the main view.
//  // e.g. self.myOutlet = nil;
//}
- (void) restoreFrame {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.25];
    self.view.center = CGPointMake(self.originalCenter.x, self.originalCenter.y-45);
    [UIView commitAnimations];
}

//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
//{
//  // Return YES for supported orientations
//  return (interfaceOrientation == UIInterfaceOrientationPortrait);
//}

#pragma mark - Conversations

-(void) updateTextFields {
    meters.text = [NSString stringWithFormat:@"%.2f", meterValue];
    feet.text = [NSString stringWithFormat:@"%.2f", feetValue];
    feetInt.text = [NSString stringWithFormat:@"%i", (int)feetValue];
    inch.text = [NSString stringWithFormat:@"%.2f", inchValue];
}

- (IBAction)feetEdited {
    feetValue = feet.text.floatValue;
    meterValue = [self.brain feetToMetersConvertion:feetValue];
    inchValue = (feetValue - (int)feetValue )*12;
    [self updateTextFields];
}
- (IBAction)metersEdited:(id)sender {
    meterValue = meters.text.floatValue;
    feetValue = [self.brain metersToFeetConvertion:meterValue];
    feet.text = [NSString stringWithFormat:@"%.2f", feetValue];
    [self feetEdited];
}

- (IBAction)inchEdited: (id) sender {
    UITextField *i = (UITextField *)sender;
    inchValue = i.text.floatValue;
    feetInIntValue = feetInt.text.floatValue;
    feetValue = [self.brain feetAndInchToFeet:feetInIntValue withInch:inchValue];
    feet.text = [NSString stringWithFormat:@"%.2f", feetValue];
    [self feetEdited];
    [self updateTextFields];
}

- (void) updateGasValues {
    gasUSD.text = [NSString stringWithFormat:@"%.2f", gasUSDValue];
    gasCNY.text = [NSString stringWithFormat:@"%.2f", gasCNYValue];
    usdToCNY.text = [NSString stringWithFormat:@"%.2f", usdToCNYValue];
    
}



- (IBAction)gasEdited:(UITextField *)sender {
    usdToCNYValue = usdToCNY.text.floatValue;
    if (sender == gasCNY) {
        gasCNYValue = gasCNY.text.floatValue;
        gasUSDValue = gasCNYValue / 0.264172052 / usdToCNYValue;
    } else if (sender ==gasUSD) {
        gasUSDValue = gasUSD.text.floatValue;
        gasCNYValue = gasUSDValue * usdToCNYValue / 3.78541178;
    } else {
        gasCNYValue = 0;
        gasUSDValue = 0;
    }
    [self restoreFrame];
    [self updateGasValues];
    
}

- (IBAction)mpgEdited:(id)sender {
    float x = mpg.text.floatValue;
    lper100km.text = [NSString stringWithFormat:@"%.2f",235.214583/x ];
    [self restoreFrame];
}

- (IBAction)lper100kmEdited:(id)sender {
    float x = lper100km.text.floatValue;
    mpg.text = [NSString stringWithFormat:@"%.2f",235.214583 /x];
    [self restoreFrame];
}


- (IBAction) editingDidBegin: (UITextField *) sender {
    float y;
    if ((sender == gasCNY) || (sender == gasUSD) || (sender == usdToCNY)) {
        y = 100;
    }
    else if ((sender == mpg) || (sender == lper100km)){
        y = 80;
    }
    else {
        y=0;
    }
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.25];
    self.view.center = CGPointMake(self.originalCenter.x, y);
    [UIView commitAnimations];
}



- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    [theTextField resignFirstResponder];
    return YES;
}

-(void) hideKeyboard {
    [meters resignFirstResponder];
    [feet resignFirstResponder];
    [feetInt resignFirstResponder];
    [inch resignFirstResponder];
    [gasCNY resignFirstResponder];
    [gasUSD resignFirstResponder];
    [usdToCNY resignFirstResponder];
    [mpg resignFirstResponder];
    [lper100km resignFirstResponder];
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self hideKeyboard];
}



@end
