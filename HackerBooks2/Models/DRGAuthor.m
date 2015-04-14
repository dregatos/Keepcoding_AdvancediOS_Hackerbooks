#import "DRGAuthor.h"
#import "DRGWriter.h"

@interface DRGAuthor ()

// Private interface goes here.

@end

@implementation DRGAuthor

// Custom logic goes here.
+ (instancetype)authorNamed:(NSString *)name
                     ofBook:(DRGBook *)book
                withContext:(NSManagedObjectContext *)context {
    
    DRGAuthor *author = [DRGAuthor insertInManagedObjectContext:context];
    author.writer = [DRGWriter writerNamed:name withContext:context];
    author.book = book;
    
    return author;
}

@end
