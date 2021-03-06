LIBDPARSE=Dscanner/libdparse/src/dparse/ast.d Dscanner/libdparse/src/dparse/formatter.d Dscanner/libdparse/src/dparse/parser.d Dscanner/libdparse/src/dparse/entities.d  Dscanner/libdparse/src/dparse/lexer.d Dscanner/libdparse/src/std/experimental/lexer.d

all:
	#dmd diff.d terminal.d $(LIBDPARSE)
	dmd -m64 doc2.d latex.d jstex.d comment.d stemmer.d dom.d script.d jsvar.d color.d -J. $(LIBDPARSE) -g # -version=std_parser_verbose 
	# it may pull in script.d and jsvar.d later fyi
	#
	#dmd -of/var/www/dpldocs.info/locate locate.d  dom.d stemmer.d  cgi -J. -version=fastcgi -m64 -debug
locate:
	dmd -oflocate locate.d  dom.d stemmer.d  cgi -J. -version=scgi -m64 -debug postgres.d database.d -L-L/usr/local/pgsql/lib -g

vps_locate:
	ldc2 -oq -O3 -m64 locate.d  dom.d stemmer.d  cgi -J. -d-version=scgi -d-version=vps -g

ldc:
	ldc2 -oq -O3 -m64 doc2.d latex.d jstex.d comment.d stemmer.d dom.d color.d -J. $(LIBDPARSE) -g # -version=std_parser_verbose 

http:
	dmd -debug -ofserver -version=embedded_httpd -version=with_http_server -m64 doc2.d latex.d jstex.d cgi.d comment.d stemmer.d dom.d script.d jsvar.d color.d -J. $(LIBDPARSE) -g # -version=std_parser_verbose 
