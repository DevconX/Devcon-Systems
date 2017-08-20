<?php

namespace App\Http\Controllers;

use App\Todo;

class TodoController extends Controller
{
  public function index()
  {
    $todos = Todo::all();

    return response()->json($todos, 200);
  }
}