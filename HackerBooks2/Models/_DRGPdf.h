// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DRGPdf.h instead.

@import CoreData;
#import "DRGBookResource.h"

extern const struct DRGPdfRelationships {
	__unsafe_unretained NSString *book;
} DRGPdfRelationships;

@class DRGBook;

@interface DRGPdfID : DRGBookResourceID {}
@end

@interface _DRGPdf : DRGBookResource {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) DRGPdfID* objectID;

@property (nonatomic, strong) DRGBook *book;

//- (BOOL)validateBook:(id*)value_ error:(NSError**)error_;

@end

@interface _DRGPdf (CoreDataGeneratedPrimitiveAccessors)

- (DRGBook*)primitiveBook;
- (void)setPrimitiveBook:(DRGBook*)value;

@end
