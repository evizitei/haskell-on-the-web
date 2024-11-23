{-# LANGUAGE ForeignFunctionInterface #-}

foreign export ccall add :: Int -> Int -> Int

add :: Num a => a -> a -> a
add x y = x + y

main :: IO ()
main = return ()