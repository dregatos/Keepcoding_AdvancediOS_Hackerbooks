#import "DRGBook.h"
#import "DRGCover.h"
#import "DRGPdf.h"
#import "DRGAuthor.h"
#import "DRGTag.h"
#import "DRGLabel.h"

@interface DRGBook ()

// Private interface goes here.

@end

@implementation DRGBook

// Custom logic goes here.

#pragma mark - Factory

+ (instancetype)bookFromDictionary:(NSDictionary *)JSON
                       withContext:(NSManagedObjectContext *)context {
    
    // Check JSON content
    // If fetched book doesn't content a minimum info,
    // skip it.
    if (![self hasNeededInformation:JSON]) {
        return nil;
    }

    DRGBook *book = [self insertInManagedObjectContext:context];
    // title
    book.title = [JSON objectForKey:@"title"];
    // cover
    NSURL *coverURL = [NSURL URLWithString:[JSON objectForKey:@"image_url"]];
    book.cover = [DRGCover coverForURL:coverURL withContext:context];
    // pdf
    NSURL *pdfURL = [NSURL URLWithString:[JSON objectForKey:@"pdf_url"]];
    book.pdf = [DRGPdf pdfForURL:pdfURL withContext:context];
    // authors
    NSArray *authors = [self extractElementsForKey:@"authors" separatedBy:@"," onDictionary:JSON];
    for (NSString *name in authors) {
        [book addAuthorsObject:[DRGAuthor authorNamed:name ofBook:book withContext:context]];
    }
    // tags
    NSArray *tags = [self extractElementsForKey:@"tags" separatedBy:@"," onDictionary:JSON];
    for (NSString *name in tags) {
        [book addTagsObject:[DRGTag tagNamed:name ofBook:book withContext:context]];
    }
    // annotation
    // NOTE: when a book is created there is any annotation on it.
    
    return book;
}

#pragma mark - Favorite

- (BOOL)isFavorite {
    // Is it tagged as Favorite?
    for (DRGTag *tag in self.tags) {
        DRGLabel *label = tag.label;
        if ([label.name isEqualToString:IS_FAVORITE]) {
            return YES;
        }
    }
    
    return NO;
}

#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    // Update modification date
}

#pragma mark - Utils

+ (BOOL)hasNeededInformation:(NSDictionary *)dic {
    
    NSString *title = [dic objectForKey:@"title"];
    if (!title || [title isEqualToString:@""]) {
        return NO;
    }
    
    return YES;
}

+ (NSArray *)observableKeys {
    return @[];
}

+ (NSArray *)extractElementsForKey:(NSString *)key separatedBy:(NSString *)separator onDictionary:(NSDictionary *)aDict {
    
    NSString *elements = [aDict objectForKey:key];
    NSArray *elementArr = [elements componentsSeparatedByString:separator];
    
    return elementArr;
}

//- (NSString *)description {
//    NSString *bookInfo = [NSString stringWithFormat:@"Title: %@, Authors: %@, Tags: %@",]
//    NSString *desc = [NSString stringWithFormat:@"Entity: %@ / id: %@\n%@", self.entityName,self.objectID];
//    return desc;
//}

@end
