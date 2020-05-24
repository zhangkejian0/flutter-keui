#import "KeuiPlugin.h"
#if __has_include(<keui/keui-Swift.h>)
#import <keui/keui-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "keui-Swift.h"
#endif

@implementation KeuiPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftKeuiPlugin registerWithRegistrar:registrar];
}
@end
