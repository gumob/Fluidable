//
//  VectorMath.swift
//  VectorMath
//
//  Version 0.3.3
//
//  Created by Nick Lockwood on 24/11/2014.
//  Copyright (c) 2014 Nick Lockwood. All rights reserved.
//
//  Distributed under the permissive MIT License
//  Get the latest version from here:
//
//  https://github.com/nicklockwood/VectorMath
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

/* swiftlint:disable file_length */

import Foundation

// MARK: Types

typealias Scalar = Float

struct Vector2 {
    var x: Scalar
    var y: Scalar
}

struct Vector3 {
    var x: Scalar
    var y: Scalar
    var z: Scalar
}

struct Vector4 {
    var x: Scalar
    var y: Scalar
    var z: Scalar
    var w: Scalar
}

struct Matrix3 {
    var m11: Scalar
    var m12: Scalar
    var m13: Scalar
    var m21: Scalar
    var m22: Scalar
    var m23: Scalar
    var m31: Scalar
    var m32: Scalar
    var m33: Scalar
}

struct Matrix4 {
    var m11: Scalar
    var m12: Scalar
    var m13: Scalar
    var m14: Scalar
    var m21: Scalar
    var m22: Scalar
    var m23: Scalar
    var m24: Scalar
    var m31: Scalar
    var m32: Scalar
    var m33: Scalar
    var m34: Scalar
    var m41: Scalar
    var m42: Scalar
    var m43: Scalar
    var m44: Scalar
}

struct Quaternion {
    var x: Scalar
    var y: Scalar
    var z: Scalar
    var w: Scalar
}

// MARK: Scalar

extension Scalar {
    static let halfPi = pi / 2
    static let quarterPi = pi / 4
    static let twoPi = pi * 2
    static let degreesPerRadian = 180 / pi
    static let radiansPerDegree = pi / 180
    static let epsilon: Scalar = 0.0001

    static func ~= (lhs: Scalar, rhs: Scalar) -> Bool {
        return Swift.abs(lhs - rhs) < .epsilon
    }

    fileprivate var sign: Scalar {
        return self > 0 ? 1 : -1
    }
}

// MARK: Vector2

extension Vector2: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(x.hashValue &+ y.hashValue)
    }
}

extension Vector2 {
    static let zero = Vector2(0, 0)
    static let x = Vector2(1, 0)
    static let y = Vector2(0, 1)

    var lengthSquared: Scalar {
        return x * x + y * y
    }

    var length: Scalar {
        return sqrt(lengthSquared)
    }

    var inverse: Vector2 {
        return -self
    }

    init(_ x: Scalar, _ y: Scalar) {
        self.init(x: x, y: y)
    }

    init(_ v: [Scalar]) {
        assert(v.count == 2, "array must contain 2 elements, contained \(v.count)")
        self.init(v[0], v[1])
    }

    func toArray() -> [Scalar] {
        return [x, y]
    }

    func dot(_ v: Vector2) -> Scalar {
        return x * v.x + y * v.y
    }

    func cross(_ v: Vector2) -> Scalar {
        return x * v.y - y * v.x
    }

    func normalized() -> Vector2 {
        let lengthSquared = self.lengthSquared
        if lengthSquared ~= 0 || lengthSquared ~= 1 {
            return self
        }
        return self / sqrt(lengthSquared)
    }

    func rotated(by radians: Scalar) -> Vector2 {
        let cs = cos(radians)
        let sn = sin(radians)
        return Vector2(x * cs - y * sn, x * sn + y * cs)
    }

    func rotated(by radians: Scalar, around pivot: Vector2) -> Vector2 {
        return (self - pivot).rotated(by: radians) + pivot
    }

    func angle(with v: Vector2) -> Scalar {
        if self == v {
            return 0
        }

        let t1 = normalized()
        let t2 = v.normalized()
        let cross = t1.cross(t2)
        let dot = max(-1, min(1, t1.dot(t2)))

        return atan2(cross, dot)
    }

    func interpolated(with v: Vector2, by t: Scalar) -> Vector2 {
        return self + (v - self) * t
    }

    static prefix func - (v: Vector2) -> Vector2 {
        return Vector2(-v.x, -v.y)
    }

    static func + (lhs: Vector2, rhs: Vector2) -> Vector2 {
        return Vector2(lhs.x + rhs.x, lhs.y + rhs.y)
    }

    static func - (lhs: Vector2, rhs: Vector2) -> Vector2 {
        return Vector2(lhs.x - rhs.x, lhs.y - rhs.y)
    }

    static func * (lhs: Vector2, rhs: Vector2) -> Vector2 {
        return Vector2(lhs.x * rhs.x, lhs.y * rhs.y)
    }

    static func * (lhs: Vector2, rhs: Scalar) -> Vector2 {
        return Vector2(lhs.x * rhs, lhs.y * rhs)
    }

    static func * (lhs: Vector2, rhs: Matrix3) -> Vector2 {
        return Vector2(
                lhs.x * rhs.m11 + lhs.y * rhs.m21 + rhs.m31,
                lhs.x * rhs.m12 + lhs.y * rhs.m22 + rhs.m32
        )
    }

    static func / (lhs: Vector2, rhs: Vector2) -> Vector2 {
        return Vector2(lhs.x / rhs.x, lhs.y / rhs.y)
    }

    static func / (lhs: Vector2, rhs: Scalar) -> Vector2 {
        return Vector2(lhs.x / rhs, lhs.y / rhs)
    }

    static func == (lhs: Vector2, rhs: Vector2) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }

    static func ~= (lhs: Vector2, rhs: Vector2) -> Bool {
        return lhs.x ~= rhs.x && lhs.y ~= rhs.y
    }
}

// MARK: Vector3

extension Vector3: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(x.hashValue &+ y.hashValue &+ z.hashValue)
    }
}

extension Vector3 {
    static let zero = Vector3(0, 0, 0)
    static let x = Vector3(1, 0, 0)
    static let y = Vector3(0, 1, 0)
    static let z = Vector3(0, 0, 1)

    var lengthSquared: Scalar {
        return x * x + y * y + z * z
    }

    var length: Scalar {
        return sqrt(lengthSquared)
    }

    var inverse: Vector3 {
        return -self
    }

    var xy: Vector2 {
        get {
            return Vector2(x, y)
        }
        set(v) {
            x = v.x
            y = v.y
        }
    }

    var xz: Vector2 {
        get {
            return Vector2(x, z)
        }
        set(v) {
            x = v.x
            z = v.y
        }
    }

    var yz: Vector2 {
        get {
            return Vector2(y, z)
        }
        set(v) {
            y = v.x
            z = v.y
        }
    }

    init(_ x: Scalar, _ y: Scalar, _ z: Scalar) {
        self.init(x: x, y: y, z: z)
    }

    init(_ v: [Scalar]) {
        assert(v.count == 3, "array must contain 3 elements, contained \(v.count)")
        self.init(v[0], v[1], v[2])
    }

    func toArray() -> [Scalar] {
        return [x, y, z]
    }

    func dot(_ v: Vector3) -> Scalar {
        return x * v.x + y * v.y + z * v.z
    }

    func cross(_ v: Vector3) -> Vector3 {
        return Vector3(y * v.z - z * v.y, z * v.x - x * v.z, x * v.y - y * v.x)
    }

    func normalized() -> Vector3 {
        let lengthSquared = self.lengthSquared
        if lengthSquared ~= 0 || lengthSquared ~= 1 {
            return self
        }
        return self / sqrt(lengthSquared)
    }

    func interpolated(with v: Vector3, by t: Scalar) -> Vector3 {
        return self + (v - self) * t
    }

    static prefix func - (v: Vector3) -> Vector3 {
        return Vector3(-v.x, -v.y, -v.z)
    }

    static func + (lhs: Vector3, rhs: Vector3) -> Vector3 {
        return Vector3(lhs.x + rhs.x, lhs.y + rhs.y, lhs.z + rhs.z)
    }

    static func - (lhs: Vector3, rhs: Vector3) -> Vector3 {
        return Vector3(lhs.x - rhs.x, lhs.y - rhs.y, lhs.z - rhs.z)
    }

    static func * (lhs: Vector3, rhs: Vector3) -> Vector3 {
        return Vector3(lhs.x * rhs.x, lhs.y * rhs.y, lhs.z * rhs.z)
    }

    static func * (lhs: Vector3, rhs: Scalar) -> Vector3 {
        return Vector3(lhs.x * rhs, lhs.y * rhs, lhs.z * rhs)
    }

    static func * (lhs: Vector3, rhs: Matrix3) -> Vector3 {
        return Vector3(
                lhs.x * rhs.m11 + lhs.y * rhs.m21 + lhs.z * rhs.m31,
                lhs.x * rhs.m12 + lhs.y * rhs.m22 + lhs.z * rhs.m32,
                lhs.x * rhs.m13 + lhs.y * rhs.m23 + lhs.z * rhs.m33
        )
    }

    static func * (lhs: Vector3, rhs: Matrix4) -> Vector3 {
        return Vector3(
                lhs.x * rhs.m11 + lhs.y * rhs.m21 + lhs.z * rhs.m31 + rhs.m41,
                lhs.x * rhs.m12 + lhs.y * rhs.m22 + lhs.z * rhs.m32 + rhs.m42,
                lhs.x * rhs.m13 + lhs.y * rhs.m23 + lhs.z * rhs.m33 + rhs.m43
        )
    }

    static func * (v: Vector3, q: Quaternion) -> Vector3 {
        let qv = q.xyz
        let uv = qv.cross(v)
        let uuv = qv.cross(uv)
        return v + (uv * 2 * q.w) + (uuv * 2)
    }

    static func / (lhs: Vector3, rhs: Vector3) -> Vector3 {
        return Vector3(lhs.x / rhs.x, lhs.y / rhs.y, lhs.z / rhs.z)
    }

    static func / (lhs: Vector3, rhs: Scalar) -> Vector3 {
        return Vector3(lhs.x / rhs, lhs.y / rhs, lhs.z / rhs)
    }

    static func == (lhs: Vector3, rhs: Vector3) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y && lhs.z == rhs.z
    }

    static func ~= (lhs: Vector3, rhs: Vector3) -> Bool {
        return lhs.x ~= rhs.x && lhs.y ~= rhs.y && lhs.z ~= rhs.z
    }
}

// MARK: Vector4

extension Vector4: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(x.hashValue &+ y.hashValue &+ z.hashValue &+ w.hashValue)
    }
}

extension Vector4 {
    static let zero = Vector4(0, 0, 0, 0)
    static let x = Vector4(1, 0, 0, 0)
    static let y = Vector4(0, 1, 0, 0)
    static let z = Vector4(0, 0, 1, 0)
    static let w = Vector4(0, 0, 0, 1)

    var lengthSquared: Scalar {
        return x * x + y * y + z * z + w * w
    }

    var length: Scalar {
        return sqrt(lengthSquared)
    }

    var inverse: Vector4 {
        return -self
    }

    var xyz: Vector3 {
        get {
            return Vector3(x, y, z)
        }
        set(v) {
            x = v.x
            y = v.y
            z = v.z
        }
    }

    var xy: Vector2 {
        get {
            return Vector2(x, y)
        }
        set(v) {
            x = v.x
            y = v.y
        }
    }

    var xz: Vector2 {
        get {
            return Vector2(x, z)
        }
        set(v) {
            x = v.x
            z = v.y
        }
    }

    var yz: Vector2 {
        get {
            return Vector2(y, z)
        }
        set(v) {
            y = v.x
            z = v.y
        }
    }

    init(_ x: Scalar, _ y: Scalar, _ z: Scalar, _ w: Scalar) {
        self.init(x: x, y: y, z: z, w: w)
    }

    init(_ v: [Scalar]) {
        assert(v.count == 4, "array must contain 4 elements, contained \(v.count)")
        self.init(v[0], v[1], v[2], v[3])
    }

    init(_ v: Vector3, w: Scalar) {
        self.init(v.x, v.y, v.z, w)
    }

    func toArray() -> [Scalar] {
        return [x, y, z, w]
    }

    func toVector3() -> Vector3 {
        if w ~= 0 {
            return xyz
        } else {
            return xyz / w
        }
    }

    func dot(_ v: Vector4) -> Scalar {
        return x * v.x + y * v.y + z * v.z + w * v.w
    }

    func normalized() -> Vector4 {
        let lengthSquared = self.lengthSquared
        if lengthSquared ~= 0 || lengthSquared ~= 1 {
            return self
        }
        return self / sqrt(lengthSquared)
    }

    func interpolated(with v: Vector4, by t: Scalar) -> Vector4 {
        return self + (v - self) * t
    }

    static prefix func - (v: Vector4) -> Vector4 {
        return Vector4(-v.x, -v.y, -v.z, -v.w)
    }

    static func + (lhs: Vector4, rhs: Vector4) -> Vector4 {
        return Vector4(lhs.x + rhs.x, lhs.y + rhs.y, lhs.z + rhs.z, lhs.w + rhs.w)
    }

    static func - (lhs: Vector4, rhs: Vector4) -> Vector4 {
        return Vector4(lhs.x - rhs.x, lhs.y - rhs.y, lhs.z - rhs.z, lhs.w - rhs.w)
    }

    static func * (lhs: Vector4, rhs: Vector4) -> Vector4 {
        return Vector4(lhs.x * rhs.x, lhs.y * rhs.y, lhs.z * rhs.z, lhs.w * rhs.w)
    }

    static func * (lhs: Vector4, rhs: Scalar) -> Vector4 {
        return Vector4(lhs.x * rhs, lhs.y * rhs, lhs.z * rhs, lhs.w * rhs)
    }

    static func * (lhs: Vector4, rhs: Matrix4) -> Vector4 {
        return Vector4(
                lhs.x * rhs.m11 + lhs.y * rhs.m21 + lhs.z * rhs.m31 + lhs.w * rhs.m41,
                lhs.x * rhs.m12 + lhs.y * rhs.m22 + lhs.z * rhs.m32 + lhs.w * rhs.m42,
                lhs.x * rhs.m13 + lhs.y * rhs.m23 + lhs.z * rhs.m33 + lhs.w * rhs.m43,
                lhs.x * rhs.m14 + lhs.y * rhs.m24 + lhs.z * rhs.m34 + lhs.w * rhs.m44
        )
    }

    static func / (lhs: Vector4, rhs: Vector4) -> Vector4 {
        return Vector4(lhs.x / rhs.x, lhs.y / rhs.y, lhs.z / rhs.z, lhs.w / rhs.w)
    }

    static func / (lhs: Vector4, rhs: Scalar) -> Vector4 {
        return Vector4(lhs.x / rhs, lhs.y / rhs, lhs.z / rhs, lhs.w / rhs)
    }

    static func == (lhs: Vector4, rhs: Vector4) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y && lhs.z == rhs.z && lhs.w == rhs.w
    }

    static func ~= (lhs: Vector4, rhs: Vector4) -> Bool {
        return lhs.x ~= rhs.x && lhs.y ~= rhs.y && lhs.z ~= rhs.z && lhs.w ~= rhs.w
    }
}

// MARK: Matrix3

extension Matrix3: Hashable {
    func hash(into hasher: inout Hasher) {
        var hash = m11.hashValue &+ m12.hashValue &+ m13.hashValue
        hash = hash &+ m21.hashValue &+ m22.hashValue &+ m23.hashValue
        hash = hash &+ m31.hashValue &+ m32.hashValue &+ m33.hashValue
        hasher.combine(hash)
    }
}

extension Matrix3 {
    static let identity = Matrix3(1, 0, 0, 0, 1, 0, 0, 0, 1)

    init(_ m11: Scalar, _ m12: Scalar, _ m13: Scalar,
         _ m21: Scalar, _ m22: Scalar, _ m23: Scalar,
         _ m31: Scalar, _ m32: Scalar, _ m33: Scalar) {
        self.m11 = m11 // 0
        self.m12 = m12 // 1
        self.m13 = m13 // 2
        self.m21 = m21 // 3
        self.m22 = m22 // 4
        self.m23 = m23 // 5
        self.m31 = m31 // 6
        self.m32 = m32 // 7
        self.m33 = m33 // 8
    }

    init(scale: Vector2) {
        self.init(
                scale.x, 0, 0,
                0, scale.y, 0,
                0, 0, 1
        )
    }

    init(translation: Vector2) {
        self.init(
                1, 0, 0,
                0, 1, 0,
                translation.x, translation.y, 1
        )
    }

    init(rotation radians: Scalar) {
        let cs = cos(radians)
        let sn = sin(radians)
        self.init(
                cs, sn, 0,
                -sn, cs, 0,
                0, 0, 1
        )
    }

    init(_ m: [Scalar]) {
        assert(m.count == 9, "array must contain 9 elements, contained \(m.count)")
        self.init(m[0], m[1], m[2], m[3], m[4], m[5], m[6], m[7], m[8])
    }

    func toArray() -> [Scalar] {
        return [m11, m12, m13, m21, m22, m23, m31, m32, m33]
    }

    var adjugate: Matrix3 {
        return Matrix3(
                m22 * m33 - m23 * m32,
                m13 * m32 - m12 * m33,
                m12 * m23 - m13 * m22,
                m23 * m31 - m21 * m33,
                m11 * m33 - m13 * m31,
                m13 * m21 - m11 * m23,
                m21 * m32 - m22 * m31,
                m12 * m31 - m11 * m32,
                m11 * m22 - m12 * m21
        )
    }

    var determinant: Scalar {
        return (m11 * m22 * m33 + m12 * m23 * m31 + m13 * m21 * m32)
               - (m13 * m22 * m31 + m11 * m23 * m32 + m12 * m21 * m33)
    }

    var transpose: Matrix3 {
        return Matrix3(m11, m21, m31, m12, m22, m32, m13, m23, m33)
    }

    var inverse: Matrix3 {
        return adjugate * (1 / determinant)
    }

    func interpolated(with m: Matrix3, by t: Scalar) -> Matrix3 {
        return Matrix3(
                m11 + (m.m11 - m11) * t,
                m12 + (m.m12 - m12) * t,
                m13 + (m.m13 - m13) * t,
                m21 + (m.m21 - m21) * t,
                m22 + (m.m22 - m22) * t,
                m23 + (m.m23 - m23) * t,
                m31 + (m.m31 - m31) * t,
                m32 + (m.m32 - m32) * t,
                m33 + (m.m33 - m33) * t
        )
    }

    static prefix func - (m: Matrix3) -> Matrix3 {
        return m.inverse
    }

    static func * (lhs: Matrix3, rhs: Matrix3) -> Matrix3 {
        return Matrix3(
                lhs.m11 * rhs.m11 + lhs.m21 * rhs.m12 + lhs.m31 * rhs.m13,
                lhs.m12 * rhs.m11 + lhs.m22 * rhs.m12 + lhs.m32 * rhs.m13,
                lhs.m13 * rhs.m11 + lhs.m23 * rhs.m12 + lhs.m33 * rhs.m13,
                lhs.m11 * rhs.m21 + lhs.m21 * rhs.m22 + lhs.m31 * rhs.m23,
                lhs.m12 * rhs.m21 + lhs.m22 * rhs.m22 + lhs.m32 * rhs.m23,
                lhs.m13 * rhs.m21 + lhs.m23 * rhs.m22 + lhs.m33 * rhs.m23,
                lhs.m11 * rhs.m31 + lhs.m21 * rhs.m32 + lhs.m31 * rhs.m33,
                lhs.m12 * rhs.m31 + lhs.m22 * rhs.m32 + lhs.m32 * rhs.m33,
                lhs.m13 * rhs.m31 + lhs.m23 * rhs.m32 + lhs.m33 * rhs.m33
        )
    }

    static func * (lhs: Matrix3, rhs: Vector2) -> Vector2 {
        return rhs * lhs
    }

    static func * (lhs: Matrix3, rhs: Vector3) -> Vector3 {
        return rhs * lhs
    }

    static func * (lhs: Matrix3, rhs: Scalar) -> Matrix3 {
        return Matrix3(
                lhs.m11 * rhs, lhs.m12 * rhs, lhs.m13 * rhs,
                lhs.m21 * rhs, lhs.m22 * rhs, lhs.m23 * rhs,
                lhs.m31 * rhs, lhs.m32 * rhs, lhs.m33 * rhs
        )
    }

    static func == (lhs: Matrix3, rhs: Matrix3) -> Bool {
        if lhs.m11 != rhs.m11 { return false }
        if lhs.m12 != rhs.m12 { return false }
        if lhs.m13 != rhs.m13 { return false }
        if lhs.m21 != rhs.m21 { return false }
        if lhs.m22 != rhs.m22 { return false }
        if lhs.m23 != rhs.m23 { return false }
        if lhs.m31 != rhs.m31 { return false }
        if lhs.m32 != rhs.m32 { return false }
        if lhs.m33 != rhs.m33 { return false }
        return true
    }

    static func ~= (lhs: Matrix3, rhs: Matrix3) -> Bool {
        if !(lhs.m11 ~= rhs.m11) { return false }
        if !(lhs.m12 ~= rhs.m12) { return false }
        if !(lhs.m13 ~= rhs.m13) { return false }
        if !(lhs.m21 ~= rhs.m21) { return false }
        if !(lhs.m22 ~= rhs.m22) { return false }
        if !(lhs.m23 ~= rhs.m23) { return false }
        if !(lhs.m31 ~= rhs.m31) { return false }
        if !(lhs.m32 ~= rhs.m32) { return false }
        if !(lhs.m33 ~= rhs.m33) { return false }
        return true
    }
}

// MARK: Matrix4

extension Matrix4: Hashable {
    func hash(into hasher: inout Hasher) {
        var hash = m11.hashValue &+ m12.hashValue &+ m13.hashValue &+ m14.hashValue
        hash = hash &+ m21.hashValue &+ m22.hashValue &+ m23.hashValue &+ m24.hashValue
        hash = hash &+ m31.hashValue &+ m32.hashValue &+ m33.hashValue &+ m34.hashValue
        hash = hash &+ m41.hashValue &+ m42.hashValue &+ m43.hashValue &+ m44.hashValue
        hasher.combine(hash)
    }
}

extension Matrix4 {
    static let identity = Matrix4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1)

    init(_ m11: Scalar, _ m12: Scalar, _ m13: Scalar, _ m14: Scalar,
         _ m21: Scalar, _ m22: Scalar, _ m23: Scalar, _ m24: Scalar,
         _ m31: Scalar, _ m32: Scalar, _ m33: Scalar, _ m34: Scalar,
         _ m41: Scalar, _ m42: Scalar, _ m43: Scalar, _ m44: Scalar) {
        self.m11 = m11 // 0
        self.m12 = m12 // 1
        self.m13 = m13 // 2
        self.m14 = m14 // 3
        self.m21 = m21 // 4
        self.m22 = m22 // 5
        self.m23 = m23 // 6
        self.m24 = m24 // 7
        self.m31 = m31 // 8
        self.m32 = m32 // 9
        self.m33 = m33 // 10
        self.m34 = m34 // 11
        self.m41 = m41 // 12
        self.m42 = m42 // 13
        self.m43 = m43 // 14
        self.m44 = m44 // 15
    }

    init(scale s: Vector3) {
        self.init(
                s.x, 0, 0, 0,
                0, s.y, 0, 0,
                0, 0, s.z, 0,
                0, 0, 0, 1
        )
    }

    init(translation t: Vector3) {
        self.init(
                1, 0, 0, 0,
                0, 1, 0, 0,
                0, 0, 1, 0,
                t.x, t.y, t.z, 1
        )
    }

    init(rotation axisAngle: Vector4) {
        self.init(quaternion: Quaternion(axisAngle: axisAngle))
    }

    init(quaternion q: Quaternion) {
        self.init(
                1 - 2 * (q.y * q.y + q.z * q.z), 2 * (q.x * q.y + q.z * q.w), 2 * (q.x * q.z - q.y * q.w), 0,
                2 * (q.x * q.y - q.z * q.w), 1 - 2 * (q.x * q.x + q.z * q.z), 2 * (q.y * q.z + q.x * q.w), 0,
                2 * (q.x * q.z + q.y * q.w), 2 * (q.y * q.z - q.x * q.w), 1 - 2 * (q.x * q.x + q.y * q.y), 0,
                0, 0, 0, 1
        )
    }

    init(fovx: Scalar, fovy: Scalar, near: Scalar, far: Scalar) {
        self.init(fovy: fovy, aspect: fovx / fovy, near: near, far: far)
    }

    init(fovx: Scalar, aspect: Scalar, near: Scalar, far: Scalar) {
        self.init(fovy: fovx / aspect, aspect: aspect, near: near, far: far)
    }

    init(fovy: Scalar, aspect: Scalar, near: Scalar, far: Scalar) {
        let dz = far - near

        assert(dz > 0, "far value must be greater than near")
        assert(fovy > 0, "field of view must be nonzero and positive")
        assert(aspect > 0, "aspect ratio must be nonzero and positive")

        let r = fovy / 2
        let cotangent = cos(r) / sin(r)

        self.init(
                cotangent / aspect, 0, 0, 0,
                0, cotangent, 0, 0,
                0, 0, -(far + near) / dz, -1,
                0, 0, -2 * near * far / dz, 0
        )
    }

    init(top: Scalar, right: Scalar, bottom: Scalar, left: Scalar, near: Scalar, far: Scalar) {
        let dx = right - left
        let dy = top - bottom
        let dz = far - near

        self.init(
                2 / dx, 0, 0, 0,
                0, 2 / dy, 0, 0,
                0, 0, -2 / dz, 0,
                -(right + left) / dx, -(top + bottom) / dy, -(far + near) / dz, 1
        )
    }

    init(_ m: [Scalar]) {
        assert(m.count == 16, "array must contain 16 elements, contained \(m.count)")

        m11 = m[0]
        m12 = m[1]
        m13 = m[2]
        m14 = m[3]
        m21 = m[4]
        m22 = m[5]
        m23 = m[6]
        m24 = m[7]
        m31 = m[8]
        m32 = m[9]
        m33 = m[10]
        m34 = m[11]
        m41 = m[12]
        m42 = m[13]
        m43 = m[14]
        m44 = m[15]
    }

    func toArray() -> [Scalar] {
        return [m11, m12, m13, m14, m21, m22, m23, m24, m31, m32, m33, m34, m41, m42, m43, m44]
    }

    var adjugate: Matrix4 {
        var m = Matrix4.identity

        m.m11 = m22 * m33 * m44 - m22 * m34 * m43
        m.m11 += -m32 * m23 * m44 + m32 * m24 * m43
        m.m11 += m42 * m23 * m34 - m42 * m24 * m33

        m.m21 = -m21 * m33 * m44 + m21 * m34 * m43
        m.m21 += m31 * m23 * m44 - m31 * m24 * m43
        m.m21 += -m41 * m23 * m34 + m41 * m24 * m33

        m.m31 = m21 * m32 * m44 - m21 * m34 * m42
        m.m31 += -m31 * m22 * m44 + m31 * m24 * m42
        m.m31 += m41 * m22 * m34 - m41 * m24 * m32

        m.m41 = -m21 * m32 * m43 + m21 * m33 * m42
        m.m41 += m31 * m22 * m43 - m31 * m23 * m42
        m.m41 += -m41 * m22 * m33 + m41 * m23 * m32

        m.m12 = -m12 * m33 * m44 + m12 * m34 * m43
        m.m12 += m32 * m13 * m44 - m32 * m14 * m43
        m.m12 += -m42 * m13 * m34 + m42 * m14 * m33

        m.m22 = m11 * m33 * m44 - m11 * m34 * m43
        m.m22 += -m31 * m13 * m44 + m31 * m14 * m43
        m.m22 += m41 * m13 * m34 - m41 * m14 * m33

        m.m32 = -m11 * m32 * m44 + m11 * m34 * m42
        m.m32 += m31 * m12 * m44 - m31 * m14 * m42
        m.m32 += -m41 * m12 * m34 + m41 * m14 * m32

        m.m42 = m11 * m32 * m43 - m11 * m33 * m42
        m.m42 += -m31 * m12 * m43 + m31 * m13 * m42
        m.m42 += m41 * m12 * m33 - m41 * m13 * m32

        m.m13 = m12 * m23 * m44 - m12 * m24 * m43
        m.m13 += -m22 * m13 * m44 + m22 * m14 * m43
        m.m13 += m42 * m13 * m24 - m42 * m14 * m23

        m.m23 = -m11 * m23 * m44 + m11 * m24 * m43
        m.m23 += m21 * m13 * m44 - m21 * m14 * m43
        m.m23 += -m41 * m13 * m24 + m41 * m14 * m23

        m.m33 = m11 * m22 * m44 - m11 * m24 * m42
        m.m33 += -m21 * m12 * m44 + m21 * m14 * m42
        m.m33 += m41 * m12 * m24 - m41 * m14 * m22

        m.m43 = -m11 * m22 * m43 + m11 * m23 * m42
        m.m43 += m21 * m12 * m43 - m21 * m13 * m42
        m.m43 += -m41 * m12 * m23 + m41 * m13 * m22

        m.m14 = -m12 * m23 * m34 + m12 * m24 * m33
        m.m14 += m22 * m13 * m34 - m22 * m14 * m33
        m.m14 += -m32 * m13 * m24 + m32 * m14 * m23

        m.m24 = m11 * m23 * m34 - m11 * m24 * m33
        m.m24 += -m21 * m13 * m34 + m21 * m14 * m33
        m.m24 += m31 * m13 * m24 - m31 * m14 * m23

        m.m34 = -m11 * m22 * m34 + m11 * m24 * m32
        m.m34 += m21 * m12 * m34 - m21 * m14 * m32
        m.m34 += -m31 * m12 * m24 + m31 * m14 * m22

        m.m44 = m11 * m22 * m33 - m11 * m23 * m32
        m.m44 += -m21 * m12 * m33 + m21 * m13 * m32
        m.m44 += m31 * m12 * m23 - m31 * m13 * m22

        return m
    }

    private func determinant(forAdjugate m: Matrix4) -> Scalar {
        return m11 * m.m11 + m12 * m.m21 + m13 * m.m31 + m14 * m.m41
    }

    var determinant: Scalar {
        return determinant(forAdjugate: adjugate)
    }

    var transpose: Matrix4 {
        return Matrix4(
                m11, m21, m31, m41,
                m12, m22, m32, m42,
                m13, m23, m33, m43,
                m14, m24, m34, m44
        )
    }

    var inverse: Matrix4 {
        let adjugate = self.adjugate // avoid recalculating
        return adjugate * (1 / determinant(forAdjugate: adjugate))
    }

    static prefix func - (m: Matrix4) -> Matrix4 {
        return m.inverse
    }

    static func * (lhs: Matrix4, rhs: Matrix4) -> Matrix4 {
        var m = Matrix4.identity

        m.m11 = lhs.m11 * rhs.m11 + lhs.m21 * rhs.m12
        m.m11 += lhs.m31 * rhs.m13 + lhs.m41 * rhs.m14

        m.m12 = lhs.m12 * rhs.m11 + lhs.m22 * rhs.m12
        m.m12 += lhs.m32 * rhs.m13 + lhs.m42 * rhs.m14

        m.m13 = lhs.m13 * rhs.m11 + lhs.m23 * rhs.m12
        m.m13 += lhs.m33 * rhs.m13 + lhs.m43 * rhs.m14

        m.m14 = lhs.m14 * rhs.m11 + lhs.m24 * rhs.m12
        m.m14 += lhs.m34 * rhs.m13 + lhs.m44 * rhs.m14

        m.m21 = lhs.m11 * rhs.m21 + lhs.m21 * rhs.m22
        m.m21 += lhs.m31 * rhs.m23 + lhs.m41 * rhs.m24

        m.m22 = lhs.m12 * rhs.m21 + lhs.m22 * rhs.m22
        m.m22 += lhs.m32 * rhs.m23 + lhs.m42 * rhs.m24

        m.m23 = lhs.m13 * rhs.m21 + lhs.m23 * rhs.m22
        m.m23 += lhs.m33 * rhs.m23 + lhs.m43 * rhs.m24

        m.m24 = lhs.m14 * rhs.m21 + lhs.m24 * rhs.m22
        m.m24 += lhs.m34 * rhs.m23 + lhs.m44 * rhs.m24

        m.m31 = lhs.m11 * rhs.m31 + lhs.m21 * rhs.m32
        m.m31 += lhs.m31 * rhs.m33 + lhs.m41 * rhs.m34

        m.m32 = lhs.m12 * rhs.m31 + lhs.m22 * rhs.m32
        m.m32 += lhs.m32 * rhs.m33 + lhs.m42 * rhs.m34

        m.m33 = lhs.m13 * rhs.m31 + lhs.m23 * rhs.m32
        m.m33 += lhs.m33 * rhs.m33 + lhs.m43 * rhs.m34

        m.m34 = lhs.m14 * rhs.m31 + lhs.m24 * rhs.m32
        m.m34 += lhs.m34 * rhs.m33 + lhs.m44 * rhs.m34

        m.m41 = lhs.m11 * rhs.m41 + lhs.m21 * rhs.m42
        m.m41 += lhs.m31 * rhs.m43 + lhs.m41 * rhs.m44

        m.m42 = lhs.m12 * rhs.m41 + lhs.m22 * rhs.m42
        m.m42 += lhs.m32 * rhs.m43 + lhs.m42 * rhs.m44

        m.m43 = lhs.m13 * rhs.m41 + lhs.m23 * rhs.m42
        m.m43 += lhs.m33 * rhs.m43 + lhs.m43 * rhs.m44

        m.m44 = lhs.m14 * rhs.m41 + lhs.m24 * rhs.m42
        m.m44 += lhs.m34 * rhs.m43 + lhs.m44 * rhs.m44

        return m
    }

    static func * (lhs: Matrix4, rhs: Vector3) -> Vector3 {
        return rhs * lhs
    }

    static func * (lhs: Matrix4, rhs: Vector4) -> Vector4 {
        return rhs * lhs
    }

    static func * (lhs: Matrix4, rhs: Scalar) -> Matrix4 {
        return Matrix4(
                lhs.m11 * rhs, lhs.m12 * rhs, lhs.m13 * rhs, lhs.m14 * rhs,
                lhs.m21 * rhs, lhs.m22 * rhs, lhs.m23 * rhs, lhs.m24 * rhs,
                lhs.m31 * rhs, lhs.m32 * rhs, lhs.m33 * rhs, lhs.m34 * rhs,
                lhs.m41 * rhs, lhs.m42 * rhs, lhs.m43 * rhs, lhs.m44 * rhs
        )
    }

    static func == (lhs: Matrix4, rhs: Matrix4) -> Bool {
        if lhs.m11 != rhs.m11 { return false }
        if lhs.m12 != rhs.m12 { return false }
        if lhs.m13 != rhs.m13 { return false }
        if lhs.m14 != rhs.m14 { return false }
        if lhs.m21 != rhs.m21 { return false }
        if lhs.m22 != rhs.m22 { return false }
        if lhs.m23 != rhs.m23 { return false }
        if lhs.m24 != rhs.m24 { return false }
        if lhs.m31 != rhs.m31 { return false }
        if lhs.m32 != rhs.m32 { return false }
        if lhs.m33 != rhs.m33 { return false }
        if lhs.m34 != rhs.m34 { return false }
        if lhs.m41 != rhs.m41 { return false }
        if lhs.m42 != rhs.m42 { return false }
        if lhs.m43 != rhs.m43 { return false }
        if lhs.m44 != rhs.m44 { return false }
        return true
    }

    static func ~= (lhs: Matrix4, rhs: Matrix4) -> Bool {
        if !(lhs.m11 ~= rhs.m11) { return false }
        if !(lhs.m12 ~= rhs.m12) { return false }
        if !(lhs.m13 ~= rhs.m13) { return false }
        if !(lhs.m14 ~= rhs.m14) { return false }
        if !(lhs.m21 ~= rhs.m21) { return false }
        if !(lhs.m22 ~= rhs.m22) { return false }
        if !(lhs.m23 ~= rhs.m23) { return false }
        if !(lhs.m24 ~= rhs.m24) { return false }
        if !(lhs.m31 ~= rhs.m31) { return false }
        if !(lhs.m32 ~= rhs.m32) { return false }
        if !(lhs.m33 ~= rhs.m33) { return false }
        if !(lhs.m34 ~= rhs.m34) { return false }
        if !(lhs.m41 ~= rhs.m41) { return false }
        if !(lhs.m42 ~= rhs.m42) { return false }
        if !(lhs.m43 ~= rhs.m43) { return false }
        if !(lhs.m44 ~= rhs.m44) { return false }
        return true
    }
}

// MARK: Quaternion

extension Quaternion: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(x.hashValue &+ y.hashValue &+ z.hashValue &+ w.hashValue)
    }
}

extension Quaternion {
    static let zero = Quaternion(0, 0, 0, 0)
    static let identity = Quaternion(0, 0, 0, 1)

    var lengthSquared: Scalar {
        return x * x + y * y + z * z + w * w
    }

    var length: Scalar {
        return sqrt(lengthSquared)
    }

    var inverse: Quaternion {
        return -self
    }

    var xyz: Vector3 {
        get {
            return Vector3(x, y, z)
        }
        set(v) {
            x = v.x
            y = v.y
            z = v.z
        }
    }

    var pitch: Scalar {
        return asin(min(1, max(-1, 2 * (w * y - z * x))))
    }

    var yaw: Scalar {
        return atan2(2 * (w * z + x * y), 1 - 2 * (y * y + z * z))
    }

    var roll: Scalar {
        return atan2(2 * (w * x + y * z), 1 - 2 * (x * x + y * y))
    }

    init(_ x: Scalar, _ y: Scalar, _ z: Scalar, _ w: Scalar) {
        self.init(x: x, y: y, z: z, w: w)
    }

    init(axisAngle: Vector4) {
        let r = axisAngle.w * 0.5
        let scale = sin(r)
        let a = axisAngle.xyz * scale
        self.init(a.x, a.y, a.z, cos(r))
    }

    init(pitch: Scalar, yaw: Scalar, roll: Scalar) {
        let t0 = cos(yaw * 0.5)
        let t1 = sin(yaw * 0.5)
        let t2 = cos(roll * 0.5)
        let t3 = sin(roll * 0.5)
        let t4 = cos(pitch * 0.5)
        let t5 = sin(pitch * 0.5)
        self.init(
                t0 * t3 * t4 - t1 * t2 * t5,
                t0 * t2 * t5 + t1 * t3 * t4,
                t1 * t2 * t4 - t0 * t3 * t5,
                t0 * t2 * t4 + t1 * t3 * t5
        )
    }

    init(rotationMatrix m: Matrix4) {
        let x = sqrt(max(0, 1 + m.m11 - m.m22 - m.m33)) / 2
        let y = sqrt(max(0, 1 - m.m11 + m.m22 - m.m33)) / 2
        let z = sqrt(max(0, 1 - m.m11 - m.m22 + m.m33)) / 2
        let w = sqrt(max(0, 1 + m.m11 + m.m22 + m.m33)) / 2
        self.init(
                x * (x * (m.m32 - m.m23)).sign,
                y * (y * (m.m13 - m.m31)).sign,
                z * (z * (m.m21 - m.m12)).sign,
                w
        )
    }

    init(_ v: [Scalar]) {
        assert(v.count == 4, "array must contain 4 elements, contained \(v.count)")

        x = v[0]
        y = v[1]
        z = v[2]
        w = v[3]
    }

    func toAxisAngle() -> Vector4 {
        let scale = xyz.length
        if scale ~= 0 || scale ~= .twoPi {
            return .z
        } else {
            return Vector4(x / scale, y / scale, z / scale, acos(w) * 2)
        }
    }

    func toPitchYawRoll() -> (pitch: Scalar, yaw: Scalar, roll: Scalar) {
        return (pitch, yaw, roll)
    }

    func toArray() -> [Scalar] {
        return [x, y, z, w]
    }

    func dot(_ v: Quaternion) -> Scalar {
        return x * v.x + y * v.y + z * v.z + w * v.w
    }

    func normalized() -> Quaternion {
        let lengthSquared = self.lengthSquared
        if lengthSquared ~= 0 || lengthSquared ~= 1 {
            return self
        }
        return self / sqrt(lengthSquared)
    }

    func interpolated(with q: Quaternion, by t: Scalar) -> Quaternion {
        let dot = max(-1, min(1, self.dot(q)))
        if dot ~= 1 {
            return (self + (q - self) * t).normalized()
        }

        let theta = acos(dot) * t
        let t1 = self * cos(theta)
        let t2 = (q - (self * dot)).normalized() * sin(theta)
        return t1 + t2
    }

    static prefix func - (q: Quaternion) -> Quaternion {
        return Quaternion(-q.x, -q.y, -q.z, q.w)
    }

    static func + (lhs: Quaternion, rhs: Quaternion) -> Quaternion {
        return Quaternion(lhs.x + rhs.x, lhs.y + rhs.y, lhs.z + rhs.z, lhs.w + rhs.w)
    }

    static func - (lhs: Quaternion, rhs: Quaternion) -> Quaternion {
        return Quaternion(lhs.x - rhs.x, lhs.y - rhs.y, lhs.z - rhs.z, lhs.w - rhs.w)
    }

    static func * (lhs: Quaternion, rhs: Quaternion) -> Quaternion {
        return Quaternion(
                lhs.w * rhs.x + lhs.x * rhs.w + lhs.y * rhs.z - lhs.z * rhs.y,
                lhs.w * rhs.y + lhs.y * rhs.w + lhs.z * rhs.x - lhs.x * rhs.z,
                lhs.w * rhs.z + lhs.z * rhs.w + lhs.x * rhs.y - lhs.y * rhs.x,
                lhs.w * rhs.w - lhs.x * rhs.x - lhs.y * rhs.y - lhs.z * rhs.z
        )
    }

    static func * (lhs: Quaternion, rhs: Vector3) -> Vector3 {
        return rhs * lhs
    }

    static func * (lhs: Quaternion, rhs: Scalar) -> Quaternion {
        return Quaternion(lhs.x * rhs, lhs.y * rhs, lhs.z * rhs, lhs.w * rhs)
    }

    static func / (lhs: Quaternion, rhs: Scalar) -> Quaternion {
        return Quaternion(lhs.x / rhs, lhs.y / rhs, lhs.z / rhs, lhs.w / rhs)
    }

    static func == (lhs: Quaternion, rhs: Quaternion) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y && lhs.z == rhs.z && lhs.w == rhs.w
    }

    static func ~= (lhs: Quaternion, rhs: Quaternion) -> Bool {
        return lhs.x ~= rhs.x && lhs.y ~= rhs.y && lhs.z ~= rhs.z && lhs.w ~= rhs.w
    }
}
