//
//  ComposeViewController.h
//  iLogger
//
//  Created by Thomas Dohmke on 06.10.09.
//  Copyright 2009 Thomas Dohmke. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TweetsViewController;

@interface ComposeViewController : UIViewController {
  IBOutlet UITextView *textView;
  IBOutlet TweetsViewController *tweetsViewController;
}

@property (nonatomic, retain) TweetsViewController *tweetsViewController;
@property (nonatomic, retain) UITextView *textView;

- (IBAction)clickedCancel:(id)sender;
- (IBAction)clickedSave:(id)sender;

@end
