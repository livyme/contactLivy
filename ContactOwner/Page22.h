//
//  Page22.h
//  ContactOwner
//
//  Created by 李 威 on 2/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Page22 : UIViewController <UITextFieldDelegate>{
    float meterValue;
    float feetValue;
    float feetInIntValue;
    float inchValue;
    float gasCNYValue;
    float gasUSDValue;
    float usdToCNYValue;
}

@property (retain, nonatomic) IBOutlet UITextField *meters;
@property (retain, nonatomic) IBOutlet UITextField *feet;
@property (retain, nonatomic) IBOutlet UITextField *feetInt;
@property (nonatomic , retain) IBOutlet UITextField *inch;

@property (weak, nonatomic) IBOutlet UITextField *gasCNY;
@property (weak, nonatomic) IBOutlet UITextField *gasUSD;
@property (weak, nonatomic) IBOutlet UITextField *usdToCNY;

@property (weak, nonatomic) IBOutlet UITextField *mpg;
@property (weak, nonatomic) IBOutlet UITextField *lper100km;


@end
