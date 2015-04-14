#import "DRGTag.h"
#import "DRGLabel.h"

@interface DRGTag ()

// Private interface goes here.

@end

@implementation DRGTag

// Custom logic goes here.
+ (instancetype)tagNamed:(NSString *)name
                  ofBook:(DRGBook *)book
             withContext:(NSManagedObjectContext *)context {
    
    DRGTag *tag = [DRGTag insertInManagedObjectContext:context];
    tag.label = [DRGLabel labelNamed:name withContext:context];
    tag.book = book;
    
    return tag;
}


@end
