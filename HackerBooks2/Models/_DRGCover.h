// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DRGCover.h instead.

@import CoreData;
#import "DRGBookResource.h"

extern const struct DRGCoverRelationships {
	__unsafe_unretained NSString *book;
} DRGCoverRelationships;

@class DRGBook;

@interface DRGCoverID : DRGBookResourceID {}
@end

@interface _DRGCover : DRGBookResource {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) DRGCoverID* objectID;

@property (nonatomic, strong) DRGBook *book;

//- (BOOL)validateBook:(id*)value_ error:(NSError**)error_;

@end

@interface _DRGCover (CoreDataGeneratedPrimitiveAccessors)

- (DRGBook*)primitiveBook;
- (void)setPrimitiveBook:(DRGBook*)value;

@end
