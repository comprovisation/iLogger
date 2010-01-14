//
//  RootViewController.m
//  iLogger
//
//  Created by Thomas Dohmke on 06.10.09.
//  Copyright Thomas Dohmke 2009. All rights reserved.
//

#import "TweetsViewController.h"
#import "ComposeViewController.h"
#import "TweetContainer.h"

@implementation TweetsViewController

@synthesize composeViewController;
@synthesize tweetContainer;
@synthesize tweets;

- (void)viewDidLoad {
  tweetContainer = [[TweetContainer alloc] init];
  [tweetContainer createTable];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  self.tweets = [tweetContainer fetchTweets];
  [self.tableView reloadData];
}

#pragma mark Button Delegates

- (IBAction)clickedCompose:(id)sender {
  [self presentModalViewController:composeViewController animated:YES];
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [tweets count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *CellIdentifier = @"Cell";
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
  }
  
	cell.textLabel.text = [tweets objectAtIndex:indexPath.row];
  
  return cell;
}

- (void)dealloc {
  [tweetContainer release];
  [super dealloc];
}


@end

