//
//  TweetContainer.m
//  iLogger
//
//  Created by Thomas Dohmke on 14.10.09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TweetContainer.h"

@implementation TweetContainer

- (id)init {
  if (self = [super init]) {
    NSArray *files = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *liveDatabasePath = [[files objectAtIndex:0] stringByAppendingPathComponent:@"tweets.db"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:liveDatabasePath]) {
      NSString *resourceDatabasePath = [[NSBundle mainBundle] pathForResource:@"tweets" ofType:@"db"];
      [[NSFileManager defaultManager] copyItemAtPath:resourceDatabasePath toPath:liveDatabasePath error:nil];
    }
      
    if (sqlite3_open([liveDatabasePath UTF8String], &db)) {
      NSLog(@"Could not open database.");
    }
  }
  return self;
}

- (void)createTable {
  sqlite3_stmt *statement;
  sqlite3_prepare_v2(db, "CREATE TABLE tweets (id INTEGER PRIMARY KEY NOT NULL, message VARCHAR(255));", -1, &statement, NULL);
  
  if (!sqlite3_step(statement)) {
    NSLog(@"Table could not be created.");
  }
  sqlite3_finalize(statement);
}

- (BOOL)saveTweet:(NSString *)message {
  sqlite3_stmt *statement;
  sqlite3_prepare_v2(db, "INSERT INTO tweets (message) VALUES (?)", -1, &statement, NULL);
  sqlite3_bind_text(statement, 1, [message UTF8String], -1, SQLITE_TRANSIENT);
  
  if (!sqlite3_step(statement)) {
    NSLog(@"Tweet not saved.");
    sqlite3_finalize(statement);
    return NO;
  }
  else {
    sqlite3_finalize(statement);
    return YES;
  }
}

- (NSArray *)fetchTweets {
  sqlite3_stmt *statement;
  sqlite3_prepare_v2(db, "SELECT message FROM tweets ORDER BY id DESC", -1, &statement, NULL);
  
  NSMutableArray *results = [[NSMutableArray alloc] init];
  while (sqlite3_step(statement) == SQLITE_ROW) {
    [results addObject:[NSString stringWithUTF8String:(char*)sqlite3_column_text(statement, 0)]];
  }
  
  sqlite3_finalize(statement);
  return [results autorelease];
}

- (void)dealloc {
  sqlite3_close(db);
  [super dealloc];
}

@end
