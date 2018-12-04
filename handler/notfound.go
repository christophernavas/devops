package handler

import "net/http"

func NotFound(res http.ResponseWriter, req *http.Request) {
	res.WriteHeader(200)
	res.Write([]byte(`{"not": "found"}`))
}
