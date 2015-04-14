// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DRGAuthor.h instead.

@import CoreData;
#import "DRGLibraryBaseClass.h"

extern const struct DRGAuthorRelationships {
	__unsafe_unretained NSString *book;
	__unsafe_unretained NSString *writer;
} DRGAuthorRelationships;

@class DRGBook;
@class DRGWriter;

@interface DRGAuthorID : NSManagedObjectID {}
@end

@interface _DRGAuthor : DRGLibraryBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) DRGAuthorID* objectID;

@property (nonatomic, strong) DRGBook *book;

//- (BOOL)validateBook:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) DRGWriter *writer;

//- (BOOL)validateWriter:(id*)value_ error:(NSError**)error_;

@end

@interface _DRGAuthor (CoreDataGeneratedPrimitiveAccessors)

- (DRGBook*)primitiveBook;
- (void)setPrimitiveBook:(DRGBook*)value;

- (DRGWriter*)primitiveWriter;
- (void)setPrimitiveWriter:(DRGWriter*)value;

@end
