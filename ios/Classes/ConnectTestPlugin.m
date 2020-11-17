#import "ConnectTestPlugin.h"
#if __has_include(<connect_test/connect_test-Swift.h>)
#import <connect_test/connect_test-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "connect_test-Swift.h"
#endif

@implementation ConnectTestPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftConnectTestPlugin registerWithRegistrar:registrar];
}
@end
