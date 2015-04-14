//
//  UIViewController+Navigation.m
//  Everpobre
//
//  Created by David Regatos on 08/04/15.
//  Copyright (c) 2015 DRG. All rights reserved.
//

#import "UIViewController+Navigation.h"

@implementation UIViewController (Navigation)

- (UINavigationController *)wrappedInNavigationController {
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:self];    
    return nav;
}

@end
