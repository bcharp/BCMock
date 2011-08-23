//
//  categoryLikeMockViewController.m
//  categoryLikeMock
//
//  Created by boris charpentier on 23/08/11.
//  Copyright 2011 bcharp. All rights reserved.
//

#import "BCMockViewController.h"
#import "Test.h"
#import "Other.h"
#import "BCMock.h"

@implementation BCMockViewController

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


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    Other *other = [[Other alloc] init];
    BCMock *mock = [[BCMock alloc] initWithClass:[Test class]];
    
    [mock when:@selector(oneParameter:) jumpTo:@selector(hello) On:other];
    
    [mock anotherOneParameter:@"YATTAAAA"];
    [mock oneParameter:@"test"];
    
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
