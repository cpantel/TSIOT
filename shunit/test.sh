function testSitio1() {
   EXPECTED='    <title>Sitio de prueba</title>'
   RESULT=$( wget --no-check-certificate -O- https://sitio1 2>/dev/null | grep title )
   assertEquals "$EXPECTED" "$RESULT"
}
function testSitio2() {
   EXPECTED='    <title>Sitio de prueba</title>'
   RESULT=$( wget --no-check-certificate -O- https://sitio1 2>/dev/null | grep title )
   assertEquals "$EXPECTED" "$RESULT"
}

function testHitCountOnInit() {
   EXPECTED='<div id="count">-1</div>  '
   RESULT=$( wget --no-check-certificate -O- https://sensor/hitcount 2>/dev/null | grep div )
   assertEquals "$EXPECTED" "$RESULT"
}

function testSitio1NoHits() {
   EXPECTED='<div id="count">0</div>  '
   wget --no-check-certificate -O- https://sensor/reset 2>/dev/null >/dev/null
   wget --no-check-certificate -O- https://sitio1 2>/dev/null >/dev/null
   RESUL=$( wget --no-check-certificate -O- https://sensor/hitcount 2>/dev/null | grep div )
   assertEquals "$EXPECTED" "$RESULT"
}


function testHitCountPostReset() {
   EXPECTED='<div id="count">0</div>  '
   wget --no-check-certificate -O- https://sensor/reset 2>/dev/null >/dev/null
   RESULT=$( wget --no-check-certificate -O- https://sensor/hitcount 2>/dev/null | grep div )
   assertEquals "$EXPECTED" "$RESULT"
}

#function testRFID() {
#  EXPECTED='01cd2d699991ea786acf871aa39646dd'
#  RESULT=$( ./mfoc /dev/usb0 --field 3 --pass "32423423" | sed -e "s/timestamp:.*/timestamp:/" | md5sum)

#   assertEquals "$EXPECTED" "$RESULT"

#}	
. shunit2





