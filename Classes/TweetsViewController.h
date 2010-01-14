//
//  RootViewController.h
//  iLogger
//
//  Created by Thomas Dohmke on 06.10.09.
//  Copyright Thomas Dohmke 2009. All rights reserved.
//

@class ComposeViewController;
@class TweetContainer;

@interface TweetsViewController : UITableViewController {
  IBOutlet ComposeViewController *composeViewController;
  TweetContainer *tweetContainer;
  NSArray *tweets;
}

@property (nonatomic, retain) ComposeViewController *composeViewController;
@property (nonatomic, retain) TweetContainer *tweetContainer;
@property (nonatomic, retain) NSArray *tweets;

- (IBAction)clickedCompose:(id)sender;

@end
