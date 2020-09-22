module Main where

import Control.Monad.IO.Class (MonadIO (liftIO))

-- REPRODUCER 1:
-- 1. Hover over liftIO
-- 2. Click "lightbulb" and select "Add `MonadIO m` to the context of the type signature for `a`"

-- Buggy behavior 1: syntactically malformed signature is created: "a :: (Monad m, MonadIO m)m) => m ()"
a :: (Monad m) => m ()
a = liftIO (pure ())


-- REPRODUCER 2 - note that the signature begins on the next line than the symbol being annotated:
-- 1. Hover over liftIO
-- 2. Click "lightbulb" and select "Add `MonadIO m` to the context of the type signature for `a`"

-- Buggy behavior 2: The new context is added at the end of file (!)


b
   :: ( Monad m
      )
    =>  m ()
b = liftIO $ pure ()

main :: IO ()
main = pure ()
