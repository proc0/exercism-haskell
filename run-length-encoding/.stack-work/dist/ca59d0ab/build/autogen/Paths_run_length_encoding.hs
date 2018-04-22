{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_run_length_encoding (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [1,0,0,3] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Exercism\\haskell\\run-length-encoding\\.stack-work\\install\\ed14a2f4\\bin"
libdir     = "C:\\Exercism\\haskell\\run-length-encoding\\.stack-work\\install\\ed14a2f4\\lib\\x86_64-windows-ghc-8.0.2\\run-length-encoding-1.0.0.3-1yhuJkF6HTz7uP47uqEee0"
dynlibdir  = "C:\\Exercism\\haskell\\run-length-encoding\\.stack-work\\install\\ed14a2f4\\lib\\x86_64-windows-ghc-8.0.2"
datadir    = "C:\\Exercism\\haskell\\run-length-encoding\\.stack-work\\install\\ed14a2f4\\share\\x86_64-windows-ghc-8.0.2\\run-length-encoding-1.0.0.3"
libexecdir = "C:\\Exercism\\haskell\\run-length-encoding\\.stack-work\\install\\ed14a2f4\\libexec"
sysconfdir = "C:\\Exercism\\haskell\\run-length-encoding\\.stack-work\\install\\ed14a2f4\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "run_length_encoding_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "run_length_encoding_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "run_length_encoding_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "run_length_encoding_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "run_length_encoding_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "run_length_encoding_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
