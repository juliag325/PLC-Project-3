{-# OPTIONS_GHC -w #-}
{-# OPTIONS -XMagicHash -XBangPatterns -XTypeSynonymInstances -XFlexibleInstances -cpp #-}
#if __GLASGOW_HASKELL__ >= 710
{-# OPTIONS_GHC -XPartialTypeSignatures #-}
#endif
module Pascal.Parser where

import Pascal.Base
import Pascal.Data
import Pascal.Val
import Pascal.Lexer
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import qualified GHC.Exts as Happy_GHC_Exts
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.12

newtype HappyAbsSyn  = HappyAbsSyn HappyAny
#if __GLASGOW_HASKELL__ >= 607
type HappyAny = Happy_GHC_Exts.Any
#else
type HappyAny = forall a . a
#endif
newtype HappyWrap4 = HappyWrap4 (Program)
happyIn4 :: (Program) -> (HappyAbsSyn )
happyIn4 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap4 x)
{-# INLINE happyIn4 #-}
happyOut4 :: (HappyAbsSyn ) -> HappyWrap4
happyOut4 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut4 #-}
newtype HappyWrap5 = HappyWrap5 ([Definition])
happyIn5 :: ([Definition]) -> (HappyAbsSyn )
happyIn5 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap5 x)
{-# INLINE happyIn5 #-}
happyOut5 :: (HappyAbsSyn ) -> HappyWrap5
happyOut5 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut5 #-}
newtype HappyWrap6 = HappyWrap6 (Definition)
happyIn6 :: (Definition) -> (HappyAbsSyn )
happyIn6 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap6 x)
{-# INLINE happyIn6 #-}
happyOut6 :: (HappyAbsSyn ) -> HappyWrap6
happyOut6 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut6 #-}
newtype HappyWrap7 = HappyWrap7 (VType)
happyIn7 :: (VType) -> (HappyAbsSyn )
happyIn7 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap7 x)
{-# INLINE happyIn7 #-}
happyOut7 :: (HappyAbsSyn ) -> HappyWrap7
happyOut7 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut7 #-}
newtype HappyWrap8 = HappyWrap8 ([([String], VType)])
happyIn8 :: ([([String], VType)]) -> (HappyAbsSyn )
happyIn8 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap8 x)
{-# INLINE happyIn8 #-}
happyOut8 :: (HappyAbsSyn ) -> HappyWrap8
happyOut8 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut8 #-}
newtype HappyWrap9 = HappyWrap9 (([String], VType))
happyIn9 :: (([String], VType)) -> (HappyAbsSyn )
happyIn9 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap9 x)
{-# INLINE happyIn9 #-}
happyOut9 :: (HappyAbsSyn ) -> HappyWrap9
happyOut9 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut9 #-}
newtype HappyWrap10 = HappyWrap10 ([(String, VType)])
happyIn10 :: ([(String, VType)]) -> (HappyAbsSyn )
happyIn10 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap10 x)
{-# INLINE happyIn10 #-}
happyOut10 :: (HappyAbsSyn ) -> HappyWrap10
happyOut10 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut10 #-}
newtype HappyWrap11 = HappyWrap11 ((String, VType))
happyIn11 :: ((String, VType)) -> (HappyAbsSyn )
happyIn11 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap11 x)
{-# INLINE happyIn11 #-}
happyOut11 :: (HappyAbsSyn ) -> HappyWrap11
happyOut11 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut11 #-}
newtype HappyWrap12 = HappyWrap12 ([String])
happyIn12 :: ([String]) -> (HappyAbsSyn )
happyIn12 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap12 x)
{-# INLINE happyIn12 #-}
happyOut12 :: (HappyAbsSyn ) -> HappyWrap12
happyOut12 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut12 #-}
newtype HappyWrap13 = HappyWrap13 (BoolExp)
happyIn13 :: (BoolExp) -> (HappyAbsSyn )
happyIn13 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap13 x)
{-# INLINE happyIn13 #-}
happyOut13 :: (HappyAbsSyn ) -> HappyWrap13
happyOut13 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut13 #-}
newtype HappyWrap14 = HappyWrap14 (Exp)
happyIn14 :: (Exp) -> (HappyAbsSyn )
happyIn14 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap14 x)
{-# INLINE happyIn14 #-}
happyOut14 :: (HappyAbsSyn ) -> HappyWrap14
happyOut14 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut14 #-}
newtype HappyWrap15 = HappyWrap15 (Exp)
happyIn15 :: (Exp) -> (HappyAbsSyn )
happyIn15 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap15 x)
{-# INLINE happyIn15 #-}
happyOut15 :: (HappyAbsSyn ) -> HappyWrap15
happyOut15 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut15 #-}
newtype HappyWrap16 = HappyWrap16 (Exp)
happyIn16 :: (Exp) -> (HappyAbsSyn )
happyIn16 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap16 x)
{-# INLINE happyIn16 #-}
happyOut16 :: (HappyAbsSyn ) -> HappyWrap16
happyOut16 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut16 #-}
newtype HappyWrap17 = HappyWrap17 (BoolExp)
happyIn17 :: (BoolExp) -> (HappyAbsSyn )
happyIn17 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap17 x)
{-# INLINE happyIn17 #-}
happyOut17 :: (HappyAbsSyn ) -> HappyWrap17
happyOut17 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut17 #-}
newtype HappyWrap18 = HappyWrap18 ([Line])
happyIn18 :: ([Line]) -> (HappyAbsSyn )
happyIn18 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap18 x)
{-# INLINE happyIn18 #-}
happyOut18 :: (HappyAbsSyn ) -> HappyWrap18
happyOut18 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut18 #-}
newtype HappyWrap19 = HappyWrap19 (Line)
happyIn19 :: (Line) -> (HappyAbsSyn )
happyIn19 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap19 x)
{-# INLINE happyIn19 #-}
happyOut19 :: (HappyAbsSyn ) -> HappyWrap19
happyOut19 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut19 #-}
newtype HappyWrap20 = HappyWrap20 ([Statement])
happyIn20 :: ([Statement]) -> (HappyAbsSyn )
happyIn20 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap20 x)
{-# INLINE happyIn20 #-}
happyOut20 :: (HappyAbsSyn ) -> HappyWrap20
happyOut20 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut20 #-}
newtype HappyWrap21 = HappyWrap21 (Statement)
happyIn21 :: (Statement) -> (HappyAbsSyn )
happyIn21 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap21 x)
{-# INLINE happyIn21 #-}
happyOut21 :: (HappyAbsSyn ) -> HappyWrap21
happyOut21 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut21 #-}
happyInTok :: (Token) -> (HappyAbsSyn )
happyInTok x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyInTok #-}
happyOutTok :: (HappyAbsSyn ) -> (Token)
happyOutTok x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOutTok #-}


happyExpList :: HappyAddr
happyExpList = HappyA# "\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x20\x00\x30\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x03\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xe0\x35\x40\x62\x02\xbe\x39\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xff\x03\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x60\x00\x00\x00\x02\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x80\xd7\x00\x89\x09\xf8\xe6\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x10\x00\x00\x00\x00\x00\x00\x18\x0d\x10\x00\x00\x00\x00\x00\x00\x00\x46\x03\x04\x00\x00\x00\x00\x00\x00\x80\xd7\x00\x01\x08\xf8\x00\x00\x00\x00\xe0\x35\x40\x62\x02\xbe\x39\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x80\xd7\x00\x01\x08\xf8\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xc0\x01\x00\x00\x00\x00\x00\x00\x00\x00\x70\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x5e\x03\x04\x20\xe0\x03\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\xe0\x35\x40\x00\x02\x3e\x00\x00\x00\x00\x78\x0d\x10\x80\x80\x0f\x00\x00\x00\x00\xde\x03\x04\x20\xe0\x03\x00\x00\x00\x80\xd1\x00\x01\x00\xf8\x00\x00\x00\x00\x60\x34\x40\x00\x00\x3e\x00\x00\x00\x00\x18\x0d\x10\x00\x80\x0f\x00\x00\x00\x00\x46\x03\x04\x00\xe0\x03\x00\x00\x00\x80\xd1\x00\x01\x00\xf8\x00\x00\x00\x00\x00\xf0\x3f\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\xff\x0b\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x80\x01\x00\x00\x00\x00\x00\x00\x30\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x80\xd1\x00\x01\x00\x00\x00\x00\x00\x00\x00\xc0\x00\x00\x00\x00\x00\x00\x00\x00\x78\x0f\x10\x80\x80\x0f\x00\x00\x00\x00\x5e\x03\x04\x20\xe0\x03\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x78\x0d\x10\x80\x80\x0f\x00\x00\x00\x00\x5e\x03\x04\x20\xe0\x03\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x60\x34\x40\x00\x00\x00\x00\x00\x00\x00\x18\x0d\x10\x00\x00\x00\x00\x00\x00\x00\x46\x03\x04\x00\x00\x00\x00\x00\x00\x80\xd1\x00\x01\x00\x00\x00\x00\x00\x00\x60\x34\x40\x00\x00\x3e\x00\x00\x00\x00\x18\x0d\x10\x00\x80\x0f\x00\x00\x00\x00\x46\x03\x04\x00\xe0\x03\x00\x00\x00\x80\xd1\x00\x01\x00\xf8\x00\x00\x00\x00\x60\x34\x40\x00\x00\x3e\x00\x00\x00\x00\x18\x0d\x10\x00\x80\x0f\x00\x00\x00\x00\x46\x03\x04\x00\xe0\x03\x00\x00\x00\x80\xd1\x00\x01\x00\xf8\x00\x00\x00\x00\x60\x34\x40\x00\x00\x3e\x00\x00\x00\x00\x18\x0d\x10\x00\x80\x0f\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xc0\x03\x00\x00\x00\x00\x00\x00\x00\x60\x34\x40\x00\x00\x3e\x00\x00\x00\x00\x00\x3c\x00\x00\x00\x00\x00\x00\x00\x00\x00\x0f\x00\x00\x00\x00\x00\x00\x00\x00\xc0\x03\x00\x00\x00\x00\x00\x00\x00\x00\xf0\x00\x00\x00\x00\x00\x00\x00\x00\x00\x3c\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xc0\x00\x00\x00\x00\x00\x00\x00\x00\x00\x30\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xc0\x00\x00\x00\x00\x00\x00\x00\x00\x00\x30\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xf0\x3f\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x60\x00\x00\x00\x02\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\xc0\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x01\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x3c\x20\x00\x00\x00\x00\x00\x00\x00\xde\x03\x04\x20\xe0\x03\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x80\xf7\x00\x01\x08\xf8\x00\x00\x00\x00\x00\xf0\x80\x00\x00\x00\x00\x00\x00\x00\x00\x3c\x20\x00\x00\x00\x00\x00\x00\x00\x00\x0f\x08\x00\x00\x00\x00\x00\x00\x00\xc0\x03\x02\x00\x00\x00\x00\x00\x00\x00\xf0\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x18\x00\x00\x00\x00\x00\x00\x00\x00\x02\x06\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x60\x00\x00\x00\x00\x00\x00\x5e\x03\x04\x20\xe0\x03\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x70\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x18\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\xe0\x3d\x40\x00\x02\x3e\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xde\x03\x04\x20\xe0\x03\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x0f\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x78\x0d\x90\x98\x80\x6f\x0e\x00\x00\x00\x5e\x03\x24\x26\xe0\x9b\x03\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xc0\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x1c\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x0c\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x78\x0d\x90\x98\x80\x6f\x0e\x00\x00\x00\x5e\x03\x24\x26\xe0\x9b\x03\x00\x00\x80\xd7\x00\x89\x09\xf8\xe6\x00\x00\x00\xe0\x35\x40\x62\x02\xbe\x39\x00\x00\x00\x00\x00\x00\x00\x20\x00\x30\x00\x00\x00\x5e\x03\x24\x26\xe0\x9b\x03\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x80\xd7\x00\x89\x09\xf8\xe6\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x80\xd7\x00\x89\x09\xf8\xe6\x00\x00\x00\xe0\x35\x40\x62\x02\xbe\x39\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_happyParser","Program","Defs","Definition","Type","Method_list","List","Var_list","Var","ID_list","RelExp","RealExp","SpecialExp","Exp","BoolExp","Lines","Line","Statements","Statement","int","real","'true'","'false'","bool","ID","string","'+'","'-'","'*'","'/'","'='","'<>'","'>'","'<'","'>='","'<='","'('","')'","'\\''","'begin'","'end.'","'end'","':='","'break'","'continue'","'and'","'or'","'not'","','","':'","'boolean'","'real'","'string'","'var'","'program'","'sin'","'cos'","'sqrt'","'exp'","'ln'","'readln'","'writeln'","'if'","'then'","'else'","'while'","'for'","'case'","'function'","'procedure'","'of'","'to'","'do'","';'","' '","%eof"]
        bit_start = st * 78
        bit_end = (st + 1) * 78
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..77]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

happyActOffsets :: HappyAddr
happyActOffsets = HappyA# "\xdd\xff\xdd\xff\x02\x00\xcd\xff\xd4\xff\xee\xff\x08\x00\xee\xff\x28\x00\x33\x00\x39\x00\x19\x00\x38\x00\x26\x00\x41\x00\x00\x00\x32\x00\x00\x00\x5c\x00\x00\x00\x7b\x00\x5d\x00\x3d\x00\x32\x00\x00\x00\x00\x00\x00\x00\x00\x00\x07\x00\xf7\x00\xf7\x00\x86\x00\x32\x00\x17\x00\x47\x00\x86\x00\x7e\x00\x85\x00\x87\x00\x94\x00\xa2\x00\xb7\x00\xbb\x00\xbe\x00\x4a\x00\xc1\x00\xd4\x00\xa6\x00\xa6\x00\xd4\x00\xd4\x00\x6a\x00\xa5\x00\xd6\x00\xca\x00\xc7\x00\xc0\x00\x00\x00\x00\x00\x00\x00\x06\x00\x00\x00\x86\x00\xe2\x00\x86\x00\x86\x00\x79\x00\xc9\x00\xc9\x00\xc9\x00\xc9\x00\xc9\x00\x44\x01\x8e\x00\xcb\x00\x00\x00\x00\x00\xe5\x00\x08\x01\xfb\x00\xf9\xff\x1f\x01\xec\x00\xf7\x00\x1f\x01\x79\x00\xaf\x00\x00\x00\x00\x00\xbc\x00\xbc\x00\x00\x00\xf7\x00\xf7\x00\xf7\x00\xf7\x00\xc9\x00\xc9\x00\xc9\x00\xc9\x00\xc9\x00\xc9\x00\xc9\x00\xc9\x00\xc9\x00\xc9\x00\x00\x00\xb1\x00\xc9\x00\xb1\x00\xb1\x00\xb1\x00\xb1\x00\xb1\x00\x00\x00\x00\x00\x51\x01\x51\x01\x00\x00\x00\x00\x5a\x01\x5a\x01\x52\x01\x52\x01\x66\x00\x7f\x00\x25\x00\x44\x01\x52\x01\xee\x00\xe9\x00\x36\x00\x00\x00\xfb\x00\x79\x00\x00\x00\x00\x00\x00\x00\xe3\x00\x79\x00\x14\x01\x18\x01\x24\x01\x28\x01\x34\x01\xfa\x00\x09\x00\x3a\x00\x25\x01\x89\x00\xbc\x00\x00\x00\x00\x00\x24\x02\x01\x02\x33\x02\xa6\x00\x35\x02\x27\x02\x06\x02\x00\x00\x00\x00\x1d\x02\x1c\x02\x1f\x02\x05\x00\x8c\x00\x0c\x02\x0d\x02\x0b\x02\x16\x02\x0e\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x31\x02\x00\x00\x36\x02\x79\x00\xc4\x00\x79\x00\x00\x00\x00\x00\x00\x00\x38\x01\x37\x02\x01\x00\x00\x00\x00\x00\xd8\x00\x00\x00\x32\x00\x32\x00\x45\x02\x73\x01\x00\x00\x00\x00\xa6\x00\x00\x00\xa6\x00\xee\xff\x38\x02\x00\x00\x10\x02\x2d\x02\x2f\x02\x12\x02\x00\x00\x21\x02\xd1\x00\x00\x00\x32\x00\x32\x00\x32\x00\x32\x00\xee\xff\x32\x00\x39\x02\x3c\x02\x47\x02\x4f\x02\x00\x00\x00\x00\x3a\x02\x3b\x02\x32\x00\x20\x02\x00\x00\x3d\x02\x32\x00\x32\x00\x3e\x02\x3f\x02\x25\x02\x00\x00\x26\x02\x28\x02\x00\x00\x00\x00\x00\x00"#

happyGotoOffsets :: HappyAddr
happyGotoOffsets = HappyA# "\x53\x02\x00\x00\x00\x00\x00\x00\x00\x00\x2a\x02\x00\x00\x2c\x02\x50\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x4d\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x56\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x52\x02\x54\x02\xec\x01\x5f\x01\x00\x00\x00\x00\xf1\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x59\x02\x58\x02\x5f\x02\x3e\x00\x8d\x00\x79\x01\x00\x00\x00\x00\x00\x00\x29\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xf6\x01\x00\x00\xfb\x01\x00\x02\xc2\x01\x00\x01\x2a\x01\x2e\x01\x3a\x01\x3e\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x57\x02\x00\x00\xc9\x01\x05\x02\x00\x00\x00\x00\x0a\x02\x0f\x02\x00\x00\x5a\x02\x5b\x02\x5c\x02\x5d\x02\x7e\x01\x87\x01\x90\x01\x99\x01\xa2\x01\xab\x01\xb4\x01\xbd\x01\x18\x02\x1b\x02\x00\x00\x00\x00\x1e\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xd0\x01\x00\x00\x00\x00\x00\x00\x00\x00\xd7\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x14\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x61\x02\x20\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x2b\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xde\x01\x00\x00\xe5\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x7a\x01\x83\x01\x00\x00\x00\x00\x00\x00\x00\x00\x62\x02\x00\x00\x67\x02\x32\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x8c\x01\x95\x01\x9e\x01\xa7\x01\x34\x02\x68\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x71\x01\x00\x00\x00\x00\x00\x00\xb0\x01\xb9\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

happyAdjustOffset :: Happy_GHC_Exts.Int# -> Happy_GHC_Exts.Int#
happyAdjustOffset off = off

happyDefActions :: HappyAddr
happyDefActions = HappyA# "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xfd\xff\x00\x00\xfd\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xfc\xff\xbe\xff\xc9\xff\x00\x00\xe3\xff\xe4\xff\x00\x00\x00\x00\xbe\xff\xce\xff\xcf\xff\xcc\xff\xcd\xff\xd0\xff\x00\x00\x00\x00\x00\x00\xbe\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xf2\xff\xf2\xff\xef\xff\x00\x00\x00\x00\xec\xff\xef\xff\x00\x00\xf5\xff\xf4\xff\xf3\xff\x00\x00\xeb\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xca\xff\xd0\xff\xb3\xff\xb4\xff\x00\x00\x00\x00\xe4\xff\x00\x00\xd2\xff\xd0\xff\x00\x00\xd3\xff\x00\x00\x00\x00\xbd\xff\xfe\xff\x00\x00\x00\x00\xb7\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xb6\xff\xe6\xff\x00\x00\xe5\xff\xe8\xff\xe7\xff\xe9\xff\xea\xff\xe0\xff\xe1\xff\xdf\xff\xe2\xff\xd6\xff\xd7\xff\xd5\xff\xd8\xff\xc6\xff\xc7\xff\x00\x00\x00\x00\xd0\xff\xbf\xff\xc0\xff\x00\x00\xc4\xff\xd0\xff\xc2\xff\x00\x00\x00\x00\xcb\xff\xd4\xff\xde\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xfb\xff\xfa\xff\x00\x00\x00\x00\x00\x00\x00\x00\xf2\xff\x00\x00\x00\x00\xf1\xff\xf0\xff\x00\x00\xef\xff\x00\x00\xe4\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xd9\xff\xda\xff\xdb\xff\xdc\xff\xdd\xff\x00\x00\xb2\xff\x00\x00\x00\x00\xd1\xff\x00\x00\xbc\xff\xb8\xff\xb9\xff\x00\x00\x00\x00\xac\xff\xc3\xff\xd1\xff\xd1\xff\xb5\xff\x00\x00\x00\x00\x00\x00\x00\x00\xf8\xff\xf9\xff\x00\x00\xee\xff\x00\x00\xfd\xff\x00\x00\xed\xff\x00\x00\x00\x00\x00\x00\x00\x00\xad\xff\x00\x00\xd1\xff\xba\xff\x00\x00\x00\x00\x00\x00\x00\x00\xfd\xff\xbe\xff\x00\x00\x00\x00\x00\x00\x00\x00\xae\xff\xb1\xff\x00\x00\x00\x00\xbe\xff\x00\x00\xf7\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xf6\xff\x00\x00\x00\x00\xaf\xff\xb0\xff"#

happyCheck :: HappyAddr
happyCheck = HappyA# "\xff\xff\x24\x00\x01\x00\x02\x00\x03\x00\x04\x00\x39\x00\x06\x00\x06\x00\x08\x00\x09\x00\x37\x00\x13\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x23\x00\x0c\x00\x12\x00\x1b\x00\x1c\x00\x15\x00\x16\x00\x17\x00\x12\x00\x19\x00\x1a\x00\x13\x00\x15\x00\x1d\x00\x18\x00\x32\x00\x33\x00\x1b\x00\x1c\x00\x1b\x00\x1c\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x12\x00\x2b\x00\x2c\x00\x06\x00\x2e\x00\x2f\x00\x30\x00\x31\x00\x01\x00\x02\x00\x03\x00\x04\x00\x12\x00\x06\x00\x06\x00\x08\x00\x09\x00\x37\x00\x37\x00\x37\x00\x06\x00\x1b\x00\x1c\x00\x04\x00\x05\x00\x12\x00\x1f\x00\x08\x00\x15\x00\x12\x00\x13\x00\x12\x00\x19\x00\x1a\x00\x13\x00\x37\x00\x1d\x00\x06\x00\x1b\x00\x1c\x00\x16\x00\x1e\x00\x1b\x00\x1c\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x37\x00\x2b\x00\x2c\x00\x1e\x00\x1f\x00\x2f\x00\x30\x00\x31\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x1b\x00\x1c\x00\x01\x00\x02\x00\x03\x00\x04\x00\x37\x00\x06\x00\x07\x00\x08\x00\x09\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x01\x00\x02\x00\x03\x00\x04\x00\x12\x00\x06\x00\x23\x00\x08\x00\x09\x00\x12\x00\x04\x00\x05\x00\x37\x00\x37\x00\x08\x00\x1d\x00\x12\x00\x12\x00\x12\x00\x1b\x00\x1c\x00\x13\x00\x37\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x1d\x00\x1b\x00\x1c\x00\x12\x00\x1b\x00\x1c\x00\x1b\x00\x1c\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x01\x00\x02\x00\x03\x00\x04\x00\x12\x00\x06\x00\x37\x00\x08\x00\x09\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x01\x00\x02\x00\x03\x00\x04\x00\x12\x00\x06\x00\x37\x00\x08\x00\x09\x00\x20\x00\x21\x00\x22\x00\x12\x00\x01\x00\x02\x00\x1d\x00\x12\x00\x12\x00\x06\x00\x12\x00\x08\x00\x09\x00\x12\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x1d\x00\x06\x00\x12\x00\x37\x00\x12\x00\x13\x00\x1b\x00\x1c\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x1b\x00\x1c\x00\x1e\x00\x1e\x00\x23\x00\x13\x00\x1b\x00\x1c\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x1b\x00\x1c\x00\x1f\x00\x1e\x00\x37\x00\x01\x00\x02\x00\x18\x00\x37\x00\x17\x00\x06\x00\x12\x00\x08\x00\x09\x00\x13\x00\x37\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x1e\x00\x37\x00\x12\x00\x0a\x00\x0b\x00\x0c\x00\x13\x00\x13\x00\x37\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x37\x00\x13\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x04\x00\x05\x00\x01\x00\x13\x00\x08\x00\x0a\x00\x0b\x00\x13\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x0a\x00\x0b\x00\x0c\x00\x13\x00\x0a\x00\x0b\x00\x0c\x00\x13\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x0a\x00\x0b\x00\x0c\x00\x13\x00\x0a\x00\x0b\x00\x0c\x00\x13\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0a\x00\x0b\x00\x10\x00\x11\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0a\x00\x0b\x00\x10\x00\x11\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x1b\x00\x1c\x00\x10\x00\x11\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x03\x00\x04\x00\x10\x00\x11\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x06\x00\x07\x00\x10\x00\x11\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0a\x00\x0b\x00\x0c\x00\x11\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0a\x00\x0b\x00\x0c\x00\x11\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0a\x00\x0b\x00\x0c\x00\x11\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0a\x00\x0b\x00\x0c\x00\x11\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0a\x00\x0b\x00\x0c\x00\x11\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0a\x00\x0b\x00\x0c\x00\x11\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0a\x00\x0b\x00\x0c\x00\x11\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0a\x00\x0b\x00\x0c\x00\x11\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0a\x00\x0b\x00\x0c\x00\x0a\x00\x0b\x00\x0c\x00\x0a\x00\x0b\x00\x0c\x00\x01\x00\x02\x00\x01\x00\x02\x00\x06\x00\x07\x00\x06\x00\x07\x00\x01\x00\x02\x00\x01\x00\x02\x00\x13\x00\x37\x00\x06\x00\x13\x00\x06\x00\x1f\x00\x37\x00\x1f\x00\x23\x00\x34\x00\x36\x00\x35\x00\x2d\x00\x13\x00\x37\x00\x01\x00\x37\x00\x36\x00\x13\x00\x13\x00\x04\x00\x1f\x00\x15\x00\x1f\x00\x2e\x00\x17\x00\x15\x00\x03\x00\x00\x00\x17\x00\x17\x00\x17\x00\x37\x00\x08\x00\x1f\x00\x1f\x00\x03\x00\x37\x00\x37\x00\x0c\x00\x37\x00\x0c\x00\x08\x00\x03\x00\x0c\x00\x03\x00\x03\x00\x0c\x00\x0c\x00\x0c\x00\x0c\x00\x03\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff"#

happyTable :: HappyAddr
happyTable = HappyA# "\x00\x00\x03\x00\xac\xff\xac\xff\xac\xff\xac\xff\xff\xff\xac\xff\x05\x00\xac\xff\xac\xff\x06\x00\x88\x00\x5d\x00\x5e\x00\x5f\x00\x60\x00\x09\x00\x97\x00\xac\xff\x5a\x00\x5b\x00\xac\xff\xac\xff\xac\xff\x56\x00\xac\xff\xac\xff\xab\x00\x11\x00\xac\xff\x57\x00\x0a\x00\x0b\x00\xc5\xff\xc5\xff\x5a\x00\x5b\x00\xac\xff\xac\xff\xac\xff\xac\xff\xac\xff\x33\x00\xac\xff\xac\xff\x0f\x00\xac\xff\xac\xff\xac\xff\xac\xff\x19\x00\x1a\x00\x1b\x00\x1c\x00\xb7\x00\x1d\x00\x0d\x00\x1e\x00\x1f\x00\xc7\x00\x98\x00\xc5\xff\x0c\x00\xc5\xff\xc5\xff\x37\x00\x34\x00\x20\x00\x31\x00\x35\x00\x21\x00\x8c\x00\xc1\xff\x32\x00\x22\x00\x23\x00\xaa\x00\x4d\x00\x24\x00\x40\x00\xc5\xff\xc5\xff\x59\x00\xc1\xff\x5a\x00\x5b\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\xb8\x00\x2a\x00\x2b\x00\x2f\x00\x30\x00\x2c\x00\x2d\x00\x2e\x00\x61\x00\x62\x00\x63\x00\x64\x00\x65\x00\x66\x00\x67\x00\x68\x00\x69\x00\x6a\x00\x61\x00\x62\x00\x63\x00\x64\x00\x65\x00\x66\x00\x67\x00\x68\x00\x69\x00\x6a\x00\x5a\x00\x5b\x00\x19\x00\x1a\x00\x1b\x00\x1c\x00\x4c\x00\x84\x00\x85\x00\x1e\x00\x1f\x00\x5d\x00\x5e\x00\x5f\x00\x60\x00\x19\x00\x1a\x00\x1b\x00\x1c\x00\x20\x00\x4b\x00\x9c\x00\x1e\x00\x1f\x00\x48\x00\x33\x00\x34\x00\x6b\x00\x5c\x00\x35\x00\x24\x00\x47\x00\x20\x00\x46\x00\x5a\x00\x5b\x00\xa8\x00\xba\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x24\x00\x5a\x00\x5b\x00\x45\x00\x5a\x00\x5b\x00\x5a\x00\x5b\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x19\x00\x1a\x00\x1b\x00\x1c\x00\x44\x00\x7f\x00\xb9\x00\x1e\x00\x1f\x00\x61\x00\x62\x00\x63\x00\x64\x00\x19\x00\x1a\x00\x1b\x00\x1c\x00\x20\x00\x4b\x00\xc6\x00\x1e\x00\x1f\x00\x3a\x00\x3b\x00\x3c\x00\x43\x00\x19\x00\x1a\x00\x24\x00\x42\x00\x20\x00\x53\x00\x41\x00\x1e\x00\x1f\x00\x3f\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x24\x00\x37\x00\x6d\x00\x9e\x00\x8c\x00\xc5\xff\xc8\xff\xc8\xff\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\xc5\xff\xc5\xff\x2f\x00\xc5\xff\x9c\x00\xc8\xff\xc8\xff\xc8\xff\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\xc8\xff\xc8\xff\x9d\x00\xc8\xff\x99\x00\x19\x00\x1a\x00\x95\x00\xbd\x00\x8b\x00\x53\x00\x87\x00\x1e\x00\x1f\x00\xb6\x00\xc5\xff\x5d\x00\x5e\x00\x5f\x00\x60\x00\xb5\x00\xd5\x00\x54\x00\x90\x00\x13\x00\x14\x00\xac\x00\x89\x00\xc8\xff\x61\x00\x62\x00\x63\x00\x64\x00\x65\x00\x66\x00\x67\x00\x68\x00\x69\x00\x6a\x00\xb3\x00\x8a\x00\x61\x00\x62\x00\x63\x00\x64\x00\x61\x00\x62\x00\x63\x00\x64\x00\xa0\x00\x34\x00\xa9\x00\xb1\x00\x35\x00\x5f\x00\x60\x00\xb0\x00\x61\x00\x62\x00\x63\x00\x64\x00\x61\x00\x62\x00\x63\x00\x64\x00\x8f\x00\x13\x00\x14\x00\xaf\x00\x8e\x00\x13\x00\x14\x00\xae\x00\x61\x00\x62\x00\x63\x00\x64\x00\x61\x00\x62\x00\x63\x00\x64\x00\x8d\x00\x13\x00\x14\x00\xad\x00\x8c\x00\x13\x00\x14\x00\x8a\x00\x61\x00\x62\x00\x63\x00\x64\x00\x65\x00\x66\x00\x67\x00\x68\x00\x69\x00\x6a\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x63\x00\x64\x00\x16\x00\x17\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x5f\x00\x60\x00\x57\x00\x17\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x5a\x00\x5b\x00\x4d\x00\x17\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\xcf\x00\xd0\x00\xdb\x00\x17\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x9e\x00\x9a\x00\xe6\x00\x17\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x75\x00\x13\x00\x14\x00\xd2\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x74\x00\x13\x00\x14\x00\xd1\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x73\x00\x13\x00\x14\x00\xe0\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x72\x00\x13\x00\x14\x00\xdf\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x71\x00\x13\x00\x14\x00\xde\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x70\x00\x13\x00\x14\x00\xdd\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x6f\x00\x13\x00\x14\x00\xea\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x6e\x00\x13\x00\x14\x00\xe9\x00\x11\x00\x7f\x00\x13\x00\x14\x00\x80\x00\x91\x00\x82\x00\x11\x00\x7f\x00\x13\x00\x14\x00\x80\x00\x81\x00\x82\x00\x11\x00\x7f\x00\x13\x00\x14\x00\x80\x00\xb3\x00\x82\x00\x11\x00\x7f\x00\x13\x00\x14\x00\x80\x00\xb1\x00\x82\x00\x11\x00\x7f\x00\x13\x00\x14\x00\x80\x00\xbd\x00\x82\x00\x11\x00\x7f\x00\x13\x00\x14\x00\x80\x00\xbb\x00\x82\x00\x11\x00\x4e\x00\x13\x00\x4f\x00\x50\x00\x11\x00\x48\x00\x13\x00\x14\x00\x49\x00\x11\x00\x48\x00\x13\x00\x14\x00\x95\x00\x11\x00\x48\x00\x13\x00\x14\x00\x93\x00\x11\x00\x48\x00\x13\x00\x14\x00\x92\x00\x11\x00\x7c\x00\x13\x00\x14\x00\x7d\x00\x11\x00\x48\x00\x13\x00\x14\x00\x7b\x00\x11\x00\x48\x00\x13\x00\x14\x00\x7a\x00\x11\x00\x48\x00\x13\x00\xa5\x00\xa6\x00\x6d\x00\x13\x00\x14\x00\x6b\x00\x13\x00\x14\x00\xba\x00\x13\x00\x4f\x00\x06\x00\x07\x00\x0f\x00\x07\x00\x99\x00\x9a\x00\xc8\x00\x9a\x00\xcb\x00\x07\x00\xdc\x00\x07\x00\xa5\x00\xa4\x00\xa3\x00\xa0\x00\x37\x00\xca\x00\xcb\x00\xc8\x00\x9c\x00\xc5\x00\xc3\x00\xc4\x00\xc2\x00\xc0\x00\xc1\x00\xd1\x00\xda\x00\xd7\x00\xbf\x00\xd4\x00\xe3\x00\xd9\x00\xdb\x00\xd8\x00\xd6\x00\xe5\x00\xe4\x00\xe2\x00\x03\x00\xec\x00\xef\x00\xee\x00\xe6\x00\x0d\x00\xe9\x00\xe8\x00\x3c\x00\xed\x00\xf1\x00\x54\x00\xf0\x00\x51\x00\x3d\x00\x38\x00\x85\x00\xa1\x00\xcd\x00\x79\x00\x78\x00\x77\x00\x76\x00\xcc\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

happyReduceArr = Happy_Data_Array.array (1, 83) [
	(1 , happyReduce_1),
	(2 , happyReduce_2),
	(3 , happyReduce_3),
	(4 , happyReduce_4),
	(5 , happyReduce_5),
	(6 , happyReduce_6),
	(7 , happyReduce_7),
	(8 , happyReduce_8),
	(9 , happyReduce_9),
	(10 , happyReduce_10),
	(11 , happyReduce_11),
	(12 , happyReduce_12),
	(13 , happyReduce_13),
	(14 , happyReduce_14),
	(15 , happyReduce_15),
	(16 , happyReduce_16),
	(17 , happyReduce_17),
	(18 , happyReduce_18),
	(19 , happyReduce_19),
	(20 , happyReduce_20),
	(21 , happyReduce_21),
	(22 , happyReduce_22),
	(23 , happyReduce_23),
	(24 , happyReduce_24),
	(25 , happyReduce_25),
	(26 , happyReduce_26),
	(27 , happyReduce_27),
	(28 , happyReduce_28),
	(29 , happyReduce_29),
	(30 , happyReduce_30),
	(31 , happyReduce_31),
	(32 , happyReduce_32),
	(33 , happyReduce_33),
	(34 , happyReduce_34),
	(35 , happyReduce_35),
	(36 , happyReduce_36),
	(37 , happyReduce_37),
	(38 , happyReduce_38),
	(39 , happyReduce_39),
	(40 , happyReduce_40),
	(41 , happyReduce_41),
	(42 , happyReduce_42),
	(43 , happyReduce_43),
	(44 , happyReduce_44),
	(45 , happyReduce_45),
	(46 , happyReduce_46),
	(47 , happyReduce_47),
	(48 , happyReduce_48),
	(49 , happyReduce_49),
	(50 , happyReduce_50),
	(51 , happyReduce_51),
	(52 , happyReduce_52),
	(53 , happyReduce_53),
	(54 , happyReduce_54),
	(55 , happyReduce_55),
	(56 , happyReduce_56),
	(57 , happyReduce_57),
	(58 , happyReduce_58),
	(59 , happyReduce_59),
	(60 , happyReduce_60),
	(61 , happyReduce_61),
	(62 , happyReduce_62),
	(63 , happyReduce_63),
	(64 , happyReduce_64),
	(65 , happyReduce_65),
	(66 , happyReduce_66),
	(67 , happyReduce_67),
	(68 , happyReduce_68),
	(69 , happyReduce_69),
	(70 , happyReduce_70),
	(71 , happyReduce_71),
	(72 , happyReduce_72),
	(73 , happyReduce_73),
	(74 , happyReduce_74),
	(75 , happyReduce_75),
	(76 , happyReduce_76),
	(77 , happyReduce_77),
	(78 , happyReduce_78),
	(79 , happyReduce_79),
	(80 , happyReduce_80),
	(81 , happyReduce_81),
	(82 , happyReduce_82),
	(83 , happyReduce_83)
	]

happy_n_terms = 58 :: Int
happy_n_nonterms = 18 :: Int

happyReduce_1 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_1 = happyReduce 7# 0# happyReduction_1
happyReduction_1 (happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut5 happy_x_4 of { (HappyWrap5 happy_var_4) -> 
	case happyOut20 happy_x_6 of { (HappyWrap20 happy_var_6) -> 
	happyIn4
		 ((happy_var_4, happy_var_6)
	) `HappyStk` happyRest}}

happyReduce_2 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_2 = happySpecReduce_0  1# happyReduction_2
happyReduction_2  =  happyIn5
		 ([]
	)

happyReduce_3 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_3 = happySpecReduce_2  1# happyReduction_3
happyReduction_3 happy_x_2
	happy_x_1
	 =  case happyOut6 happy_x_1 of { (HappyWrap6 happy_var_1) -> 
	case happyOut5 happy_x_2 of { (HappyWrap5 happy_var_2) -> 
	happyIn5
		 (happy_var_1:happy_var_2
	)}}

happyReduce_4 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_4 = happyReduce 5# 2# happyReduction_4
happyReduction_4 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_2 of { (Token _ (TokenID happy_var_2)) -> 
	case happyOut7 happy_x_4 of { (HappyWrap7 happy_var_4) -> 
	happyIn6
		 (VarDef1 happy_var_2 happy_var_4
	) `HappyStk` happyRest}}

happyReduce_5 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_5 = happyReduce 5# 2# happyReduction_5
happyReduction_5 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut12 happy_x_2 of { (HappyWrap12 happy_var_2) -> 
	case happyOut7 happy_x_4 of { (HappyWrap7 happy_var_4) -> 
	happyIn6
		 (VarDef happy_var_2 happy_var_4
	) `HappyStk` happyRest}}

happyReduce_6 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_6 = happyReduce 7# 2# happyReduction_6
happyReduction_6 (happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_2 of { (Token _ (TokenID happy_var_2)) -> 
	case happyOut7 happy_x_4 of { (HappyWrap7 happy_var_4) -> 
	case happyOut16 happy_x_6 of { (HappyWrap16 happy_var_6) -> 
	happyIn6
		 (R happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest}}}

happyReduce_7 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_7 = happyReduce 7# 2# happyReduction_7
happyReduction_7 (happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_2 of { (Token _ (TokenID happy_var_2)) -> 
	case happyOut7 happy_x_4 of { (HappyWrap7 happy_var_4) -> 
	case happyOut17 happy_x_6 of { (HappyWrap17 happy_var_6) -> 
	happyIn6
		 (B happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest}}}

happyReduce_8 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_8 = happyReduce 12# 2# happyReduction_8
happyReduction_8 (happy_x_12 `HappyStk`
	happy_x_11 `HappyStk`
	happy_x_10 `HappyStk`
	happy_x_9 `HappyStk`
	happy_x_8 `HappyStk`
	happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_2 of { (Token _ (TokenID happy_var_2)) -> 
	case happyOut8 happy_x_4 of { (HappyWrap8 happy_var_4) -> 
	case happyOut10 happy_x_5 of { (HappyWrap10 happy_var_5) -> 
	case happyOut5 happy_x_8 of { (HappyWrap5 happy_var_8) -> 
	case happyOut20 happy_x_10 of { (HappyWrap20 happy_var_10) -> 
	happyIn6
		 (Proc happy_var_2 happy_var_4 happy_var_5 (happy_var_8, happy_var_10)
	) `HappyStk` happyRest}}}}}

happyReduce_9 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_9 = happyReduce 14# 2# happyReduction_9
happyReduction_9 (happy_x_14 `HappyStk`
	happy_x_13 `HappyStk`
	happy_x_12 `HappyStk`
	happy_x_11 `HappyStk`
	happy_x_10 `HappyStk`
	happy_x_9 `HappyStk`
	happy_x_8 `HappyStk`
	happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_2 of { (Token _ (TokenID happy_var_2)) -> 
	case happyOut8 happy_x_4 of { (HappyWrap8 happy_var_4) -> 
	case happyOut10 happy_x_5 of { (HappyWrap10 happy_var_5) -> 
	case happyOut7 happy_x_8 of { (HappyWrap7 happy_var_8) -> 
	case happyOut5 happy_x_10 of { (HappyWrap5 happy_var_10) -> 
	case happyOut20 happy_x_12 of { (HappyWrap20 happy_var_12) -> 
	happyIn6
		 (Func happy_var_2 happy_var_4 happy_var_5 happy_var_8 (happy_var_10, happy_var_12)
	) `HappyStk` happyRest}}}}}}

happyReduce_10 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_10 = happySpecReduce_1  3# happyReduction_10
happyReduction_10 happy_x_1
	 =  happyIn7
		 (BOOL
	)

happyReduce_11 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_11 = happySpecReduce_1  3# happyReduction_11
happyReduction_11 happy_x_1
	 =  happyIn7
		 (REAL
	)

happyReduce_12 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_12 = happySpecReduce_1  3# happyReduction_12
happyReduction_12 happy_x_1
	 =  happyIn7
		 (STRING
	)

happyReduce_13 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_13 = happySpecReduce_0  4# happyReduction_13
happyReduction_13  =  happyIn8
		 ([]
	)

happyReduce_14 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_14 = happySpecReduce_3  4# happyReduction_14
happyReduction_14 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut9 happy_x_1 of { (HappyWrap9 happy_var_1) -> 
	case happyOut8 happy_x_3 of { (HappyWrap8 happy_var_3) -> 
	happyIn8
		 (happy_var_1:happy_var_3
	)}}

happyReduce_15 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_15 = happySpecReduce_3  5# happyReduction_15
happyReduction_15 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut12 happy_x_1 of { (HappyWrap12 happy_var_1) -> 
	case happyOut7 happy_x_3 of { (HappyWrap7 happy_var_3) -> 
	happyIn9
		 ((happy_var_1, happy_var_3)
	)}}

happyReduce_16 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_16 = happySpecReduce_0  6# happyReduction_16
happyReduction_16  =  happyIn10
		 ([]
	)

happyReduce_17 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_17 = happySpecReduce_3  6# happyReduction_17
happyReduction_17 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut11 happy_x_1 of { (HappyWrap11 happy_var_1) -> 
	case happyOut10 happy_x_3 of { (HappyWrap10 happy_var_3) -> 
	happyIn10
		 (happy_var_1:happy_var_3
	)}}

happyReduce_18 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_18 = happyReduce 4# 7# happyReduction_18
happyReduction_18 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_2 of { (Token _ (TokenID happy_var_2)) -> 
	case happyOut7 happy_x_4 of { (HappyWrap7 happy_var_4) -> 
	happyIn11
		 ((happy_var_2, happy_var_4)
	) `HappyStk` happyRest}}

happyReduce_19 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_19 = happySpecReduce_1  8# happyReduction_19
happyReduction_19 happy_x_1
	 =  case happyOutTok happy_x_1 of { (Token _ (TokenID happy_var_1)) -> 
	happyIn12
		 ([happy_var_1]
	)}

happyReduce_20 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_20 = happySpecReduce_3  8# happyReduction_20
happyReduction_20 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { (Token _ (TokenID happy_var_1)) -> 
	case happyOut12 happy_x_3 of { (HappyWrap12 happy_var_3) -> 
	happyIn12
		 (happy_var_1:happy_var_3
	)}}

happyReduce_21 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_21 = happySpecReduce_3  9# happyReduction_21
happyReduction_21 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut14 happy_x_1 of { (HappyWrap14 happy_var_1) -> 
	case happyOut14 happy_x_3 of { (HappyWrap14 happy_var_3) -> 
	happyIn13
		 (Comp "=" happy_var_1 happy_var_3
	)}}

happyReduce_22 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_22 = happySpecReduce_3  9# happyReduction_22
happyReduction_22 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut14 happy_x_1 of { (HappyWrap14 happy_var_1) -> 
	case happyOut14 happy_x_3 of { (HappyWrap14 happy_var_3) -> 
	happyIn13
		 (Comp "<>" happy_var_1 happy_var_3
	)}}

happyReduce_23 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_23 = happySpecReduce_3  9# happyReduction_23
happyReduction_23 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut14 happy_x_1 of { (HappyWrap14 happy_var_1) -> 
	case happyOut14 happy_x_3 of { (HappyWrap14 happy_var_3) -> 
	happyIn13
		 (Comp "<" happy_var_1 happy_var_3
	)}}

happyReduce_24 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_24 = happySpecReduce_3  9# happyReduction_24
happyReduction_24 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut14 happy_x_1 of { (HappyWrap14 happy_var_1) -> 
	case happyOut14 happy_x_3 of { (HappyWrap14 happy_var_3) -> 
	happyIn13
		 (Comp ">" happy_var_1 happy_var_3
	)}}

happyReduce_25 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_25 = happySpecReduce_3  9# happyReduction_25
happyReduction_25 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut14 happy_x_1 of { (HappyWrap14 happy_var_1) -> 
	case happyOut14 happy_x_3 of { (HappyWrap14 happy_var_3) -> 
	happyIn13
		 (Comp "<=" happy_var_1 happy_var_3
	)}}

happyReduce_26 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_26 = happySpecReduce_3  9# happyReduction_26
happyReduction_26 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut14 happy_x_1 of { (HappyWrap14 happy_var_1) -> 
	case happyOut14 happy_x_3 of { (HappyWrap14 happy_var_3) -> 
	happyIn13
		 (Comp ">=" happy_var_1 happy_var_3
	)}}

happyReduce_27 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_27 = happySpecReduce_1  10# happyReduction_27
happyReduction_27 happy_x_1
	 =  case happyOut16 happy_x_1 of { (HappyWrap16 happy_var_1) -> 
	happyIn14
		 (happy_var_1
	)}

happyReduce_28 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_28 = happySpecReduce_1  10# happyReduction_28
happyReduction_28 happy_x_1
	 =  case happyOut15 happy_x_1 of { (HappyWrap15 happy_var_1) -> 
	happyIn14
		 (happy_var_1
	)}

happyReduce_29 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_29 = happySpecReduce_3  10# happyReduction_29
happyReduction_29 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut14 happy_x_1 of { (HappyWrap14 happy_var_1) -> 
	case happyOut14 happy_x_3 of { (HappyWrap14 happy_var_3) -> 
	happyIn14
		 (Op2 "+" happy_var_1 happy_var_3
	)}}

happyReduce_30 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_30 = happySpecReduce_3  10# happyReduction_30
happyReduction_30 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut14 happy_x_1 of { (HappyWrap14 happy_var_1) -> 
	case happyOut14 happy_x_3 of { (HappyWrap14 happy_var_3) -> 
	happyIn14
		 (Op2 "*" happy_var_1 happy_var_3
	)}}

happyReduce_31 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_31 = happySpecReduce_3  10# happyReduction_31
happyReduction_31 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut14 happy_x_1 of { (HappyWrap14 happy_var_1) -> 
	case happyOut14 happy_x_3 of { (HappyWrap14 happy_var_3) -> 
	happyIn14
		 (Op2 "/" happy_var_1 happy_var_3
	)}}

happyReduce_32 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_32 = happySpecReduce_3  10# happyReduction_32
happyReduction_32 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut14 happy_x_1 of { (HappyWrap14 happy_var_1) -> 
	case happyOut14 happy_x_3 of { (HappyWrap14 happy_var_3) -> 
	happyIn14
		 (Op2 "-" happy_var_1 happy_var_3
	)}}

happyReduce_33 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_33 = happySpecReduce_3  10# happyReduction_33
happyReduction_33 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut14 happy_x_2 of { (HappyWrap14 happy_var_2) -> 
	happyIn14
		 (happy_var_2
	)}

happyReduce_34 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_34 = happyReduce 4# 11# happyReduction_34
happyReduction_34 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut14 happy_x_3 of { (HappyWrap14 happy_var_3) -> 
	happyIn15
		 (Op3 "sin" happy_var_3
	) `HappyStk` happyRest}

happyReduce_35 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_35 = happyReduce 4# 11# happyReduction_35
happyReduction_35 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut14 happy_x_3 of { (HappyWrap14 happy_var_3) -> 
	happyIn15
		 (Op3 "cos" happy_var_3
	) `HappyStk` happyRest}

happyReduce_36 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_36 = happyReduce 4# 11# happyReduction_36
happyReduction_36 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut14 happy_x_3 of { (HappyWrap14 happy_var_3) -> 
	happyIn15
		 (Op3 "sqrt" happy_var_3
	) `HappyStk` happyRest}

happyReduce_37 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_37 = happyReduce 4# 11# happyReduction_37
happyReduction_37 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut14 happy_x_3 of { (HappyWrap14 happy_var_3) -> 
	happyIn15
		 (Op3 "exp" happy_var_3
	) `HappyStk` happyRest}

happyReduce_38 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_38 = happyReduce 4# 11# happyReduction_38
happyReduction_38 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut14 happy_x_3 of { (HappyWrap14 happy_var_3) -> 
	happyIn15
		 (Op3 "ln" happy_var_3
	) `HappyStk` happyRest}

happyReduce_39 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_39 = happySpecReduce_3  12# happyReduction_39
happyReduction_39 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut16 happy_x_1 of { (HappyWrap16 happy_var_1) -> 
	case happyOut16 happy_x_3 of { (HappyWrap16 happy_var_3) -> 
	happyIn16
		 (Op2 "+" happy_var_1 happy_var_3
	)}}

happyReduce_40 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_40 = happySpecReduce_3  12# happyReduction_40
happyReduction_40 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut16 happy_x_1 of { (HappyWrap16 happy_var_1) -> 
	case happyOut16 happy_x_3 of { (HappyWrap16 happy_var_3) -> 
	happyIn16
		 (Op2 "*" happy_var_1 happy_var_3
	)}}

happyReduce_41 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_41 = happySpecReduce_3  12# happyReduction_41
happyReduction_41 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut16 happy_x_1 of { (HappyWrap16 happy_var_1) -> 
	case happyOut16 happy_x_3 of { (HappyWrap16 happy_var_3) -> 
	happyIn16
		 (Op2 "/" happy_var_1 happy_var_3
	)}}

happyReduce_42 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_42 = happySpecReduce_3  12# happyReduction_42
happyReduction_42 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut16 happy_x_1 of { (HappyWrap16 happy_var_1) -> 
	case happyOut16 happy_x_3 of { (HappyWrap16 happy_var_3) -> 
	happyIn16
		 (Op2 "-" happy_var_1 happy_var_3
	)}}

happyReduce_43 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_43 = happySpecReduce_3  12# happyReduction_43
happyReduction_43 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut16 happy_x_2 of { (HappyWrap16 happy_var_2) -> 
	happyIn16
		 (happy_var_2
	)}

happyReduce_44 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_44 = happySpecReduce_2  12# happyReduction_44
happyReduction_44 happy_x_2
	happy_x_1
	 =  case happyOut16 happy_x_2 of { (HappyWrap16 happy_var_2) -> 
	happyIn16
		 (happy_var_2
	)}

happyReduce_45 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_45 = happySpecReduce_2  12# happyReduction_45
happyReduction_45 happy_x_2
	happy_x_1
	 =  case happyOut16 happy_x_2 of { (HappyWrap16 happy_var_2) -> 
	happyIn16
		 (Op1 "-" happy_var_2
	)}

happyReduce_46 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_46 = happyReduce 4# 12# happyReduction_46
happyReduction_46 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { (Token _ (TokenID happy_var_1)) -> 
	case happyOut18 happy_x_3 of { (HappyWrap18 happy_var_3) -> 
	happyIn16
		 (FunCallR happy_var_1 happy_var_3
	) `HappyStk` happyRest}}

happyReduce_47 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_47 = happySpecReduce_1  12# happyReduction_47
happyReduction_47 happy_x_1
	 =  case happyOutTok happy_x_1 of { (Token _ (TokenID happy_var_1)) -> 
	happyIn16
		 (Var happy_var_1
	)}

happyReduce_48 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_48 = happySpecReduce_1  12# happyReduction_48
happyReduction_48 happy_x_1
	 =  case happyOutTok happy_x_1 of { (Token _ (TokenReal happy_var_1)) -> 
	happyIn16
		 (Reall happy_var_1
	)}

happyReduce_49 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_49 = happySpecReduce_1  12# happyReduction_49
happyReduction_49 happy_x_1
	 =  case happyOutTok happy_x_1 of { (Token _ (TokenInt happy_var_1)) -> 
	happyIn16
		 (IntR happy_var_1
	)}

happyReduce_50 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_50 = happySpecReduce_1  13# happyReduction_50
happyReduction_50 happy_x_1
	 =  happyIn17
		 (False_C
	)

happyReduce_51 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_51 = happySpecReduce_1  13# happyReduction_51
happyReduction_51 happy_x_1
	 =  happyIn17
		 (True_C
	)

happyReduce_52 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_52 = happySpecReduce_3  13# happyReduction_52
happyReduction_52 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut17 happy_x_2 of { (HappyWrap17 happy_var_2) -> 
	happyIn17
		 (happy_var_2
	)}

happyReduce_53 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_53 = happySpecReduce_2  13# happyReduction_53
happyReduction_53 happy_x_2
	happy_x_1
	 =  case happyOut17 happy_x_2 of { (HappyWrap17 happy_var_2) -> 
	happyIn17
		 (Not happy_var_2
	)}

happyReduce_54 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_54 = happySpecReduce_1  13# happyReduction_54
happyReduction_54 happy_x_1
	 =  case happyOut13 happy_x_1 of { (HappyWrap13 happy_var_1) -> 
	happyIn17
		 (happy_var_1
	)}

happyReduce_55 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_55 = happyReduce 4# 13# happyReduction_55
happyReduction_55 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { (Token _ (TokenID happy_var_1)) -> 
	case happyOut18 happy_x_3 of { (HappyWrap18 happy_var_3) -> 
	happyIn17
		 (FunCallB happy_var_1 happy_var_3
	) `HappyStk` happyRest}}

happyReduce_56 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_56 = happySpecReduce_3  13# happyReduction_56
happyReduction_56 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut17 happy_x_1 of { (HappyWrap17 happy_var_1) -> 
	case happyOut17 happy_x_3 of { (HappyWrap17 happy_var_3) -> 
	happyIn17
		 (OpB "and" happy_var_1 happy_var_3
	)}}

happyReduce_57 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_57 = happySpecReduce_3  13# happyReduction_57
happyReduction_57 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut17 happy_x_1 of { (HappyWrap17 happy_var_1) -> 
	case happyOut17 happy_x_3 of { (HappyWrap17 happy_var_3) -> 
	happyIn17
		 (OpB "or" happy_var_1 happy_var_3
	)}}

happyReduce_58 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_58 = happySpecReduce_1  13# happyReduction_58
happyReduction_58 happy_x_1
	 =  case happyOutTok happy_x_1 of { (Token _ (TokenID happy_var_1)) -> 
	happyIn17
		 (VarB happy_var_1
	)}

happyReduce_59 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_59 = happySpecReduce_1  14# happyReduction_59
happyReduction_59 happy_x_1
	 =  case happyOut19 happy_x_1 of { (HappyWrap19 happy_var_1) -> 
	happyIn18
		 ([happy_var_1]
	)}

happyReduce_60 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_60 = happySpecReduce_3  14# happyReduction_60
happyReduction_60 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut19 happy_x_1 of { (HappyWrap19 happy_var_1) -> 
	case happyOut18 happy_x_3 of { (HappyWrap18 happy_var_3) -> 
	happyIn18
		 (happy_var_1:happy_var_3
	)}}

happyReduce_61 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_61 = happySpecReduce_1  15# happyReduction_61
happyReduction_61 happy_x_1
	 =  case happyOutTok happy_x_1 of { (Token _ (TokenString happy_var_1)) -> 
	happyIn19
		 (LineS happy_var_1
	)}

happyReduce_62 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_62 = happySpecReduce_1  15# happyReduction_62
happyReduction_62 happy_x_1
	 =  case happyOutTok happy_x_1 of { (Token _ (TokenID happy_var_1)) -> 
	happyIn19
		 (LineId happy_var_1
	)}

happyReduce_63 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_63 = happySpecReduce_1  15# happyReduction_63
happyReduction_63 happy_x_1
	 =  case happyOut17 happy_x_1 of { (HappyWrap17 happy_var_1) -> 
	happyIn19
		 (LineB happy_var_1
	)}

happyReduce_64 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_64 = happySpecReduce_1  15# happyReduction_64
happyReduction_64 happy_x_1
	 =  case happyOut14 happy_x_1 of { (HappyWrap14 happy_var_1) -> 
	happyIn19
		 (LineR happy_var_1
	)}

happyReduce_65 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_65 = happySpecReduce_0  16# happyReduction_65
happyReduction_65  =  happyIn20
		 ([]
	)

happyReduce_66 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_66 = happySpecReduce_2  16# happyReduction_66
happyReduction_66 happy_x_2
	happy_x_1
	 =  case happyOut21 happy_x_1 of { (HappyWrap21 happy_var_1) -> 
	case happyOut20 happy_x_2 of { (HappyWrap20 happy_var_2) -> 
	happyIn20
		 (happy_var_1:happy_var_2
	)}}

happyReduce_67 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_67 = happyReduce 4# 17# happyReduction_67
happyReduction_67 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { (Token _ (TokenID happy_var_1)) -> 
	case happyOutTok happy_x_3 of { (Token _ (TokenID happy_var_3)) -> 
	happyIn21
		 (Assign happy_var_1 happy_var_3
	) `HappyStk` happyRest}}

happyReduce_68 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_68 = happyReduce 5# 17# happyReduction_68
happyReduction_68 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { (Token _ (TokenID happy_var_1)) -> 
	case happyOut18 happy_x_3 of { (HappyWrap18 happy_var_3) -> 
	happyIn21
		 (FunCall happy_var_1 happy_var_3
	) `HappyStk` happyRest}}

happyReduce_69 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_69 = happyReduce 7# 17# happyReduction_69
happyReduction_69 (happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { (Token _ (TokenID happy_var_1)) -> 
	case happyOutTok happy_x_3 of { (Token _ (TokenID happy_var_3)) -> 
	case happyOut18 happy_x_5 of { (HappyWrap18 happy_var_5) -> 
	happyIn21
		 (AssignFunCall happy_var_1 happy_var_3 happy_var_5
	) `HappyStk` happyRest}}}

happyReduce_70 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_70 = happyReduce 4# 17# happyReduction_70
happyReduction_70 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { (Token _ (TokenID happy_var_1)) -> 
	case happyOut14 happy_x_3 of { (HappyWrap14 happy_var_3) -> 
	happyIn21
		 (AssignR happy_var_1 happy_var_3
	) `HappyStk` happyRest}}

happyReduce_71 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_71 = happyReduce 4# 17# happyReduction_71
happyReduction_71 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { (Token _ (TokenID happy_var_1)) -> 
	case happyOut17 happy_x_3 of { (HappyWrap17 happy_var_3) -> 
	happyIn21
		 (AssignB happy_var_1 happy_var_3
	) `HappyStk` happyRest}}

happyReduce_72 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_72 = happySpecReduce_2  17# happyReduction_72
happyReduction_72 happy_x_2
	happy_x_1
	 =  case happyOut17 happy_x_1 of { (HappyWrap17 happy_var_1) -> 
	happyIn21
		 (EvalB happy_var_1
	)}

happyReduce_73 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_73 = happySpecReduce_2  17# happyReduction_73
happyReduction_73 happy_x_2
	happy_x_1
	 =  case happyOut14 happy_x_1 of { (HappyWrap14 happy_var_1) -> 
	happyIn21
		 (EvalR happy_var_1
	)}

happyReduce_74 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_74 = happyReduce 5# 17# happyReduction_74
happyReduction_74 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut18 happy_x_3 of { (HappyWrap18 happy_var_3) -> 
	happyIn21
		 (IO "writeln" happy_var_3
	) `HappyStk` happyRest}

happyReduce_75 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_75 = happySpecReduce_2  17# happyReduction_75
happyReduction_75 happy_x_2
	happy_x_1
	 =  happyIn21
		 (StopLoop "break"
	)

happyReduce_76 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_76 = happySpecReduce_2  17# happyReduction_76
happyReduction_76 happy_x_2
	happy_x_1
	 =  happyIn21
		 (StopLoop "continue"
	)

happyReduce_77 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_77 = happyReduce 4# 17# happyReduction_77
happyReduction_77 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut20 happy_x_2 of { (HappyWrap20 happy_var_2) -> 
	happyIn21
		 (Block happy_var_2
	) `HappyStk` happyRest}

happyReduce_78 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_78 = happyReduce 8# 17# happyReduction_78
happyReduction_78 (happy_x_8 `HappyStk`
	happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut17 happy_x_3 of { (HappyWrap17 happy_var_3) -> 
	case happyOut21 happy_x_6 of { (HappyWrap21 happy_var_6) -> 
	case happyOut21 happy_x_8 of { (HappyWrap21 happy_var_8) -> 
	happyIn21
		 (If happy_var_3 happy_var_6 happy_var_8
	) `HappyStk` happyRest}}}

happyReduce_79 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_79 = happyReduce 13# 17# happyReduction_79
happyReduction_79 (happy_x_13 `HappyStk`
	happy_x_12 `HappyStk`
	happy_x_11 `HappyStk`
	happy_x_10 `HappyStk`
	happy_x_9 `HappyStk`
	happy_x_8 `HappyStk`
	happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut17 happy_x_3 of { (HappyWrap17 happy_var_3) -> 
	case happyOut21 happy_x_8 of { (HappyWrap21 happy_var_8) -> 
	case happyOut21 happy_x_11 of { (HappyWrap21 happy_var_11) -> 
	happyIn21
		 (Case "t" happy_var_3 True happy_var_8 False happy_var_11
	) `HappyStk` happyRest}}}

happyReduce_80 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_80 = happyReduce 13# 17# happyReduction_80
happyReduction_80 (happy_x_13 `HappyStk`
	happy_x_12 `HappyStk`
	happy_x_11 `HappyStk`
	happy_x_10 `HappyStk`
	happy_x_9 `HappyStk`
	happy_x_8 `HappyStk`
	happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut17 happy_x_3 of { (HappyWrap17 happy_var_3) -> 
	case happyOut21 happy_x_8 of { (HappyWrap21 happy_var_8) -> 
	case happyOut21 happy_x_11 of { (HappyWrap21 happy_var_11) -> 
	happyIn21
		 (Case "f" happy_var_3 False happy_var_8 True happy_var_11
	) `HappyStk` happyRest}}}

happyReduce_81 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_81 = happyReduce 8# 17# happyReduction_81
happyReduction_81 (happy_x_8 `HappyStk`
	happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_2 of { (Token _ (TokenID happy_var_2)) -> 
	case happyOutTok happy_x_4 of { (Token _ (TokenInt happy_var_4)) -> 
	case happyOutTok happy_x_6 of { (Token _ (TokenInt happy_var_6)) -> 
	case happyOut21 happy_x_8 of { (HappyWrap21 happy_var_8) -> 
	happyIn21
		 (For happy_var_2 happy_var_4 happy_var_6 happy_var_8
	) `HappyStk` happyRest}}}}

happyReduce_82 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_82 = happyReduce 6# 17# happyReduction_82
happyReduction_82 (happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut17 happy_x_3 of { (HappyWrap17 happy_var_3) -> 
	case happyOut21 happy_x_6 of { (HappyWrap21 happy_var_6) -> 
	happyIn21
		 (While happy_var_3 happy_var_6
	) `HappyStk` happyRest}}

happyReduce_83 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_83 = happyReduce 5# 17# happyReduction_83
happyReduction_83 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { (Token _ (TokenID happy_var_1)) -> 
	case happyOut18 happy_x_3 of { (HappyWrap18 happy_var_3) -> 
	happyIn21
		 (ProcCall happy_var_1 happy_var_3
	) `HappyStk` happyRest}}

happyNewToken action sts stk
	= lexer(\tk -> 
	let cont i = happyDoAction i tk action sts stk in
	case tk of {
	Token _ TokenEOF -> happyDoAction 57# tk action sts stk;
	Token _ (TokenInt happy_dollar_dollar) -> cont 1#;
	Token _ (TokenReal happy_dollar_dollar) -> cont 2#;
	Token _ (TokenBool "true") -> cont 3#;
	Token _ (TokenBool "false") -> cont 4#;
	Token _ (TokenBool happy_dollar_dollar) -> cont 5#;
	Token _ (TokenID happy_dollar_dollar) -> cont 6#;
	Token _ (TokenString happy_dollar_dollar) -> cont 7#;
	Token _ (TokenOp "+") -> cont 8#;
	Token _ (TokenOp "-") -> cont 9#;
	Token _ (TokenOp "*") -> cont 10#;
	Token _ (TokenOp "/") -> cont 11#;
	Token _ (TokenOp "=") -> cont 12#;
	Token _ (TokenOp "<>") -> cont 13#;
	Token _ (TokenOp ">") -> cont 14#;
	Token _ (TokenOp "<") -> cont 15#;
	Token _ (TokenOp ">=") -> cont 16#;
	Token _ (TokenOp "<=") -> cont 17#;
	Token _ (TokenK  "(") -> cont 18#;
	Token _ (TokenK  ")") -> cont 19#;
	Token _ (TokenK  "'") -> cont 20#;
	Token _ (TokenK "begin") -> cont 21#;
	Token _ (TokenK "end.") -> cont 22#;
	Token _ (TokenK "end") -> cont 23#;
	Token _ (TokenOp ":=") -> cont 24#;
	Token _ (TokenK "break") -> cont 25#;
	Token _ (TokenK "continue") -> cont 26#;
	Token _ (TokenK "and") -> cont 27#;
	Token _ (TokenK "or") -> cont 28#;
	Token _ (TokenK "not") -> cont 29#;
	Token _ (TokenK ",") -> cont 30#;
	Token _ (TokenOp ":") -> cont 31#;
	Token _ (TokenK "boolean") -> cont 32#;
	Token _ (TokenK "real") -> cont 33#;
	Token _ (TokenK "string") -> cont 34#;
	Token _ (TokenK "var") -> cont 35#;
	Token _ (TokenK "program") -> cont 36#;
	Token _ (TokenK "sin") -> cont 37#;
	Token _ (TokenK "cos") -> cont 38#;
	Token _ (TokenK "sqrt") -> cont 39#;
	Token _ (TokenK "exp") -> cont 40#;
	Token _ (TokenK "ln") -> cont 41#;
	Token _ (TokenK "readln") -> cont 42#;
	Token _ (TokenK "writeln") -> cont 43#;
	Token _ (TokenK "if") -> cont 44#;
	Token _ (TokenK "then") -> cont 45#;
	Token _ (TokenK "else") -> cont 46#;
	Token _ (TokenK "while") -> cont 47#;
	Token _ (TokenK "for") -> cont 48#;
	Token _ (TokenK "case") -> cont 49#;
	Token _ (TokenK "function") -> cont 50#;
	Token _ (TokenK "procedure") -> cont 51#;
	Token _ (TokenK "of") -> cont 52#;
	Token _ (TokenK "to") -> cont 53#;
	Token _ (TokenK "do") -> cont 54#;
	Token _ (TokenK ";") -> cont 55#;
	Token _ (TokenK " ") -> cont 56#;
	_ -> happyError' (tk, [])
	})

happyError_ explist 57# tk = happyError' (tk, explist)
happyError_ explist _ tk = happyError' (tk, explist)

happyThen :: () => Parser a -> (a -> Parser b) -> Parser b
happyThen = (thenP)
happyReturn :: () => a -> Parser a
happyReturn = (returnP)
happyParse :: () => Happy_GHC_Exts.Int# -> Parser (HappyAbsSyn )

happyNewToken :: () => Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )

happyDoAction :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )

happyReduceArr :: () => Happy_Data_Array.Array Int (Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn ))

happyThen1 :: () => Parser a -> (a -> Parser b) -> Parser b
happyThen1 = happyThen
happyReturn1 :: () => a -> Parser a
happyReturn1 = happyReturn
happyError' :: () => ((Token), [String]) -> Parser a
happyError' tk = (\(tokens, explist) -> happyError) tk
happyParser = happySomeParser where
 happySomeParser = happyThen (happyParse 0#) (\x -> happyReturn (let {(HappyWrap4 x') = happyOut4 x} in x'))

happySeq = happyDontSeq



{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $













-- Do not remove this comment. Required to fix CPP parsing when using GCC and a clang-compiled alex.
#if __GLASGOW_HASKELL__ > 706
#define LT(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.<# m)) :: Bool)
#define GTE(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.>=# m)) :: Bool)
#define EQ(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.==# m)) :: Bool)
#else
#define LT(n,m) (n Happy_GHC_Exts.<# m)
#define GTE(n,m) (n Happy_GHC_Exts.>=# m)
#define EQ(n,m) (n Happy_GHC_Exts.==# m)
#endif



















data Happy_IntList = HappyCons Happy_GHC_Exts.Int# Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept 0# tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
        (happyTcHack j (happyTcHack st)) (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action



happyDoAction i tk st
        = {- nothing -}
          case action of
                0#           -> {- nothing -}
                                     happyFail (happyExpListPerState ((Happy_GHC_Exts.I# (st)) :: Int)) i tk st
                -1#          -> {- nothing -}
                                     happyAccept i tk st
                n | LT(n,(0# :: Happy_GHC_Exts.Int#)) -> {- nothing -}
                                                   (happyReduceArr Happy_Data_Array.! rule) i tk st
                                                   where rule = (Happy_GHC_Exts.I# ((Happy_GHC_Exts.negateInt# ((n Happy_GHC_Exts.+# (1# :: Happy_GHC_Exts.Int#))))))
                n                 -> {- nothing -}
                                     happyShift new_state i tk st
                                     where new_state = (n Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#))
   where off    = happyAdjustOffset (indexShortOffAddr happyActOffsets st)
         off_i  = (off Happy_GHC_Exts.+# i)
         check  = if GTE(off_i,(0# :: Happy_GHC_Exts.Int#))
                  then EQ(indexShortOffAddr happyCheck off_i, i)
                  else False
         action
          | check     = indexShortOffAddr happyTable off_i
          | otherwise = indexShortOffAddr happyDefActions st




indexShortOffAddr (HappyA# arr) off =
        Happy_GHC_Exts.narrow16Int# i
  where
        i = Happy_GHC_Exts.word2Int# (Happy_GHC_Exts.or# (Happy_GHC_Exts.uncheckedShiftL# high 8#) low)
        high = Happy_GHC_Exts.int2Word# (Happy_GHC_Exts.ord# (Happy_GHC_Exts.indexCharOffAddr# arr (off' Happy_GHC_Exts.+# 1#)))
        low  = Happy_GHC_Exts.int2Word# (Happy_GHC_Exts.ord# (Happy_GHC_Exts.indexCharOffAddr# arr off'))
        off' = off Happy_GHC_Exts.*# 2#




{-# INLINE happyLt #-}
happyLt x y = LT(x,y)


readArrayBit arr bit =
    Bits.testBit (Happy_GHC_Exts.I# (indexShortOffAddr arr ((unbox_int bit) `Happy_GHC_Exts.iShiftRA#` 4#))) (bit `mod` 16)
  where unbox_int (Happy_GHC_Exts.I# x) = x






data HappyAddr = HappyA# Happy_GHC_Exts.Addr#


-----------------------------------------------------------------------------
-- HappyState data type (not arrays)













-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state 0# tk st sts stk@(x `HappyStk` _) =
     let i = (case Happy_GHC_Exts.unsafeCoerce# x of { (Happy_GHC_Exts.I# (i)) -> i }) in
--     trace "shifting the error token" $
     happyDoAction i tk new_state (HappyCons (st) (sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state (HappyCons (st) (sts)) ((happyInTok (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_0 nt fn j tk st@((action)) sts stk
     = happyGoto nt j tk st (HappyCons (st) (sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@((HappyCons (st@(action)) (_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_2 nt fn j tk _ (HappyCons (_) (sts@((HappyCons (st@(action)) (_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_3 nt fn j tk _ (HappyCons (_) ((HappyCons (_) (sts@((HappyCons (st@(action)) (_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) sts of
         sts1@((HappyCons (st1@(action)) (_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (happyGoto nt j tk st1 sts1 r)

happyMonadReduce k nt fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons (st) (sts)) of
        sts1@((HappyCons (st1@(action)) (_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> happyGoto nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons (st) (sts)) of
        sts1@((HappyCons (st1@(action)) (_))) ->
         let drop_stk = happyDropStk k stk

             off = happyAdjustOffset (indexShortOffAddr happyGotoOffsets st1)
             off_i = (off Happy_GHC_Exts.+# nt)
             new_state = indexShortOffAddr happyTable off_i




          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop 0# l = l
happyDrop n (HappyCons (_) (t)) = happyDrop (n Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) t

happyDropStk 0# l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Happy_GHC_Exts.-# (1#::Happy_GHC_Exts.Int#)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction


happyGoto nt j tk st = 
   {- nothing -}
   happyDoAction j tk new_state
   where off = happyAdjustOffset (indexShortOffAddr happyGotoOffsets st)
         off_i = (off Happy_GHC_Exts.+# nt)
         new_state = indexShortOffAddr happyTable off_i




-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist 0# tk old_st _ stk@(x `HappyStk` _) =
     let i = (case Happy_GHC_Exts.unsafeCoerce# x of { (Happy_GHC_Exts.I# (i)) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (action) sts stk =
--      trace "entering error recovery" $
        happyDoAction 0# tk action sts ((Happy_GHC_Exts.unsafeCoerce# (Happy_GHC_Exts.I# (i))) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions


happyTcHack :: Happy_GHC_Exts.Int# -> a -> a
happyTcHack x y = y
{-# INLINE happyTcHack #-}


-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.


{-# NOINLINE happyDoAction #-}
{-# NOINLINE happyTable #-}
{-# NOINLINE happyCheck #-}
{-# NOINLINE happyActOffsets #-}
{-# NOINLINE happyGotoOffsets #-}
{-# NOINLINE happyDefActions #-}

{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
