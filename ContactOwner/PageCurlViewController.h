//
//  PageCurlViewController.h
//  ContactOwner
//
//  Created by 李 威 on 2/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageCurlViewController : UIViewController {
    NSMutableArray *listOfItems;
}

@property (nonatomic,retain) IBOutlet UILabel *label;
@property (nonatomic,retain) NSMutableArray *listOfItems;

@end
