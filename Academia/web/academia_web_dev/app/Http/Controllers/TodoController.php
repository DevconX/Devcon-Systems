<?php

namespace App\Http\Controllers;

use App\Todo;
use Illuminate\Http\Request;

class TodoController extends Controller
{
  /**
   * GET Request
  **/
  public function index()
  {
    $todos = Todo::all();

    return response()->json($todos, 200);
  }

  /**
   * POST Request
  **/
  public function store(Request $request)
  {
    $model = new Todo;
    $model->setAttribute('task', $request->get('task'));
    $model->save();

    return response()->json("", 204);
  }
}