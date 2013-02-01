//
//  LeftListController.m
//  Overflow
//
//  Created by Dmitry Kurilo on 1/31/13.
//  Copyright (c) 2013 Kurilo Dmitry. All rights reserved.
//

#import "LeftListController.h"

@implementation LeftListController

-(id)init {
    if (self = [super init]) {
        [self setIsLoading:NO];
        sourceListItems = [[NSMutableArray alloc] init];
        _tags = [SourceListItem itemWithTitle:@"TAGS" identifier:@"tags"];
        id<DKTagsProtocol> tags = [[DKTags alloc] initWithDelegate:self];
        [tags performLoadTags];
        [self setIsLoading:YES];
        [sourceListItems addObject:_tags];
        
    }
    return self;
}

-(void)takeTags:(NSDictionary *)tags {
     NSMutableArray *childrenTags = [[NSMutableArray alloc] init];
     NSImage * tag_picture = [[NSImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tag_image" ofType:@"png"]];
    for (id obj in tags) {
        SourceListItem *tagChildrenItem = [SourceListItem itemWithTitle:[obj objectForKey:@"name"] identifier:[obj objectForKey:@"name"]];
        [tagChildrenItem setIcon:tag_picture];
        [childrenTags addObject:tagChildrenItem];
    }
    [_tags setChildren:childrenTags];
    [_leftlist reloadData];
    [_leftlist expandItem:_tags];
    [self setIsLoading:NO];
}


#pragma mark Source List Data Source Methods

- (NSUInteger)sourceList:(PXSourceList*)sourceList numberOfChildrenOfItem:(id)item
{
	//Works the same way as the NSOutlineView data source: `nil` means a parent item
	if(item==nil) {
		return [sourceListItems count];
	}
	else {
		return [[item children] count];
	}
}

- (id)sourceList:(PXSourceList*)aSourceList child:(NSUInteger)index ofItem:(id)item
{
	//Works the same way as the NSOutlineView data source: `nil` means a parent item
	if(item==nil) {
		return [sourceListItems objectAtIndex:index];
	}
	else {
		return [[item children] objectAtIndex:index];
	}
}

- (id)sourceList:(PXSourceList*)aSourceList objectValueForItem:(id)item
{
	return [item title];
}

- (void)sourceList:(PXSourceList*)aSourceList setObjectValue:(id)object forItem:(id)item
{
	[item setTitle:object];
}


- (BOOL)sourceList:(PXSourceList*)aSourceList isItemExpandable:(id)item
{
	return [item hasChildren];
}


- (BOOL)sourceList:(PXSourceList*)aSourceList itemHasBadge:(id)item
{
	return [item hasBadge];
}

- (NSInteger)sourceList:(PXSourceList*)aSourceList badgeValueForItem:(id)item
{
	return [item badgeValue];
}


- (BOOL)sourceList:(PXSourceList*)aSourceList itemHasIcon:(id)item
{
	return [item hasIcon];
}


- (NSImage*)sourceList:(PXSourceList*)aSourceList iconForItem:(id)item
{
	return [item icon];
}

- (NSMenu*)sourceList:(PXSourceList*)aSourceList menuForEvent:(NSEvent*)theEvent item:(id)item
{
	if ([theEvent type] == NSRightMouseDown || ([theEvent type] == NSLeftMouseDown && ([theEvent modifierFlags] & NSControlKeyMask) == NSControlKeyMask)) {
		NSMenu * m = [[NSMenu alloc] init];
		if (item != nil) {
			[m addItemWithTitle:[item title] action:nil keyEquivalent:@""];
		} else {
			[m addItemWithTitle:@"clicked outside" action:nil keyEquivalent:@""];
		}
		return m;
	}
	return nil;
}

#pragma mark Source List Delegate Methods

- (BOOL)sourceList:(PXSourceList*)aSourceList isGroupAlwaysExpanded:(id)group
{
	if([[group identifier] isEqualToString:@"library"])
		return YES;
	
	return NO;
}


- (void)sourceListSelectionDidChange:(NSNotification *)notification
{
	NSIndexSet *selectedIndexes = [_leftlist selectedRowIndexes];
    NSLog(@"%@",selectedIndexes);
}


- (void)sourceListDeleteKeyPressedOnRows:(NSNotification *)notification
{
	NSIndexSet *rows = [[notification userInfo] objectForKey:@"rows"];
	
	NSLog(@"Delete key pressed on rows %@", rows);
	
	//Do something here
}



@end
