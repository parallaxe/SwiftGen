// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

#if os(OSX)
  import AppKit.NSFont
  internal typealias Font = NSFont
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIFont
  internal typealias Font = UIFont
#endif

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

internal struct FontConvertible {
  internal let name: String
  internal let family: String
  internal let path: String

  internal func font(size: CGFloat) -> Font! {
    return Font(font: self, size: size)
  }

  internal func register() {
    guard let url = url else { return }
    var errorRef: Unmanaged<CFError>?
    CTFontManagerRegisterFontsForURL(url as CFURL, .process, &errorRef)
  }

  fileprivate var url: URL? {
    let bundle = Bundle(for: BundleToken.self)
    return bundle.url(forResource: path, withExtension: nil)
  }
}

internal extension Font {
  convenience init!(font: FontConvertible, size: CGFloat) {
    #if os(iOS) || os(tvOS) || os(watchOS)
    if !UIFont.fontNames(forFamilyName: font.family).contains(font.name) {
      font.register()
    }
    #elseif os(OSX)
    if let url = font.url, CTFontManagerGetScopeForURL(url as CFURL) == .none {
      font.register()
    }
    #endif

    self.init(name: font.name, size: size)
  }
}

// swiftlint:disable identifier_name line_length type_body_length
internal enum FontFamily {
  internal enum SFNSDisplay {
    internal static let black = FontConvertible(name: ".SFNSDisplay-Black", family: ".SF NS Display", path: "Fonts/SFNSDisplay-Black.otf")
    internal static let bold = FontConvertible(name: ".SFNSDisplay-Bold", family: ".SF NS Display", path: "Fonts/SFNSDisplay-Bold.otf")
    internal static let heavy = FontConvertible(name: ".SFNSDisplay-Heavy", family: ".SF NS Display", path: "Fonts/SFNSDisplay-Heavy.otf")
    internal static let regular = FontConvertible(name: ".SFNSDisplay-Regular", family: ".SF NS Display", path: "Fonts/SFNSDisplay-Regular.otf")
  }
  internal enum SFNSText {
    internal static let bold = FontConvertible(name: ".SFNSText-Bold", family: ".SF NS Text", path: "Fonts/SFNSText-Bold.otf")
    internal static let heavy = FontConvertible(name: ".SFNSText-Heavy", family: ".SF NS Text", path: "Fonts/SFNSText-Heavy.otf")
    internal static let regular = FontConvertible(name: ".SFNSText-Regular", family: ".SF NS Text", path: "Fonts/SFNSText-Regular.otf")
  }
  internal enum Avenir {
    internal static let black = FontConvertible(name: "Avenir-Black", family: "Avenir", path: "Fonts/Avenir.ttc")
    internal static let blackOblique = FontConvertible(name: "Avenir-BlackOblique", family: "Avenir", path: "Fonts/Avenir.ttc")
    internal static let book = FontConvertible(name: "Avenir-Book", family: "Avenir", path: "Fonts/Avenir.ttc")
    internal static let bookOblique = FontConvertible(name: "Avenir-BookOblique", family: "Avenir", path: "Fonts/Avenir.ttc")
    internal static let heavy = FontConvertible(name: "Avenir-Heavy", family: "Avenir", path: "Fonts/Avenir.ttc")
    internal static let heavyOblique = FontConvertible(name: "Avenir-HeavyOblique", family: "Avenir", path: "Fonts/Avenir.ttc")
    internal static let light = FontConvertible(name: "Avenir-Light", family: "Avenir", path: "Fonts/Avenir.ttc")
    internal static let lightOblique = FontConvertible(name: "Avenir-LightOblique", family: "Avenir", path: "Fonts/Avenir.ttc")
    internal static let medium = FontConvertible(name: "Avenir-Medium", family: "Avenir", path: "Fonts/Avenir.ttc")
    internal static let mediumOblique = FontConvertible(name: "Avenir-MediumOblique", family: "Avenir", path: "Fonts/Avenir.ttc")
    internal static let oblique = FontConvertible(name: "Avenir-Oblique", family: "Avenir", path: "Fonts/Avenir.ttc")
    internal static let roman = FontConvertible(name: "Avenir-Roman", family: "Avenir", path: "Fonts/Avenir.ttc")
  }
  internal enum ZapfDingbats {
    internal static let regular = FontConvertible(name: "ZapfDingbatsITC", family: "Zapf Dingbats", path: "Fonts/ZapfDingbats.ttf")
  }
  internal enum Public {
    internal static let `internal` = FontConvertible(name: "private", family: "public", path: "Fonts/class.ttf")
  }
}
// swiftlint:enable identifier_name line_length type_body_length

private final class BundleToken {}
