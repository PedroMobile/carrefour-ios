//
//  CGFloat+AppTokens.swift
//  carrefour
//
//  Created by Pedro Sousa on 28/06/23.
//

import Foundation
import UIKit

public extension CGFloat {
    struct AppSpacings {
        /// Returns spacing equals 4
        public static let spacing3xs: CGFloat = AppTokens.spacing3xs.asCGFloat()

        /// Returns spacing equals 8
        public static let spacing2xs: CGFloat = AppTokens.spacing2xs.asCGFloat()

        /// Returns spacing equals 12
        public static let spacingXs: CGFloat = AppTokens.spacingXs.asCGFloat()

        /// Returns spacing equals 16
        public static let spacingSm: CGFloat = AppTokens.spacingSm.asCGFloat()

        /// Returns spacing equals 24
        public static let spacingMd: CGFloat = AppTokens.spacingMd.asCGFloat()

        /// Returns spacing equals 32
        public static let spacingLg: CGFloat = AppTokens.spacingLg.asCGFloat()

        /// Returns spacing equals 40
        public static let spacingXl: CGFloat = AppTokens.spacingXl.asCGFloat()

        /// Returns spacing equals 48
        public static let spacing2xl: CGFloat = AppTokens.spacing2xl.asCGFloat()

        /// Returns spacing equals 56
        public static let spacing3xl: CGFloat = AppTokens.spacing3xl.asCGFloat()

        /// Returns spacing equals 64
        public static let spacing4xl: CGFloat = AppTokens.spacing4xl.asCGFloat()

        /// Returns spacing equals 72
        public static let spacing5xl: CGFloat = AppTokens.spacing5xl.asCGFloat()

        /// Returns spacing equals 80
        public static let spacing6xl: CGFloat = AppTokens.spacing6xl.asCGFloat()

        /// Returns spacing equals 88
        public static let spacing7xl: CGFloat = AppTokens.spacing7xl.asCGFloat()

        /// Returns spacing equals 96
        public static let spacing8xl: CGFloat = AppTokens.spacing8xl.asCGFloat()
    }

    struct AppBorders {
        /// Returns border equals 0
        public static let borderNone: CGFloat = 0
        
        /// Returns border equals 1
        public static let borderSm: CGFloat = 1

        /// Returns border equals 2
        public static let borderMd: CGFloat = 2

        /// Returns border equals 4
        public static let borderLg: CGFloat = 4

        /// Returns border equals 8
        public static let borderXl: CGFloat = 8
    }

    struct AppRoundings {
        /// Returns rounding equals 4
        public static let rounded2xs: CGFloat = AppTokens.rounded2xs
        
        /// Returns rounding equals 8
        public static let roundedXs: CGFloat = AppTokens.roundedXs

        /// Returns rounding equals 12
        public static let roundedSm: CGFloat = AppTokens.roundedSm

        /// Returns rounding equals 16
        public static let roundedMd: CGFloat = AppTokens.roundedMd

        /// Returns rounding equals 20
        public static let roundedLg: CGFloat = AppTokens.roundedLg

        /// Returns rounding equals 24
        public static let roundedXl: CGFloat = AppTokens.roundedXl

        /// Returns rounding equals 32
        public static let rounded2xl: CGFloat = AppTokens.rounded2xl

        /// Returns rounding equals 250
        public static let roundedMax: CGFloat = AppTokens.roundedMax
    }

    struct AppBlur {
        /// Returns blur of 4
        public static let blurSm = AppTokens.blurSm.asCGFloat()

        /// Returns blur of 8
        public static let blurMd = AppTokens.blurMd.asCGFloat()

        /// Returns blur of 16
        public static let blurLg = AppTokens.blurLg.asCGFloat()
    }

    struct AppFontSize {
        /// Returns font size of 12 px
        public static let fontSize3xs = AppTokens.fontSize3xs.asCGFloat()

        /// Returns font size of 14 px
        public static let fontSize2xs = AppTokens.fontSize2xs.asCGFloat()

        /// Returns font size of 16 px
        public static let fontSizeXs = AppTokens.fontSizeXs.asCGFloat()

        /// Returns font size of 18 px
        public static let fontSizeSm = AppTokens.fontSizeSm.asCGFloat()

        /// Returns font size of 20 px
        public static let fontSizeMd = AppTokens.fontSizeMd.asCGFloat()

        /// Returns font size of 24 px
        public static let fontSizeLg = AppTokens.fontSizeLg.asCGFloat()

        /// Returns font size of 28 px
        public static let fontSizeXl = AppTokens.fontSizeXl.asCGFloat()

        /// Returns font size of 32 px
        public static let fontSize2xl = AppTokens.fontSize2xl.asCGFloat()

        /// Returns font size of 48 px
        public static let fontSize3xl = AppTokens.fontSize3xl.asCGFloat()

        /// Returns font size of 64 px
        public static let fontSizeMax = AppTokens.fontSizeMax.asCGFloat()
    }
}
