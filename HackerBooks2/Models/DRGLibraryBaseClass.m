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

#pragma mark - URI

- (NSData *)archiveURIRepresentation {
    NSURL *uri = self.objectID.URIRepresentation;
    return [NSKeyedArchiver archivedDataWithRootObject:uri];
}

+ (instancetype)unarchiveObjectWithURIRepresentation:(NSData *)archivedURI context:(NSManagedObjectContext *)context {

    NSURL *uri = [NSKeyedUnarchiver unarchiveObjectWithData:archivedURI];
    if (uri == nil) { return nil; }
    
    NSManagedObjectID *objID = [context.persistentStoreCoordinator managedObjectIDForURIRepresentation:uri];
    if (objID == nil) { return nil; }
    
    NSManagedObject *obj = [context objectWithID:objID];
    if (obj.isFault) {
        // We found it
        return (DRGLibraryBaseClass *)obj;
    } else {
        // Might not exist anymore. Let's fetch it!
        NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:obj.entity.name];
        req.predicate = [NSPredicate predicateWithFormat:@"SELF = %@", obj];
        
        NSError *error;
        NSArray *result = [context executeFetchRequest:req error:&error];
        if (result == nil) {
            NSLog(@"Unarchiving URI obj error: %@", error.userInfo);
            return nil;
        } else {
            return [result lastObject];
        }
    }
}

@end
