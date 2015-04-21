// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DRGAnnotation.m instead.

#import "_DRGAnnotation.h"

const struct DRGAnnotationAttributes DRGAnnotationAttributes = {
	.text = @"text",
	.title = @"title",
};

const struct DRGAnnotationRelationships DRGAnnotationRelationships = {
	.book = @"book",
	.date = @"date",
	.location = @"location",
	.photo = @"photo",
};

@implementation DRGAnnotationID
@end

@implementation _DRGAnnotation

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Annotation" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Annotation";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Annotation" inManagedObjectContext:moc_];
}

- (DRGAnnotationID*)objectID {
	return (DRGAnnotationID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic text;

@dynamic title;

@dynamic book;

@dynamic date;

@dynamic location;

@dynamic photo;

@end

