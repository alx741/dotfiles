import Development.Shake
import Development.Shake.Command
import Development.Shake.FilePath
import Development.Shake.Util

buildDir = "build"
scripts = ["Topa"]

main :: IO ()
main = shakeArgs shakeOptions{shakeFiles=buildDir} $ do
    want $ map ((buildDir ++ "/") ++) scripts

    phony "clean" $ do
        putNormal $ "Cleaning " ++ buildDir
        removeFilesAfter buildDir ["//*"]
        removeFilesAfter "." ["/*.hi", "/*.o"]

    buildDir ++ "/*" %> \out -> do
        let src = takeFileName $ out <.> ".hs"
        need [src, "Utility.o"]
        cmd "ghc" src "Utility.o" "-o" out

    "Utility.o" %> \out -> do
        let src = out -<.> ".hs"
        need [src]
        cmd "ghc" "-c" src
