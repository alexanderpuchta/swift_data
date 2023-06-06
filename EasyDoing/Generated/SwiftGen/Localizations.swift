// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum Localizable {
    internal enum CreateToDo {
      internal enum Buttons {
        /// Save
        internal static let create = L10n.tr("Localizable", "create_to_do.buttons.create", fallback: "Save")
      }
      internal enum Labels {
        /// Priority of your task?
        internal static let priority = L10n.tr("Localizable", "create_to_do.labels.priority", fallback: "Priority of your task?")
        /// New Task
        internal static let title = L10n.tr("Localizable", "create_to_do.labels.title", fallback: "New Task")
      }
      internal enum TextFields {
        internal enum Labels {
          /// What needs to be done?
          internal static let title = L10n.tr("Localizable", "create_to_do.text_fields.labels.title", fallback: "What needs to be done?")
        }
      }
    }
    internal enum ToDo {
      internal enum Buttons {
        /// Finish
        internal static let done = L10n.tr("Localizable", "to_do.buttons.done", fallback: "Finish")
        /// Restart
        internal static let undone = L10n.tr("Localizable", "to_do.buttons.undone", fallback: "Restart")
      }
      internal enum Labels {
        /// created at
        internal static let createdAt = L10n.tr("Localizable", "to_do.labels.created_at", fallback: "created at")
        /// Priority
        internal static let priorty = L10n.tr("Localizable", "to_do.labels.priorty", fallback: "Priority")
        /// What needs to be done?
        internal static let title = L10n.tr("Localizable", "to_do.labels.title", fallback: "What needs to be done?")
      }
    }
    internal enum ToDoes {
      internal enum Buttons {
        /// Create a new task
        internal static let create = L10n.tr("Localizable", "to_does.buttons.create", fallback: "Create a new task")
      }
      internal enum Labels {
        /// Seems like no tasks are stored yet.
        internal static let empty = L10n.tr("Localizable", "to_does.labels.empty", fallback: "Seems like no tasks are stored yet.")
        /// What's up?
        internal static let title = L10n.tr("Localizable", "to_does.labels.title", fallback: "What's up?")
      }
    }
  }
  internal enum NonLocalizable {
    /// EasyDoing
    internal static let appName = L10n.tr("NonLocalizable", "app_name", fallback: "EasyDoing")
  }
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
