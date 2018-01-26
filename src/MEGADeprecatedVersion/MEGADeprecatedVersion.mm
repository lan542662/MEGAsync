#include <stdio.h>
#include <Cocoa/Cocoa.h>

int main(int argc, char *argv[])
{
    NSAlert *alert = [[NSAlert alloc] init];
    [alert addButtonWithTitle:@"OK"];
    [alert setMessageText:@"Unsupported macOS Version"];
    [alert setInformativeText:@"We have detected that you are using and old macOS version that is no longer supported. Please update your system to macOS 10.9+ or download latest compatible installer"];

    NSTextView *view = [[NSTextView alloc] initWithFrame:NSMakeRect(0,0,200,20)];
    [view setTextContainerInset:NSMakeSize(0.0f, 0.0f)];

    NSFont *font = [NSFont systemFontOfSize:[NSFont systemFontSize]];
    NSDictionary *textAttributes = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];


    NSMutableAttributedString* str = [[NSMutableAttributedString alloc] initWithString:@"Download last compatible installer"];
    [str addAttribute: NSLinkAttributeName value: @"https://mega.nz/sync" range: NSMakeRange(0, str.length)];

    [view insertText:str];
    [view setEditable:NO];
    [view setDrawsBackground:NO];
    [alert setAccessoryView:view];

    [alert setAlertStyle:NSWarningAlertStyle];
    [alert runModal];
    [alert release];
    return 0;
}
