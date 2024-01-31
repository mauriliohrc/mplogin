const API_HOST = "http://127.0.0.1:3001/"

function apiLogout(token) {
    return fetch(API_HOST + 'logout', {
        method: 'DELETE',
        headers: { 
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ' + token
        }
    })
}

function apiValidate(token) {
    return fetch(API_HOST + 'api/info', {
        method: 'GET',
        headers: { 
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ' + token
        }
    })
}

function apiLogin(data) {
    return fetch(API_HOST + 'login', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(data)
    })
}