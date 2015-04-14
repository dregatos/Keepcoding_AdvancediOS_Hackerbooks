// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DRGCover.h instead.

@import CoreData;
#import "DRGLibraryBaseClass.h"

extern const struct DRGCoverAttributes {
	__unsafe_unretained NSString *coverData;
	__unsafe_unretained NSString *urlString;
} DRGCoverAttributes;

extern const struct DRGCoverRelationships {
	__unsafe_unretained NSString *book;
} DRGCoverRelationships;

@class DRGBook;

@interface DRGCoverID : NSManagedObjectID {}
@end

@interface _DRGCover : DRGLibraryBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) DRGCoverID* objectID;

@property (nonatomic, strong) NSData* coverData;

//- (BOOL)validateCoverData:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* urlString;

//- (BOOL)validateUrlString:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) DRGBook *book;

//- (BOOL)validateBook:(id*)value_ error:(NSError**)error_;

@end

@interface _DRGCover (CoreDataGeneratedPrimitiveAccessors)

- (NSData*)primitiveCoverData;
- (void)setPrimitiveCoverData:(NSData*)value;

- (NSString*)primitiveUrlString;
- (void)setPrimitiveUrlString:(NSString*)value;

- (DRGBook*)primitiveBook;
- (void)setPrimitiveBook:(DRGBook*)value;

@end
