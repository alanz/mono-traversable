{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TypeFamilies #-}
module ClassyPrelude.HashSet
    ( HashSet
    ) where

import qualified Prelude
import Prelude ((.), Char, Eq)
import ClassyPrelude.Classes
import Data.HashSet (HashSet)
import qualified Data.HashSet as Set
import Data.Hashable (Hashable)

type Set = HashSet

instance (Eq b, Hashable b, a ~ a', co ~ Set b) => CanMap (Set a) co a' b where
    map = Set.map
instance CanLength (Set x) Prelude.Int where
    length = Set.size
instance Hashable x => CanSingleton (Set x) x where
    singleton = Set.singleton
instance CanNull (Set x) where
    null = Set.null
instance (Hashable x, Eq x) => CanPack (Set x) x where
    pack = Set.fromList
    unpack = Set.toList
instance CanEmpty (Set x) where
    empty = Set.empty
instance (Eq x, Hashable x, Set x ~ s, x ~ x') => CanInsert (x' -> s -> Set x) where
    insert = Set.insert
instance (Eq x, Hashable x) => CanMember (Set x) x where
    member = Set.member
