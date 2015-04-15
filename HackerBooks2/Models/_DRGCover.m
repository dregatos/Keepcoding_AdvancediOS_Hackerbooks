// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DRGCover.m instead.

#import "_DRGCover.h"

const struct DRGCoverRelationships DRGCoverRelationships = {
	.book = @"book",
};

@implementation DRGCoverID
@end

@implementation _DRGCover

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Cover" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Cover";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Cover" inManagedObjectContext:moc_];
}

- (DRGCoverID*)objectID {
	return (DRGCoverID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic book;

@end

