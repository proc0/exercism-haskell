module Deque (Deque, mkDeque, pop, push, shift, unshift) where

import Data.IORef

data Deque a =
    Empty
    | One a
    | Two (a,a)
    | Many (a, ([a], a))

type IODeque a = IORef (Deque a)

reduceDeque :: (Deque a -> (Maybe a, Deque a)) -> IODeque a -> IO (Maybe a)
reduceDeque manipDeque deque = do
    curState <- readIORef deque
    result <- return $ manipDeque curState
    writeIORef deque (snd result)
    return $ fst result

mapDeque :: (Deque a -> Deque a) -> IODeque a -> IO ()
mapDeque mapDeq deque = do
    curState <- readIORef deque
    writeIORef deque $ mapDeq curState

mkDeque :: IO (IODeque a)
mkDeque = do
    newState <- newIORef Empty
    return newState

pop :: IODeque a -> IO (Maybe a)
pop = 
    reduceDeque pop'
    where
    pop' deq =
        case deq of
            Empty               -> (Nothing, Empty)
            One a               -> (Just a, Empty)
            Two (a,b)           -> (Just b, One a)
            Many (a, ([b], c))  -> (Just c, Two (a, b))
            Many (a, (bs, c))   -> (Just c, Many (a, (init bs, last bs)))

shift :: IODeque a -> IO (Maybe a)
shift = 
    reduceDeque shift'
    where
    shift' deq =
        case deq of
            Empty               -> (Nothing, Empty)
            One a               -> (Just a, Empty)
            Two (a,b)           -> (Just a, One b)
            Many (a, ([b], c))  -> (Just a, Two (b, c))
            Many (a, (bs, c))   -> (Just a, Many (head bs, (tail bs, c)))

push :: IODeque a -> a -> IO ()
push deque x = 
    mapDeque push' deque
    where
    push' deq =
        case deq of
            Empty               -> One x
            One a               -> Two (a, x)
            Two (a,b)           -> Many (a, ([b], x))
            Many (a, (bs, c))   -> Many (a, (bs ++ [c], x))

unshift :: IODeque a -> a -> IO ()
unshift deque x = 
    mapDeque unshift' deque
    where
    unshift' deq =
        case deq of
            Empty               -> One x
            One a               -> Two (x, a)
            Two (a,b)           -> Many (x, ([a], b))
            Many (a, (bs, c))   -> Many (x, (a:bs, c))
