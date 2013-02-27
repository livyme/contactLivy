//
//  FirstPage.m
//  ContactOwner
//
//  Created by 李 威 on 2/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FirstPage.h"
#import "Brain.h"

@implementation FirstPage
@synthesize secondNumber;
@synthesize result;
@synthesize sliderA;
@synthesize sliderB;
@synthesize firstNumber;

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



 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
 [super viewDidLoad];
 }


#pragma mark - Methods

- (void) updateLabel {
     if (firstNumberValue>100 || firstNumberValue<-100 || secondNumberValue>100 || secondNumberValue <-100) 
        result.text = @"Overflow";
    else
        result.text = [NSString stringWithFormat:@"%.2f", firstNumberValue + secondNumberValue];
}

- (void) updateTextfields {
    firstNumber.text = [NSString stringWithFormat:@"%.2f",firstNumberValue];
    secondNumber.text = [NSString stringWithFormat:@"%.2f", secondNumberValue];
}
- (void) updateSliders {
    sliderA.value = firstNumberValue;
    sliderB.value = secondNumberValue;
}

-(void) hideKeyboard {
    [firstNumber resignFirstResponder];
    [secondNumber resignFirstResponder];
}

- (IBAction)dateEntered {
    firstNumberValue = [firstNumber.text floatValue];
    secondNumberValue = [secondNumber.text floatValue];
    [self updateLabel];
    [self updateSliders];
}

- (IBAction)slidersSlide {
    firstNumberValue = sliderA.value;
    secondNumberValue = sliderB.value;
    [self updateTextfields];
    [self updateLabel];
}

#pragma mark - touch responses
- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
	// When the user presses return, take focus away from the text field so that the keyboard is dismissed.
    [theTextField resignFirstResponder];
    [self updateLabel];

	return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self hideKeyboard];
    [super touchesBegan:touches withEvent:event];

}
- (IBAction)enterPressed:(id)sender {
    NSString *s = [sender currentTitle];
    firstNumber.text = s;    
}

@end
