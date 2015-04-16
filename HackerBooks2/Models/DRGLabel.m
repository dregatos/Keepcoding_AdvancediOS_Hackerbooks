#import "DRGLabel.h"

@interface DRGLabel ()

// Private interface goes here.

@end

@implementation DRGLabel

// Custom logic goes here.

+ (instancetype)labelNamed:(NSString *)name withContext:(NSManagedObjectContext *)context {
    
    // Check if it already exists
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[[self class] entityName]];
    req.predicate = [NSPredicate predicateWithFormat:@"name MATCHES[cd] %@",name];
    
    NSArray *results = [context executeFetchRequest:req error:nil];
    
    DRGLabel *label;
    if ([results count] == 0) {
        // Create a new one
        label = [DRGLabel insertInManagedObjectContext:context];
        label.name = name;
    } else if ([results count] == 1) {
        // Use previous one
        label = [results lastObject];
    } else if ([results count] > 1) {
        NSLog(@"Duplicated!! Label \'%@\' was found %lu times on our DB", name, [results count]);
    }
    
    return label;
}

@end
