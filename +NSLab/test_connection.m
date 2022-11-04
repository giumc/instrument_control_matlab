function test_connection(vendor,address)

x=visa(vendor,address);

fopen(x);

query(x,'*IDN?');

end