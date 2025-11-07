.PHONY: build

build:
	cd ./build && cmake .. -DUSE_SYSTEM_GLFW=ON -DUSE_SYSTEM_JPEG=ON -DCMAKE_CXX_FLAGS="-Wno-error -w" -DASSIMP_WARNINGS_AS_ERRORS=OFF && unbuffer make -j8 2>&1 | tee build.log

clean:
	rm -rf ./build/* || true
	mkdir -p build

