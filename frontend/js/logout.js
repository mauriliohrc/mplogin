document.getElementById('buttonLogout').addEventListener('click', logout);

function logout(event) {
    eraseCookie(JWT_MP_AUTH)
    window.location.replace("/index.html")
}

apiValidate(getCookie(JWT_MP_AUTH))
    .then(response => {
        if (!response.ok) {
            logout()
        }

        return response.json();
    })
    .catch(error => {
        logout()
    });
