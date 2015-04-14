// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DRGAuthor.m instead.

#import "_DRGAuthor.h"

const struct DRGAuthorRelationships DRGAuthorRelationships = {
	.book = @"book",
	.writer = @"writer",
};

@implementation DRGAuthorID
@end

@implementation _DRGAuthor

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Author" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Author";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Author" inManagedObjectContext:moc_];
}

- (DRGAuthorID*)objectID {
	return (DRGAuthorID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic book;

@dynamic writer;

@end

