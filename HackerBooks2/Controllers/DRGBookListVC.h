//
//  DRGBookListVC.h
//  HackerBooks2
//
//  Created by David Regatos on 14/04/15.
//  Copyright (c) 2015 DRG. All rights reserved.
//

#import "DRGBaseTableVC.h"
#import "DRGBookDetailVCDelegate.h"

@interface DRGBookListVC : DRGBaseTableVC <DRGBookDetailVCDelegate,UISearchResultsUpdating>

@property (nonatomic, strong) UISearchController *searchController;

@end
