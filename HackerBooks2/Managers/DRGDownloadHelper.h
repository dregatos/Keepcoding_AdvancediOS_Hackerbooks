//
//  DRGDownloadManager.h
//  HackerBooks2
//
//  Created by David Regatos on 14/04/15.
//  Copyright (c) 2015 DRG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DRGDownloadHelper : NSObject

// Returns the list of books given by the server
+ (NSArray *)downloadBookList;

@end
