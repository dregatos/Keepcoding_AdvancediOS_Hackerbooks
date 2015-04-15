//
//  DRGBookDetailVC.h
//  HackerBooks2
//
//  Created by David Regatos on 15/04/15.
//  Copyright (c) 2015 DRG. All rights reserved.
//

@import UIKit;

@class DRGBook;
@class DRGBookDetailVCDelegate;

#import "DRGBookDetailVCDelegate.h"

@interface DRGBookDetailVC : UIViewController <UISplitViewControllerDelegate>

@property (nonatomic, weak) id<DRGBookDetailVCDelegate> delegate;

- (instancetype)initWithBook:(DRGBook *)aBook;

@end
