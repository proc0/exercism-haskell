{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_rotational_cipher (
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
version = Version [1,1,0,1] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Exercism\\haskell\\rotational-cipher\\.stack-work\\install\\34070b1b\\bin"
libdir     = "C:\\Exercism\\haskell\\rotational-cipher\\.stack-work\\install\\34070b1b\\lib\\x86_64-windows-ghc-8.0.2\\rotational-cipher-1.1.0.1-9go241enq9zGHpA7gJ72tT"
dynlibdir  = "C:\\Exercism\\haskell\\rotational-cipher\\.stack-work\\install\\34070b1b\\lib\\x86_64-windows-ghc-8.0.2"
datadir    = "C:\\Exercism\\haskell\\rotational-cipher\\.stack-work\\install\\34070b1b\\share\\x86_64-windows-ghc-8.0.2\\rotational-cipher-1.1.0.1"
libexecdir = "C:\\Exercism\\haskell\\rotational-cipher\\.stack-work\\install\\34070b1b\\libexec"
sysconfdir = "C:\\Exercism\\haskell\\rotational-cipher\\.stack-work\\install\\34070b1b\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "rotational_cipher_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "rotational_cipher_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "rotational_cipher_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "rotational_cipher_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "rotational_cipher_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "rotational_cipher_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
