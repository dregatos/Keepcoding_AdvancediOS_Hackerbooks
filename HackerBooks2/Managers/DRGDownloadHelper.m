//
//  DRGDownloadManager.m
//  HackerBooks2
//
//  Created by David Regatos on 14/04/15.
//  Copyright (c) 2015 DRG. All rights reserved.
//

#import "DRGDownloadHelper.h"

@implementation DRGDownloadHelper

+ (NSArray *)downloadBookList {
    
    // Download library JSON
    NSData *libraryData = [self downloadLibraryDataFromServer];
    
    // Parse JSON
    NSError *error;
    id JSONObject = [NSJSONSerialization JSONObjectWithData:libraryData
                                                    options:kNilOptions
                                                      error:&error];
    
    if (JSONObject == nil || error) {
        NSLog(@"JSON Parse failed with error: %@", error.userInfo);
        return nil;
    }
    
    // Create bookList (Array of dictionaries)
    NSArray *bookList;
    if ([JSONObject isKindOfClass:[NSArray class]]) {  // Array of dictionaries
        bookList = (NSArray *)JSONObject;
    } else if ([JSONObject isKindOfClass:[NSDictionary class]]) {   // A dictionary
        bookList = @[(NSDictionary *)JSONObject];
    }
    
    return bookList;
}

+ (NSData *)downloadLibraryDataFromServer {
    // Download library
    NSData *libraryData = [DRGDownloadHelper downloadJSONFromURL:[NSURL URLWithString:@"https://t.co/K9ziV0z3SJ"]];
    return libraryData;
}

#pragma mark - Helpers

+ (NSData *)downloadJSONFromURL:(NSURL *)jsonURL {
    
    NSURLRequest *request = [NSURLRequest requestWithURL:jsonURL];
    
    NSError *error;
    NSURLResponse *response = [[NSURLResponse alloc] init];
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    if (error || data == nil) {
        NSLog(@"Download data failed. Error: %@", error.localizedDescription);
    }
    
    return data;
}

@end
