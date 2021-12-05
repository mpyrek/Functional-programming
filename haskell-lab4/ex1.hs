import Data.Char

type Name= String
capitalazeName  :: Name -> Name 
capitalazeName = map toUpper


polarToCartesian :: Floating a  => (a,a)->(a,a)
polarToCartesian (r,phi) = (r * cos phi, r * sin phi)

type CartesianCoord' a = (a,a)
type PolarCoord' a = (a,a)

polarToCartesian' :: Floating a => PolarCoord' a -> CartesianCoord' a 
polarToCartesian' (r,phi) = (r * cos phi, r * sin phi)


--czemu nie tak???
polarToCartesian2' :: Floating a => PolarCoord' a -> PolarCoord' a 
polarToCartesian2' (r,phi) = (r * cos phi, r * sin phi)

newtype CartesianCoord'' a = MkCartesianCoord'' (a,a)
newtype PolarCoord'' a = MkPolarCoord'' (a,a)

polarToCartesian3'' :: Floating a => PolarCoord'' a -> PolarCoord'' a
polarToCartesian3'' (MkPolarCoord'' (r,phi)) = MkPolarCoord'' (r * cos phi, r * sin phi)

--odp1: polarToCartesian''(MkPolarCoord'' (1,pi/4))
--uwaga złożenie funkcji może wystąpic tylko w takim przypadku jak powyżej
--w przypadku jak poniżej żłożenie funkcji już nie może wystąpić

polarToCartesian'' :: Floating a => PolarCoord'' a -> CartesianCoord'' a
polarToCartesian'' (MkPolarCoord'' (r,phi)) = MkCartesianCoord'' (r * cos phi, r * sin phi)


--zad. 3

personInfoToString :: (String,String,String) -> String
personInfoToString (nm,snm,addr) = "name: " ++ nm ++ ", surname: " ++ snm ++ ", addr: " ++ addr


type Name' = String
type Surname' = String
type Address' = String
type PersonInfo' = (Name', Surname', Address')
type PersonInfoToStringType' = PersonInfo' -> String

personInfoToString' :: PersonInfoToStringType'
personInfoToString' (a,b,c) = "name: " ++ a ++ ", surname: " ++ b ++ ", adres " ++ c
--wywołanie: ghci> personInfoToString ("a","b","c")
--jak jest type to nie tworzą nam się nowe typy wię c nie potzrebujemy konstruktora :D


--zad. 4
newtype Name'' = MkName' String
newtype Surname'' = MkSurname' String
newtype Address'' = MkAddress' String
newtype PersonInfo'' = MkPersonInfo'' (Name'', Surname'', Address'')

personInfoToString'' :: PersonInfo'' -> String
personInfoToString'' (MkPersonInfo'' (MkName' a,MkSurname' b,MkAddress' c)) = "name: " ++ a ++ ", surname: " ++ b ++ ", adres " ++ c
--wywoałanie ghci> personInfoToString'' (MkPersonInfo'' (MkName' "ania",MkSurname' "Monika",MkAddress' "Aga"))
--jeżeli typ posiada konstruktor to trzeba go użyć w definicji  wywołaniu funkcji








