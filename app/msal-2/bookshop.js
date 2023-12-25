/**
 * Helper function to call MS Graph API endpoint
 * using the authorization bearer token scheme
 */
function callBookshop(method, endpoint, body, token, callback) {
  const headers = new Headers();
  const bearer = `Bearer ${token}`;

  headers.append("Authorization", bearer);
  headers.append("Content-Type", "application/json");

  const options = {
    method,
    headers,
    body,
  };

  console.log("request made to Graph API at: " + new Date().toString());

  fetch(endpoint, options)
    .then((response) => response.json())
    .then((response) => callback(response, endpoint))
    .catch((error) => console.log(error));
}
