//
//  Brain.m
//  ContactOwner
//
//  Created by 李 威 on 2/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Brain.h"

@implementation Brain

- (float) addThisNumber: (float) a withThisNumber: (float) b {
    return a+b;
}

- (float) metersToFeetConvertion: (float) sender {
    return sender*3.28083989501312;
}
- (float) feetToMetersConvertion: (float) sender {
    return sender / 3.28083989501312;
}
- (int) metersToFeetIntValue : (float) sender {
    return (int)(sender*3.28083989501312);
}
- (float) metersToInches: (float)sender {
    int a;
    float b;
    a = (int) (sender*3.28083989501312) ;
    b = sender*3.28083989501312;
    return (b-a)*12;
}
-(float) feetAndInchToMeter : (float) feet withInch:(float) inch{
    return inch*0.0254 + feet/3.28083989501312;
}
- (float) feetAndInchToFeet :(float) feet withInch:(float) inch{
    return feet+inch/12;
}
- (NSString *)  floatTOString: (float) sender{
    return [NSString stringWithFormat:@"%.2f", sender];
}

@end
