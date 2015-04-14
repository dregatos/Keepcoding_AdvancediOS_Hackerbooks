//
//  DRGLibraryBaseClass.m
//  HackerBooks2
//
//  Created by David Regatos on 14/04/15.
//  Copyright (c) 2015 DRG. All rights reserved.
//

#import "DRGLibraryBaseClass.h"

@implementation DRGLibraryBaseClass

#pragma mark - Class methods

+ (NSArray *)observableKeys {
    return @[];
}

#pragma mark - Life cycle

- (void)awakeFromInsert {
    [super awakeFromInsert];
    
    // Only once on life cycle
    [self setupKVO];
}

- (void)awakeFromFetch {
    [super awakeFromFetch];
    
    // n times on life cycle
    [self setupKVO];
}

- (void)willTurnIntoFault {
    [super willTurnIntoFault];
    
    // Before obj turns into fault
    [self tearDownKVO];
}

#pragma mark - KVO

- (void)setupKVO {
    
    // Register for notification
    for (NSString *key in [[self class] observableKeys]) {
        [self addObserver:self
               forKeyPath:key
                  options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew
                  context:NULL];
    }
}

- (void)tearDownKVO {
    
    // Unregister for notifications
    for (NSString *key in [[self class] observableKeys]) {
        [self removeObserver:self forKeyPath:key];
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    
    // By default do nothing
}

@end
