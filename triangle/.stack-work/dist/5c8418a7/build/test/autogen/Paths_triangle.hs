{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_triangle (
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
version = Version [0,1,0,2] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Exercism\\haskell\\triangle\\.stack-work\\install\\d318cd9c\\bin"
libdir     = "C:\\Exercism\\haskell\\triangle\\.stack-work\\install\\d318cd9c\\lib\\x86_64-windows-ghc-8.2.2\\triangle-0.1.0.2-ICwx53UZXDbJKzjI3XMZnk-test"
dynlibdir  = "C:\\Exercism\\haskell\\triangle\\.stack-work\\install\\d318cd9c\\lib\\x86_64-windows-ghc-8.2.2"
datadir    = "C:\\Exercism\\haskell\\triangle\\.stack-work\\install\\d318cd9c\\share\\x86_64-windows-ghc-8.2.2\\triangle-0.1.0.2"
libexecdir = "C:\\Exercism\\haskell\\triangle\\.stack-work\\install\\d318cd9c\\libexec\\x86_64-windows-ghc-8.2.2\\triangle-0.1.0.2"
sysconfdir = "C:\\Exercism\\haskell\\triangle\\.stack-work\\install\\d318cd9c\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "triangle_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "triangle_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "triangle_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "triangle_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "triangle_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "triangle_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
