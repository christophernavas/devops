package handler

import "net/http"

func Hello(res http.ResponseWriter, req *http.Request) {
	res.WriteHeader(404)
	res.Write([]byte(`{"hello": "world"}`))
}
