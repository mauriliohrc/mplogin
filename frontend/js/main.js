document.getElementById('buttonLogin').addEventListener('click', login);


function login(event) {
    event.preventDefault();

    const data = {
        user: {
            email: document.getElementById('email').value,
            password: document.getElementById('pwd').value
        }
    }

    apiLogin(data)
        .then(response => {
            if (response.status != 200) {
                throw new Error('Erro ao fazer login');
            }

            return response.json();
        })
        .then(responseData => {
            eraseCookie(JWT_MP_AUTH)
            setCookie(JWT_MP_AUTH, responseData.data)
            window.location.replace("/logged.html")
        })
        .catch(error => {
            alert('Credenciais inválidas. Tente novamente.')
        });
  }