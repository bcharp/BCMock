//
//  BCOtherViewController.m
//  BCMock
//
//  Created by boris charpentier on 25/08/11.
//  Copyright 2011 bcharp. All rights reserved.
//

#import "BCOtherViewController.h"
#import "Test.h"
#import "BCGlobalMock.h"

@implementation BCOtherViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    //we don't reset our when jumpto, it has allready been done in another part of the app, and will always jump.
    Test *test = [[Test alloc] init];
    BCGlobalMock *gmock = [[BCGlobalMock alloc] initWithObject:test];
    [gmock anotherOneParameter:@"YATTAAAA"];
    [gmock oneParameter:@"test"];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
