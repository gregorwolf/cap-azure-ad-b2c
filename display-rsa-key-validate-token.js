const { rsaPublicKeyPem } = require('./node_modules/passport-azure-ad/lib/aadutils');
const jwt = require('jsonwebtoken');

const id_token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImtpZCI6Ilg1ZVhrNHh5b2pORnVtMWtsMll0djhkbE5QNC1jNTdkTzZRR1RWQndhTmsifQ.eyJpc3MiOiJodHRwczovL2ZhYnJpa2FtYjJjLmIyY2xvZ2luLmNvbS83NzU1MjdmZi05YTM3LTQzMDctOGIzZC1jYzMxMWY1OGQ5MjUvdjIuMC8iLCJleHAiOjE1ODYxMDU4NDQsIm5iZiI6MTU4NjEwMjI0NCwiYXVkIjoiOTM3MzM2MDQtY2M3Ny00YTNjLWE2MDQtODcwODRkZDU1MzQ4IiwiZ2l2ZW5fbmFtZSI6IkdyZWdvciIsImZhbWlseV9uYW1lIjoiV29sZiIsIm5hbWUiOiJHcmVnb3IgV29sZiIsImlkcCI6ImZhY2Vib29rLmNvbSIsIm9pZCI6ImFhNmI1MWFmLTBjMjYtNGE0Zi1hOTk4LTE0YmU3NWVjMmI3YSIsInN1YiI6ImFhNmI1MWFmLTBjMjYtNGE0Zi1hOTk4LTE0YmU3NWVjMmI3YSIsImVtYWlscyI6WyJncmVnb3Iud29sZkBnbWFpbC5jb20iXSwibm9uY2UiOiIyMTcxNTcwZi1jYzEyLTQxMWItOTU5NC1lMzI1Mzg2ZjBmZjMiLCJzY3AiOiJkZW1vLnJlYWQiLCJhenAiOiJlNzYwY2FiMi1iOWExLTRjMGQtODZmYi1mZjcwODRhYmQ5MDIiLCJ2ZXIiOiIxLjAiLCJpYXQiOjE1ODYxMDIyNDR9.fC2d6RNm5zRvUkEReVEod8Ge7aSV54-dic47myEEwnlSFMKismZmjDjQ6GinCEkITS5CB--4q6VUClZjoKcZSgq6EccEk_KOBwqIcebslyKSz9LUYcodmMwvOUpFqrSD361WQbz9uI8K0skviYuMi79NQLfNsxF7vKNwHDW5SLsGdCxNASjxAWWyzA207VMILSqvsiP5CLdmNZMrDtWmrU9-fPOeRqL3DAhpTmUd70YzG3aJ5e-n43U6gcEvS6tNLuNfbvzcWAoLadh5XdYKkNzGDz8EXg4M2ZlJZZ49GNscuecpJ4Ga6JeM0TSlcWHrlaXV2cVT5MN-iLfcR5tb1Q"

// https://fabrikamb2c.b2clogin.com/fabrikamb2c.onmicrosoft.com/b2c_1_susi/discovery/v2.0/keys
const key = {
  "kid": "X5eXk4xyojNFum1kl2Ytv8dlNP4-c57dO6QGTVBwaNk",
  "nbf": 1493763266,
  "use": "sig",
  "kty": "RSA",
  "e": "AQAB",
  "n": "tVKUtcx_n9rt5afY_2WFNvU6PlFMggCatsZ3l4RjKxH0jgdLq6CScb0P3ZGXYbPzXvmmLiWZizpb-h0qup5jznOvOr-Dhw9908584BSgC83YacjWNqEK3urxhyE2jWjwRm2N95WGgb5mzE5XmZIvkvyXnn7X8dvgFPF5QwIngGsDG8LyHuJWlaDhr_EPLMW4wHvH0zZCuRMARIJmmqiMy3VD4ftq4nS5s8vJL0pVSrkuNojtokp84AtkADCDU_BUhrc2sIgfnvZ03koCQRoZmWiHu86SuJZYkDFstVTVSR0hiXudFlfQ2rOhPlpObmku68lXw-7V-P7jwrQRFfQVXw"
}
//key is an object from public endpoint. Just follow the tutorial
const pubKey = rsaPublicKeyPem(key.n, key.e);
console.log("Public Key:")
console.log(pubKey)

jwt.verify(id_token, pubKey, { algorithms: ['RS256'] }, function(err, decoded) {
  //do what you want next
  if(err) {
    console.log(err)
  } else {
    console.log(decoded)
  }
});

