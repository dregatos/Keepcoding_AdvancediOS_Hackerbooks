// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DRGPdf.m instead.

#import "_DRGPdf.h"

const struct DRGPdfRelationships DRGPdfRelationships = {
	.book = @"book",
};

@implementation DRGPdfID
@end

@implementation _DRGPdf

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Pdf" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Pdf";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Pdf" inManagedObjectContext:moc_];
}

- (DRGPdfID*)objectID {
	return (DRGPdfID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic book;

@end

