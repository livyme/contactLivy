//
//  PageCurlViewController.m
//  ContactOwner
//
//  Created by 李 威 on 2/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PageCurlViewController.h"

@implementation PageCurlViewController

@synthesize label;
@synthesize listOfItems;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [label setText:@"You are not supposed to see this.\nBut apperantly you have already been here.\nEnjoy yourself."];
    //Initialize the array.
    listOfItems = [[NSMutableArray alloc] init];
    
    NSArray *webSiteDoneInArray= [NSArray arrayWithObjects:@"Livyme.com", @"www.livyme.com", @"qian.livyme.com", nil];
    NSDictionary *webSiteDoneInDict = [NSDictionary dictionaryWithObject:webSiteDoneInArray forKey:@"Websites"];
    
    NSArray *websiteNotDoneInArray = [NSArray arrayWithObjects:@"livy.net", @"me.livyme.com",@"hello.livyme.com", nil];
    NSDictionary *webSiteNotDoneInDict = [NSDictionary dictionaryWithObject:websiteNotDoneInArray forKey:@"Websites"];
    
    [listOfItems addObject:webSiteDoneInDict];
    [listOfItems addObject:webSiteNotDoneInDict];
    
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return [listOfItems count];
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    //Number of rows it should expect should be based on the section
    NSDictionary *dictionary = [listOfItems objectAtIndex:section];
    NSArray *array = [dictionary objectForKey:@"Websites"];
    return [array count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    if(section == 0)
        return @"Completed";
    else
        return @"NOT completed";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
    }
    
    // Set up the cell...
    
    //First get the dictionary object
    NSDictionary *dictionary = [listOfItems objectAtIndex:indexPath.section];
    NSArray *array = [dictionary objectForKey:@"Websites"];
    NSString *cellValue = [array objectAtIndex:indexPath.row];
    cell.textLabel.text = cellValue;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //Get the selected country
    NSLog(@"Sleceted...");
    NSDictionary *dictionary = [listOfItems objectAtIndex:indexPath.section];
    NSArray *array = [dictionary objectForKey:@"Websites"];
    NSString *selectedWebsite = [array objectAtIndex:indexPath.row];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: [@"http://" stringByAppendingString: selectedWebsite]]];
    NSLog(@"%@",[@"http://" stringByAppendingString: selectedWebsite]);
}

#pragma mark - rest of the world.
- (IBAction)alertMsg {
    UIAlertView *someError = [[UIAlertView alloc] initWithTitle: @"Alert!" message: @"this is just an empty alert." delegate: self cancelButtonTitle: @"Ok" otherButtonTitles: nil];
    [someError show];
}





@end
