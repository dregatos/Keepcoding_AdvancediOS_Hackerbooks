#import "DRGLabel.h"

@interface DRGLabel ()

// Private interface goes here.

@end

@implementation DRGLabel

// Custom logic goes here.

+ (instancetype)labelNamed:(NSString *)name withContext:(NSManagedObjectContext *)context {
    
    NSString *normalizedName = [self normalize:name];
    
    // Check if it already exists
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[[self class] entityName]];
    req.predicate = [NSPredicate predicateWithFormat:@"name MATCHES[cd] %@",normalizedName];
    
    NSArray *results = [context executeFetchRequest:req error:nil];
    
    DRGLabel *label;
    if ([results count] == 0) {
        // Create a new one
        label = [DRGLabel insertInManagedObjectContext:context];
        label.name = normalizedName;
    } else if ([results count] == 1) {
        // Use previous one
        label = [results lastObject];
    } else if ([results count] > 1) {
        NSLog(@"Duplicated!! Label \'%@\' was found %lu times on our DB", normalizedName, (unsigned long)[results count]);
    }
    
    return label;
}

+ (NSString *)normalize:(NSString *)aString {
        
    NSString *norm;
    if ([aString isEqualToString:FAVORITE_LABEL]) {
        norm = FAVORITE_LABEL;
    } else if (aString.length <= 1) {
        norm = [aString capitalizedString];
    } else {
        norm = [NSString stringWithFormat:@"%@%@",[[aString substringToIndex:1] uppercaseString],[[aString substringFromIndex:1]lowercaseString]];
    }
    return norm;
}

#pragma mark - Comparison

- (NSComparisonResult)compare:(DRGLabel *)other {
    
    /* favorite always comes first */
    if ([self.name isEqualToString:other.name]) {
        return NSOrderedSame;
    } else if ([self.name isEqualToString:FAVORITE_LABEL]) {
        return NSOrderedAscending;
    } else if ([other.name isEqualToString:FAVORITE_LABEL]) {
        return NSOrderedDescending;
    } else {
        return [self.name compare:other.name];
    }
}

@end
