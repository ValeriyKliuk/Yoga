#/bin/bash

mkdir temp
cd temp
echo "Retrieving Yoga source 🏃🏻‍♂️..."
git clone https://github.com/facebook/yoga.git
echo
echo Done ✅.

echo "Compiling Yoga... 🏃🏽‍♀️"

OS_IDENTIFIER=$OSTYPE
AR=ar

if [[ "$OSTYPE" == "linux-gnu" ]]; then
clang -c yoga/yoga/*.cpp -std=c++1y -fPIC
elif [[ "$XCOMPILE" == "iOS" ]]; then
echo "Cross-compiling for iOS..."
OS_IDENTIFIER="iOS"
clang -isysroot $(xcrun --sdk iphoneos --show-sdk-path) -arch armv7 -arch armv7s -arch arm64 -c yoga/yoga/*.cpp -std=c++1y
AR=$(xcrun -sdk iphoneos -find ar)
else
clang -c yoga/yoga/*.cpp -std=c++1y
fi

echo Done ✅.

echo "Creating Yoga Library 📚..."
$AR -rcs libyoga.a *.o

rm -rf ../Sources/Yoga/$OS_IDENTIFIER
mkdir ../Sources/Yoga/$OS_IDENTIFIER

cp libyoga.a ../Sources/Yoga/$OS_IDENTIFIER
cd ../

rm -rf temp

echo Done ✅.
