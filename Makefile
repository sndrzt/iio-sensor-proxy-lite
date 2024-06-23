src=$(wildcard *.c)
obj=$(patsubst %.c, %.o, $(src))
target=iio-sensor-proxy

$(target):$(obj)
	echo "$(obj)"
	gcc  -g -O2 -fstack-protector-strong -o $@ $^ -lgio-2.0 -lgudev-1.0 -lgobject-2.0 -lglib-2.0 -lm 	

%.o:%.c
	gcc -I. -pthread -I/usr/include/gudev-1.0 -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -g -O2 -c -o $@ $<

clean:
	rm -rf $(target) $(obj)

