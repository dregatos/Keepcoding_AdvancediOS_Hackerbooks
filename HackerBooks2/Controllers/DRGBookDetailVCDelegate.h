//
//  DRGBookDetailVCDelegate.h
//  HackerBooks2
//
//  Created by David Regatos on 15/04/15.
//  Copyright (c) 2015 DRG. All rights reserved.
//

@import Foundation;

@class DRGBookDetailVC;
@class DRGBook;

@protocol DRGBookDetailVCDelegate <NSObject>

@optional
- (void)bookDetailVC:(DRGBookDetailVC *)bookDetailVC didMarkBookAsFavorite:(DRGBook *)book;

@end
