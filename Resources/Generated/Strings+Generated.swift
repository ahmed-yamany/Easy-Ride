// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Localizable.strings
  ///   EasyRider
  /// 
  ///   Created by Ahmed Yamany on 14/05/2024.
  internal static let privacy = L10n.tr("Localizable", "privacy", fallback: "privacy")
  /// privacy policy
  internal static let privacyPolicy = L10n.tr("Localizable", "privacyPolicy", fallback: "privacy policy")
  /// Sign Up
  internal static let signup = L10n.tr("Localizable", "signup", fallback: "Sign Up")
  /// terms
  internal static let terms = L10n.tr("Localizable", "terms", fallback: "terms")
  /// terms and condition
  internal static let termsAndcondition = L10n.tr("Localizable", "termsAndcondition", fallback: "terms and condition")
  /// terms of service
  internal static let termsOfService = L10n.tr("Localizable", "termsOfService", fallback: "terms of service")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
