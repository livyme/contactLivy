//
//  MainViewController.h
//  ContactOwner
//
//  Created by 李 威 on 2/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
extern NSString * const myPhoneNumber;


#import "FlipsideViewController.h"
#import <AVFoundation/AVFoundation.h>


@interface MainViewController : UIViewController </*FlipsideViewControllerDelegate, */UIPopoverControllerDelegate> {
  BOOL flashlightOn;
}
@property (nonatomic, retain) AVCaptureSession *AVSession;
@property (strong, nonatomic) UIPopoverController *flipsidePopoverController;
@property (nonatomic, retain) IBOutlet UIButton *callButton;
@property (nonatomic, retain) IBOutlet UILabel *cautionLabel;
@property (retain, nonatomic) IBOutlet UIButton *flashButton;

@end
