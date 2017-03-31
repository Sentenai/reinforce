-------------------------------------------------------------------------------
-- |
-- Module    :  Classifiers.RL.Control.MonadEnv
-- Copyright :  (c) Sentenai 2017
-- License   :  Proprietary
-- Maintainer:  sam@sentenai.com
-- Stability :  experimental
-- Portability: non-portable
--
-- Public API to MonadEnv - to implement an environment, see
-- 'Classifiers.RL.Control.MonadEnv.Internal'
-------------------------------------------------------------------------------
module Control.MonadEnv
  ( MonadEnv
  , reset
  , step
  , Obs(..)
  , Reward
  ) where

import Reinforce.Prelude
import Control.MonadEnv.Internal (Obs(..), Reward, MonadEnv)
import qualified Control.MonadEnv.Internal as I

-- | API for resetting an environment
reset :: MonadEnv e s a r => e (Obs r s)
reset = I.reset

-- | API to step though an environment using an action.
step :: MonadEnv e s a r => a -> e (Obs r s)
step a = do
  I.runAction a
  I.reward a >>= I.step a

