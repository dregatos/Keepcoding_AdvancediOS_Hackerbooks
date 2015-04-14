// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DRGTag.h instead.

@import CoreData;
#import "DRGLibraryBaseClass.h"

extern const struct DRGTagRelationships {
	__unsafe_unretained NSString *book;
	__unsafe_unretained NSString *label;
} DRGTagRelationships;

@class DRGBook;
@class DRGLabel;

@interface DRGTagID : NSManagedObjectID {}
@end

@interface _DRGTag : DRGLibraryBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) DRGTagID* objectID;

@property (nonatomic, strong) DRGBook *book;

//- (BOOL)validateBook:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) DRGLabel *label;

//- (BOOL)validateLabel:(id*)value_ error:(NSError**)error_;

@end

@interface _DRGTag (CoreDataGeneratedPrimitiveAccessors)

- (DRGBook*)primitiveBook;
- (void)setPrimitiveBook:(DRGBook*)value;

- (DRGLabel*)primitiveLabel;
- (void)setPrimitiveLabel:(DRGLabel*)value;

@end
