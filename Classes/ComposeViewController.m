//
//  ComposeViewController.m
//  iLogger
//
//  Created by Thomas Dohmke on 06.10.09.
//  Copyright 2009 Thomas Dohmke. All rights reserved.
//

#import "ComposeViewController.h"
#import "TweetsViewController.h"
#import "TweetContainer.h"

@implementation ComposeViewController

@synthesize textView;
@synthesize tweetsViewController;

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [textView becomeFirstResponder];
}

- (IBAction)clickedCancel:(id)sender {
  [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)clickedSave:(id)sender {
  [[tweetsViewController tweetContainer] saveTweet:[textView text]];
  [textView setText:@""];
  [self dismissModalViewControllerAnimated:YES];
}

- (void)dealloc {
  [super dealloc];
}


@end
