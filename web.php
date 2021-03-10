<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});



Route::group(['middleware' => ['auth','admin']], function(){
    Route::get('/dashboard', function(){
        return view('admin.dashboard');
    });
   
    Route::get('/customers', [App\Http\Controllers\HomeController::class, 'getusers']);
});




Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
// Route::get('admin/login',[App\Http\Controllers\Auth\LoginController::class, 'showLoginForm'])->name('login');
// Route::post('admin/login', [App\Http\Controllers\Auth\LoginController::class, 'login']);
Route::get('change-password', [App\Http\Controllers\ChangePasswordController::class, 'index']);
Route::post('change-password', [App\Http\Controllers\ChangePasswordController::class, 'store'])->name('change.password');


Route::get('/forget-password', [App\Http\Controllers\Auth\ForgotPasswordController::class, 'getEmail']);
Route::post('/forget-password', [App\Http\Controllers\Auth\ForgotPasswordController::class, 'postEmail']);
