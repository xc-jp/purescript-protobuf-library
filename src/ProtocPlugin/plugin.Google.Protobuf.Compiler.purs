-- | Generated by __purescript-protobuf__ from file `google/protobuf/compiler/plugin.proto`
module Google.Protobuf.Compiler.Plugin
( Version(..), VersionRow, VersionR, parseVersion, putVersion, defaultVersion, mkVersion
, CodeGeneratorRequest(..), CodeGeneratorRequestRow, CodeGeneratorRequestR, parseCodeGeneratorRequest, putCodeGeneratorRequest, defaultCodeGeneratorRequest, mkCodeGeneratorRequest
, CodeGeneratorResponse(..), CodeGeneratorResponseRow, CodeGeneratorResponseR, parseCodeGeneratorResponse, putCodeGeneratorResponse, defaultCodeGeneratorResponse, mkCodeGeneratorResponse
, CodeGeneratorResponse_File(..), CodeGeneratorResponse_FileRow, CodeGeneratorResponse_FileR, parseCodeGeneratorResponse_File, putCodeGeneratorResponse_File, defaultCodeGeneratorResponse_File, mkCodeGeneratorResponse_File
)
where

import Prelude
import Effect.Class (class MonadEffect)
import Control.Monad.Rec.Class (class MonadRec)
import Record.Builder as Record.Builder
import Data.Array as Array
import Data.Bounded as Bounded
import Data.Enum as Enum
import Data.Eq as Eq
import Data.Function as Function
import Data.Float32 as Float32
import Data.Show as Show
import Data.Ord as Ord
import Data.Maybe as Maybe
import Data.Newtype as Newtype
import Data.Generic.Rep as Generic.Rep
import Data.Generic.Rep.Show as Generic.Rep.Show
import Data.Generic.Rep.Bounded as Generic.Rep.Bounded
import Data.Generic.Rep.Enum as Generic.Rep.Enum
import Data.Generic.Rep.Ord as Generic.Rep.Ord
import Data.Semigroup as Semigroup
import Data.Semiring as Semiring
import Data.String as String
import Data.Symbol as Symbol
import Record as Record
import Data.Traversable as Traversable
import Data.UInt as UInt
import Data.Unit as Unit
import Prim.Row as Prim.Row
import Data.Long.Internal as Long
import Text.Parsing.Parser as Parser
import Data.ArrayBuffer.Builder as ArrayBuffer.Builder
import Data.ArrayBuffer.Types as ArrayBuffer.Types
import Data.ArrayBuffer.ArrayBuffer as ArrayBuffer
import Protobuf.Common as Common
import Protobuf.Decode as Decode
import Protobuf.Encode as Encode
import Protobuf.Runtime as Runtime

import Google.Protobuf.Descriptor as Google.Protobuf



type VersionRow =
  ( major :: Maybe.Maybe Int
  , minor :: Maybe.Maybe Int
  , patch :: Maybe.Maybe Int
  , suffix :: Maybe.Maybe String
  , __unknown_fields :: Array Runtime.UnknownField
  )
type VersionR = Record VersionRow
newtype Version = Version VersionR
derive instance genericVersion :: Generic.Rep.Generic Version _
derive instance newtypeVersion :: Newtype.Newtype Version _
derive instance eqVersion :: Eq.Eq Version
instance showVersion :: Show.Show Version where show x = Generic.Rep.Show.genericShow x

putVersion :: forall m. MonadEffect m => Version -> ArrayBuffer.Builder.PutM m Unit.Unit
putVersion (Version r) = do
  Runtime.putOptional 1 r.major (_==Semiring.zero) Encode.int32
  Runtime.putOptional 2 r.minor (_==Semiring.zero) Encode.int32
  Runtime.putOptional 3 r.patch (_==Semiring.zero) Encode.int32
  Runtime.putOptional 4 r.suffix String.null Encode.string
  Traversable.traverse_ Runtime.putFieldUnknown r.__unknown_fields

parseVersion :: forall m. MonadEffect m => MonadRec m => Int -> Parser.ParserT ArrayBuffer.Types.DataView m Version
parseVersion length = Runtime.label "Version / " $
  Runtime.parseMessage Version defaultVersion parseField length
 where
  parseField
    :: Runtime.FieldNumberInt
    -> Common.WireType
    -> Parser.ParserT ArrayBuffer.Types.DataView m (Record.Builder.Builder VersionR VersionR)
  parseField 1 Common.VarInt = Runtime.label "major / " $ do
    x <- Decode.int32
    pure $ Record.Builder.modify (Symbol.SProxy :: Symbol.SProxy "major") $ Function.const $ Maybe.Just x
  parseField 2 Common.VarInt = Runtime.label "minor / " $ do
    x <- Decode.int32
    pure $ Record.Builder.modify (Symbol.SProxy :: Symbol.SProxy "minor") $ Function.const $ Maybe.Just x
  parseField 3 Common.VarInt = Runtime.label "patch / " $ do
    x <- Decode.int32
    pure $ Record.Builder.modify (Symbol.SProxy :: Symbol.SProxy "patch") $ Function.const $ Maybe.Just x
  parseField 4 Common.LenDel = Runtime.label "suffix / " $ do
    x <- Decode.string
    pure $ Record.Builder.modify (Symbol.SProxy :: Symbol.SProxy "suffix") $ Function.const $ Maybe.Just x
  parseField fieldNumber wireType = Runtime.parseFieldUnknown fieldNumber wireType

defaultVersion :: VersionR
defaultVersion =
  { major: Maybe.Nothing
  , minor: Maybe.Nothing
  , patch: Maybe.Nothing
  , suffix: Maybe.Nothing
  , __unknown_fields: []
  }

mkVersion :: forall r1 r3. Prim.Row.Union r1 VersionRow r3 => Prim.Row.Nub r3 VersionRow => Record r1 -> Version
mkVersion r = Version $ Record.merge r defaultVersion


type CodeGeneratorRequestRow =
  ( file_to_generate :: Array String
  , parameter :: Maybe.Maybe String
  , proto_file :: Array Google.Protobuf.FileDescriptorProto
  , compiler_version :: Maybe.Maybe Version
  , __unknown_fields :: Array Runtime.UnknownField
  )
type CodeGeneratorRequestR = Record CodeGeneratorRequestRow
newtype CodeGeneratorRequest = CodeGeneratorRequest CodeGeneratorRequestR
derive instance genericCodeGeneratorRequest :: Generic.Rep.Generic CodeGeneratorRequest _
derive instance newtypeCodeGeneratorRequest :: Newtype.Newtype CodeGeneratorRequest _
derive instance eqCodeGeneratorRequest :: Eq.Eq CodeGeneratorRequest
instance showCodeGeneratorRequest :: Show.Show CodeGeneratorRequest where show x = Generic.Rep.Show.genericShow x

putCodeGeneratorRequest :: forall m. MonadEffect m => CodeGeneratorRequest -> ArrayBuffer.Builder.PutM m Unit.Unit
putCodeGeneratorRequest (CodeGeneratorRequest r) = do
  Runtime.putRepeated 1 r.file_to_generate Encode.string
  Runtime.putOptional 2 r.parameter String.null Encode.string
  Runtime.putRepeated 15 r.proto_file $ Runtime.putLenDel Google.Protobuf.putFileDescriptorProto
  Runtime.putOptional 3 r.compiler_version (const false) $ Runtime.putLenDel putVersion
  Traversable.traverse_ Runtime.putFieldUnknown r.__unknown_fields

parseCodeGeneratorRequest :: forall m. MonadEffect m => MonadRec m => Int -> Parser.ParserT ArrayBuffer.Types.DataView m CodeGeneratorRequest
parseCodeGeneratorRequest length = Runtime.label "CodeGeneratorRequest / " $
  Runtime.parseMessage CodeGeneratorRequest defaultCodeGeneratorRequest parseField length
 where
  parseField
    :: Runtime.FieldNumberInt
    -> Common.WireType
    -> Parser.ParserT ArrayBuffer.Types.DataView m (Record.Builder.Builder CodeGeneratorRequestR CodeGeneratorRequestR)
  parseField 1 Common.LenDel = Runtime.label "file_to_generate / " $ do
    x <- Decode.string
    pure $ Record.Builder.modify (Symbol.SProxy :: Symbol.SProxy "file_to_generate") $ Function.flip Array.snoc x
  parseField 2 Common.LenDel = Runtime.label "parameter / " $ do
    x <- Decode.string
    pure $ Record.Builder.modify (Symbol.SProxy :: Symbol.SProxy "parameter") $ Function.const $ Maybe.Just x
  parseField 15 Common.LenDel = Runtime.label "proto_file / " $ do
    x <- Runtime.parseLenDel Google.Protobuf.parseFileDescriptorProto
    pure $ Record.Builder.modify (Symbol.SProxy :: Symbol.SProxy "proto_file") $ Function.flip Array.snoc x
  parseField 3 Common.LenDel = Runtime.label "compiler_version / " $ do
    x <- Runtime.parseLenDel parseVersion
    pure $ Record.Builder.modify (Symbol.SProxy :: Symbol.SProxy "compiler_version") $ Function.const $ Maybe.Just x
  parseField fieldNumber wireType = Runtime.parseFieldUnknown fieldNumber wireType

defaultCodeGeneratorRequest :: CodeGeneratorRequestR
defaultCodeGeneratorRequest =
  { file_to_generate: []
  , parameter: Maybe.Nothing
  , proto_file: []
  , compiler_version: Maybe.Nothing
  , __unknown_fields: []
  }

mkCodeGeneratorRequest :: forall r1 r3. Prim.Row.Union r1 CodeGeneratorRequestRow r3 => Prim.Row.Nub r3 CodeGeneratorRequestRow => Record r1 -> CodeGeneratorRequest
mkCodeGeneratorRequest r = CodeGeneratorRequest $ Record.merge r defaultCodeGeneratorRequest


type CodeGeneratorResponseRow =
  ( error :: Maybe.Maybe String
  , file :: Array CodeGeneratorResponse_File
  , __unknown_fields :: Array Runtime.UnknownField
  )
type CodeGeneratorResponseR = Record CodeGeneratorResponseRow
newtype CodeGeneratorResponse = CodeGeneratorResponse CodeGeneratorResponseR
derive instance genericCodeGeneratorResponse :: Generic.Rep.Generic CodeGeneratorResponse _
derive instance newtypeCodeGeneratorResponse :: Newtype.Newtype CodeGeneratorResponse _
derive instance eqCodeGeneratorResponse :: Eq.Eq CodeGeneratorResponse
instance showCodeGeneratorResponse :: Show.Show CodeGeneratorResponse where show x = Generic.Rep.Show.genericShow x

putCodeGeneratorResponse :: forall m. MonadEffect m => CodeGeneratorResponse -> ArrayBuffer.Builder.PutM m Unit.Unit
putCodeGeneratorResponse (CodeGeneratorResponse r) = do
  Runtime.putOptional 1 r.error String.null Encode.string
  Runtime.putRepeated 15 r.file $ Runtime.putLenDel putCodeGeneratorResponse_File
  Traversable.traverse_ Runtime.putFieldUnknown r.__unknown_fields

parseCodeGeneratorResponse :: forall m. MonadEffect m => MonadRec m => Int -> Parser.ParserT ArrayBuffer.Types.DataView m CodeGeneratorResponse
parseCodeGeneratorResponse length = Runtime.label "CodeGeneratorResponse / " $
  Runtime.parseMessage CodeGeneratorResponse defaultCodeGeneratorResponse parseField length
 where
  parseField
    :: Runtime.FieldNumberInt
    -> Common.WireType
    -> Parser.ParserT ArrayBuffer.Types.DataView m (Record.Builder.Builder CodeGeneratorResponseR CodeGeneratorResponseR)
  parseField 1 Common.LenDel = Runtime.label "error / " $ do
    x <- Decode.string
    pure $ Record.Builder.modify (Symbol.SProxy :: Symbol.SProxy "error") $ Function.const $ Maybe.Just x
  parseField 15 Common.LenDel = Runtime.label "file / " $ do
    x <- Runtime.parseLenDel parseCodeGeneratorResponse_File
    pure $ Record.Builder.modify (Symbol.SProxy :: Symbol.SProxy "file") $ Function.flip Array.snoc x
  parseField fieldNumber wireType = Runtime.parseFieldUnknown fieldNumber wireType

defaultCodeGeneratorResponse :: CodeGeneratorResponseR
defaultCodeGeneratorResponse =
  { error: Maybe.Nothing
  , file: []
  , __unknown_fields: []
  }

mkCodeGeneratorResponse :: forall r1 r3. Prim.Row.Union r1 CodeGeneratorResponseRow r3 => Prim.Row.Nub r3 CodeGeneratorResponseRow => Record r1 -> CodeGeneratorResponse
mkCodeGeneratorResponse r = CodeGeneratorResponse $ Record.merge r defaultCodeGeneratorResponse


type CodeGeneratorResponse_FileRow =
  ( name :: Maybe.Maybe String
  , insertion_point :: Maybe.Maybe String
  , content :: Maybe.Maybe String
  , __unknown_fields :: Array Runtime.UnknownField
  )
type CodeGeneratorResponse_FileR = Record CodeGeneratorResponse_FileRow
newtype CodeGeneratorResponse_File = CodeGeneratorResponse_File CodeGeneratorResponse_FileR
derive instance genericCodeGeneratorResponse_File :: Generic.Rep.Generic CodeGeneratorResponse_File _
derive instance newtypeCodeGeneratorResponse_File :: Newtype.Newtype CodeGeneratorResponse_File _
derive instance eqCodeGeneratorResponse_File :: Eq.Eq CodeGeneratorResponse_File
instance showCodeGeneratorResponse_File :: Show.Show CodeGeneratorResponse_File where show x = Generic.Rep.Show.genericShow x

putCodeGeneratorResponse_File :: forall m. MonadEffect m => CodeGeneratorResponse_File -> ArrayBuffer.Builder.PutM m Unit.Unit
putCodeGeneratorResponse_File (CodeGeneratorResponse_File r) = do
  Runtime.putOptional 1 r.name String.null Encode.string
  Runtime.putOptional 2 r.insertion_point String.null Encode.string
  Runtime.putOptional 15 r.content String.null Encode.string
  Traversable.traverse_ Runtime.putFieldUnknown r.__unknown_fields

parseCodeGeneratorResponse_File :: forall m. MonadEffect m => MonadRec m => Int -> Parser.ParserT ArrayBuffer.Types.DataView m CodeGeneratorResponse_File
parseCodeGeneratorResponse_File length = Runtime.label "File / " $
  Runtime.parseMessage CodeGeneratorResponse_File defaultCodeGeneratorResponse_File parseField length
 where
  parseField
    :: Runtime.FieldNumberInt
    -> Common.WireType
    -> Parser.ParserT ArrayBuffer.Types.DataView m (Record.Builder.Builder CodeGeneratorResponse_FileR CodeGeneratorResponse_FileR)
  parseField 1 Common.LenDel = Runtime.label "name / " $ do
    x <- Decode.string
    pure $ Record.Builder.modify (Symbol.SProxy :: Symbol.SProxy "name") $ Function.const $ Maybe.Just x
  parseField 2 Common.LenDel = Runtime.label "insertion_point / " $ do
    x <- Decode.string
    pure $ Record.Builder.modify (Symbol.SProxy :: Symbol.SProxy "insertion_point") $ Function.const $ Maybe.Just x
  parseField 15 Common.LenDel = Runtime.label "content / " $ do
    x <- Decode.string
    pure $ Record.Builder.modify (Symbol.SProxy :: Symbol.SProxy "content") $ Function.const $ Maybe.Just x
  parseField fieldNumber wireType = Runtime.parseFieldUnknown fieldNumber wireType

defaultCodeGeneratorResponse_File :: CodeGeneratorResponse_FileR
defaultCodeGeneratorResponse_File =
  { name: Maybe.Nothing
  , insertion_point: Maybe.Nothing
  , content: Maybe.Nothing
  , __unknown_fields: []
  }

mkCodeGeneratorResponse_File :: forall r1 r3. Prim.Row.Union r1 CodeGeneratorResponse_FileRow r3 => Prim.Row.Nub r3 CodeGeneratorResponse_FileRow => Record r1 -> CodeGeneratorResponse_File
mkCodeGeneratorResponse_File r = CodeGeneratorResponse_File $ Record.merge r defaultCodeGeneratorResponse_File


