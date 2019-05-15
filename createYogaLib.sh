#/bin/bash

mkdir temp
cd temp
echo "Retrieving Yoga source 🏃🏻‍♂️..."
git clone https://github.com/facebook/yoga.git
echo
echo Done ✅.

echo "Compiling Yoga... 🏃🏽‍♀️"

if [[ "$OSTYPE" == "linux-gnu" ]]; then
clang -c yoga/yoga/*.cpp -std=c++1y -fPIC
else
clang -c yoga/yoga/*.cpp -std=c++1y
fi

echo Done ✅.

echo "Creating Yoga Library 📚..."
ar -rcs libyoga.a *.o

rm -rf ../Sources/Yoga/$OSTYPE
mkdir ../Sources/Yoga/$OSTYPE

cp libyoga.a ../Sources/Yoga/$OSTYPE
cd ../

rm -rf temp

echo Done ✅.
