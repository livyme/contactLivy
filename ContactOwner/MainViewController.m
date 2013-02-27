//
//  MainViewController.m
//  ContactOwner
//
//  Created by 李 威 on 2/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

NSString * const myPhoneNumber = @"203-LIU-QIAN";

#import "MainViewController.h"


@implementation MainViewController
@synthesize flashButton;

@synthesize flipsidePopoverController = _flipsidePopoverController;
@synthesize callButton, cautionLabel;
@synthesize AVSession;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self.callButton setTitle:myPhoneNumber forState:UIControlStateNormal];
	[self.cautionLabel setText:@"This iPhone belongs to Livy.\n If found, \nplease tap below to contact my wife"];
    // Do any additional setup after loading the view, typically from a nib.
    
}

//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
//{
//    // Return YES for supported orientations
//    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
//        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
//    } else {
//        return YES;
//    }
//}

#pragma mark - Flipside View Controller

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        [self dismissModalViewControllerAnimated:YES];
    } else {
        [self.flipsidePopoverController dismissPopoverAnimated:YES];
        self.flipsidePopoverController = nil;
    }
}

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    self.flipsidePopoverController = nil;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
        
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
            UIPopoverController *popoverController = [(UIStoryboardPopoverSegue *)segue popoverController];
            self.flipsidePopoverController = popoverController;
            popoverController.delegate = self;
        }
    }
}

- (IBAction)togglePopover:(id)sender
{
    if (self.flipsidePopoverController) {
        [self.flipsidePopoverController dismissPopoverAnimated:YES];
        self.flipsidePopoverController = nil;
    } else {
        [self performSegueWithIdentifier:@"showAlternate" sender:sender];
    }
}

-(IBAction)callOwner:(id)sender { 
    NSString *callNumber;
    callNumber = [@"tel:" stringByAppendingString:myPhoneNumber];
    NSLog(@"%@", callNumber);
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: callNumber]];

}

- (void)toggleFlashlight
{
  AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
  
  if (device.torchMode == AVCaptureTorchModeOff)
  {
    // Create an AV session
    AVCaptureSession *session = [[AVCaptureSession alloc] init];
    
    // Create device input and add to current session
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device error: nil];
    [session addInput:input];
    
    // Create video output and add to current session
    AVCaptureVideoDataOutput *output = [[AVCaptureVideoDataOutput alloc] init];
    [session addOutput:output];
    
    // Start session configuration
    [session beginConfiguration];
    [device lockForConfiguration:nil];
    
    // Set torch to on
    [device setTorchMode:AVCaptureTorchModeOn];
    
    [device unlockForConfiguration];
    [session commitConfiguration];
    
    // Start the session
    [session startRunning];
    
    // Keep the session around
    [self setAVSession:session];
    
  }
  else
  {
    [AVSession stopRunning];
  }
}

- (IBAction)flashlight:(id)sender {
  AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
  if ([device hasTorch] == YES) {
    [self toggleFlashlight];
  }
}


- (void)viewDidUnload {
  [self setFlashButton:nil];
  [super viewDidUnload];
}
@end
