// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DRGWriter.m instead.

#import "_DRGWriter.h"

const struct DRGWriterAttributes DRGWriterAttributes = {
	.name = @"name",
};

const struct DRGWriterRelationships DRGWriterRelationships = {
	.authors = @"authors",
};

@implementation DRGWriterID
@end

@implementation _DRGWriter

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Writer" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Writer";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Writer" inManagedObjectContext:moc_];
}

- (DRGWriterID*)objectID {
	return (DRGWriterID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic name;

@dynamic authors;

- (NSMutableSet*)authorsSet {
	[self willAccessValueForKey:@"authors"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"authors"];

	[self didAccessValueForKey:@"authors"];
	return result;
}

@end

