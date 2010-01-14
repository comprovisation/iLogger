//
//  TweetContainer.h
//  iLogger
//
//  Created by Thomas Dohmke on 14.10.09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface TweetContainer : NSObject {
  sqlite3 *db;
}

- (void)createTable;
- (BOOL)saveTweet:(NSString *)message;
- (NSArray *)fetchTweets;

@end
