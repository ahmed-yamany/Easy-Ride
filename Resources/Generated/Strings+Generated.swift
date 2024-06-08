// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// and
  internal static let and = L10n.tr("Localizable", "and", fallback: "and")
  /// Email
  internal static let email = L10n.tr("Localizable", "email", fallback: "Email")
  /// Gender
  internal static let gender = L10n.tr("Localizable", "gender", fallback: "Gender")
  /// Already have an account?
  internal static let haveAccount = L10n.tr("Localizable", "haveAccount", fallback: "Already have an account?")
  /// Name
  internal static let name = L10n.tr("Localizable", "name", fallback: "Name")
  /// OR
  internal static let or = L10n.tr("Localizable", "or", fallback: "OR")
  /// privacy
  internal static let privacy = L10n.tr("Localizable", "privacy", fallback: "privacy")
  /// Privacy policy
  internal static let privacyPolicy = L10n.tr("Localizable", "privacyPolicy", fallback: "Privacy policy")
  /// Sign In
  internal static let signin = L10n.tr("Localizable", "signin", fallback: "Sign In")
  /// Sign Up
  internal static let signup = L10n.tr("Localizable", "signup", fallback: "Sign Up")
  /// Localizable.strings
  ///   EasyRider
  /// 
  ///   Created by Ahmed Yamany on 14/05/2024.
  internal static let skip = L10n.tr("Localizable", "skip", fallback: "Skip")
  /// terms
  internal static let terms = L10n.tr("Localizable", "terms", fallback: "terms")
  /// By signing up. you agree to the 
  internal static let termsAndCondition = L10n.tr("Localizable", "termsAndCondition", fallback: "By signing up. you agree to the ")
  /// Terms of service
  internal static let termsOfService = L10n.tr("Localizable", "termsOfService", fallback: "Terms of service")
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
