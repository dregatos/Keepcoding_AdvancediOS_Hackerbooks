// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DRGTag.m instead.

#import "_DRGTag.h"

const struct DRGTagRelationships DRGTagRelationships = {
	.book = @"book",
	.label = @"label",
};

@implementation DRGTagID
@end

@implementation _DRGTag

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Tag" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Tag";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Tag" inManagedObjectContext:moc_];
}

- (DRGTagID*)objectID {
	return (DRGTagID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic book;

@dynamic label;

@end

