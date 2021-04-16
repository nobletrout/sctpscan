all : sctpscan

sctpscan: sctpscan.c
	cc -g sctpscan.c `pkg-config --cflags --libs glib-2.0`  -o sctpscan

E: sctpscan.c
	cc -E -Wall -g sctpscan.c -o sctpscan.i -L/sw/lib/ -I /sw/include/glib-2.0/ -I /sw/lib/glib-2.0/include/ -lglib-2.0 -lsctplib -DHAVE_SCTP_H

pcap_sctp: pcap_sctp.c
	cc -Wall -g pcap_sctp.c -o pcap_sctp -lpcap

#fake-m3ua: fake-m3ua.c
#	cc -Wall -g fake-m3ua.c -o fake-m3ua -lpcap

clean:
	rm -f pcap_sctp sctpscan fake-m3ua

tgz:
	tar zcvf sctpscan.tar.gz sctpscan.c LICENSE README COPYING Makefile
