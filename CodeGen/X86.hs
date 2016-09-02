{-# language PatternSynonyms #-}
module CodeGen.X86
    (
    -- * Byte sequences
      Bytes (..)
    , HasBytes (..)
    -- * Sizes (in bits)
    , Size (..)
    , HasSize (..)
    , IsSize
    -- * Registers
    -- ** 64 bit registers
    , rax, rcx, rdx, rbx, rsp, rbp, rsi, rdi, r8, r9, r10, r11, r12, r13, r14, r15
    -- ** 32 bit registers
    , eax, ecx, edx, ebx, esp, ebp, esi, edi, r8d, r9d, r10d, r11d, r12d, r13d, r14d, r15d
    -- ** 16 bit registers
    , ax, cx, dx, bx, sp, bp, si, di, r8w, r9w, r10w, r11w, r12w, r13w, r14w, r15w
    -- ** 8 bit low registers
    , al, cl, dl, bl, spl, bpl, sil, dil, r8b, r9b, r10b, r11b, r12b, r13b, r14b, r15b
    -- ** 8 bit high registers
    , ah, ch, dh, bh
    -- ** SSE registers
    , xmm0, xmm1, xmm2, xmm3, xmm4, xmm5, xmm6, xmm7
    -- * Addresses
    , addr
    , addr8
    , addr16
    , addr32
    , addr64
    , ipRel
    , ipRel8
    -- * Operands
    , Access (..)
    , Operand
    , resizeOperand
    -- * Conditions
    , Condition
    , pattern O
    , pattern NO
    , pattern B,  pattern C
    , pattern NB, pattern NC
    , pattern E,  pattern Z
    , pattern NE, pattern NZ
    , pattern NA, pattern BE
    , pattern A,  pattern NBE
    , pattern S
    , pattern NS
    , pattern P
    , pattern NP
    , pattern L
    , pattern NL
    , pattern NG, pattern LE
    , pattern G,  pattern NLE
    -- * Instructions
    , Code, CodeM
    -- ** Pseudo instructions
    , db
    , align
    , Label
    , label
    -- ** Control
    , j
    , jmp
    , jmpq
    , call
    , ret
    -- ** Flags
    , cmc
    , clc
    , stc
    , cli
    , sti
    , cld
    , std
    , pushf
    , popf
    , cmp
    , test
    -- ** Arithmetic
    , inc
    , dec
    , not_
    , neg
    , add
    , adc
    , sub
    , sbb
    , and_
    , or_
    , xor_
    , rol
    , ror
    , rcl
    , rcr
    , shl
    , shr
    , sar
    , lea
    -- ** Other
    , nop
    , xchg
    , mov
    , cmov
    , pop
    , push
    -- ** SSE
    , movd
    , movq
    , movdqa
    , paddb
    , paddw
    , paddd
    , paddq
    , psubb
    , psubw
    , psubd
    , psubq
    , pxor
    , psllw
    , pslld
    , psllq
    , pslldq
    , psrlw
    , psrld
    , psrlq
    , psrldq
    , psraw
    , psrad
    -- * Compound instructions
    , unless
    , doWhile
    , if_
    , leaData
    , traceReg
    -- * Compilation
    , Callable
    , compile
    -- * Calling convention
    , saveNonVolatile
    , arg1, arg2, arg3, arg4
    , result
    -- * Calling C and Haskell from Assembly
    , callFun
    , printf
    , CallableHs
    , hsPtr
    , CString (..)
    -- * Misc
    , runTests
    ) where

import Data.Monoid

import CodeGen.X86.Asm
import CodeGen.X86.CodeGen
import CodeGen.X86.FFI
import CodeGen.X86.CallConv
import CodeGen.X86.Utils
import CodeGen.X86.Tests

