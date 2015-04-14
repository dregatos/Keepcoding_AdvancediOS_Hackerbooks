// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DRGPdf.h instead.

@import CoreData;
#import "DRGLibraryBaseClass.h"

extern const struct DRGPdfAttributes {
	__unsafe_unretained NSString *pdfData;
	__unsafe_unretained NSString *urlString;
} DRGPdfAttributes;

extern const struct DRGPdfRelationships {
	__unsafe_unretained NSString *book;
} DRGPdfRelationships;

@class DRGBook;

@interface DRGPdfID : NSManagedObjectID {}
@end

@interface _DRGPdf : DRGLibraryBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) DRGPdfID* objectID;

@property (nonatomic, strong) NSData* pdfData;

//- (BOOL)validatePdfData:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* urlString;

//- (BOOL)validateUrlString:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) DRGBook *book;

//- (BOOL)validateBook:(id*)value_ error:(NSError**)error_;

@end

@interface _DRGPdf (CoreDataGeneratedPrimitiveAccessors)

- (NSData*)primitivePdfData;
- (void)setPrimitivePdfData:(NSData*)value;

- (NSString*)primitiveUrlString;
- (void)setPrimitiveUrlString:(NSString*)value;

- (DRGBook*)primitiveBook;
- (void)setPrimitiveBook:(DRGBook*)value;

@end
