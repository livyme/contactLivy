//
//  Brain.h
//  ContactOwner
//
//  Created by 李 威 on 2/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Brain : NSObject {

    float number;
//    float meters;
//    float feet;
//    int feetIntValue;
//    float inches;
}


- (float) addThisNumber: (float) a withThisNumber: (float) b;

- (float) metersToFeetConvertion: (float) sender;
- (float) feetToMetersConvertion: (float) sender;
- (int) metersToFeetIntValue : (float) sender;
- (float) metersToInches: (float)sender;
-(float) feetAndInchToMeter : (float) feet withInch:(float) inch;
- (float) feetAndInchToFeet :(float) feet withInch:(float) inch;

- (NSString *)  floatTOString: (float) sender;
@end
