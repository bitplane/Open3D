.PHONY: build

build: dir
	cd ./build && cmake .. -DUSE_SYSTEM_GLFW=ON -DUSE_SYSTEM_JPEG=ON -DCMAKE_CXX_FLAGS="-Wno-error -w" -DASSIMP_WARNINGS_AS_ERRORS=OFF -DBUILD_CUDA_MODULE=ON && unbuffer make -j$$(($$(nproc)/2)) 2>&1 | tee build.log

clean:
	rm -rf ./build/* || true

dir:
	mkdir -p build

