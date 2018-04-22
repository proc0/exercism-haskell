module SpaceAge (Planet(..), ageOn) where

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune

getPlanetSeconds :: Planet -> Float
getPlanetSeconds planet = 
    let t = 31557600
        yrs = (* t)
    in case planet of 
        Mercury -> yrs 0.2408467
        Venus   -> yrs 0.61519726
        Mars    -> yrs 1.8808158
        Jupiter -> yrs 11.862615
        Saturn  -> yrs 29.447498
        Uranus  -> yrs 84.016846
        Neptune -> yrs 164.79132
        otherwise -> t          

ageOn :: Planet -> Float -> Float
ageOn = (flip (/)) . getPlanetSeconds
