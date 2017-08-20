<?php

use Illuminate\Http\Request;


Route::get('todos', 'TodoController@index');

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
