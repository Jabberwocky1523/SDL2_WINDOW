CXXFLAGS += -I C:/SDL2/include -I TextureHandle #改成你电脑上的include路径
# CXXFLAGS += -fexec-charset=GBK -finput-charset=UTF-8
LDFLAGS +=  -LC:/SDL2/lib  # 改成你电脑上的lib路径

LDLIBS += -lSDL2 -lSDL2_image -lSDL2_ttf

LDLIBS += -mwindows # 用于去除运行时命令行窗口

# script.o:script.cpp TextureHandle/TextureHandle.h
# 	g++ $(CXXFLAGS) -c script.cpp -o script.o

TextureHandle.o:TextureHandle/TextureHandle.cpp TextureHandle/TextureHandle.h
	g++ $(CXXFLAGS) -c -oTextureHandle.o  TextureHandle/TextureHandle.cpp

SDL2.exe: script.o TextureHandle.o
	$(CXX) $^ -o $(basename $@) $(LDFLAGS) $(LDLIBS)

.PHONY: run clean

run: SDL2.exe
	$<

clean:
	$(RM) *.exe *.o