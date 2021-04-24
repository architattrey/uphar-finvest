<?php

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

Route::get('/storagess', function () {
    Artisan::call('storage:link');
    return "yooo";
});

Route::get('/', function () {
    // return url('/login');
    return redirect()->route('login');
});

Auth::routes();
// Route::get('agent-registration', function () {
//     echo "hjhjh";
// });
Route::get('dashboard','AdminController@index')->name('dashboard');
Route::post('/user-login','AdminController@login')->name('user-login');
Route::get('/agent-registration','AdminController@agentRegistration')->name('agent-registration');
Route::post('/submit-agent-data','AdminController@agentRegistrationSubmit')->name('registeration-submit');


Route::get('get-all-agent/{type}','AdminController@getAllAgent')->name('get-all-agent');
Route::get('get-all-verification/{type}','AdminController@getAllAgent')->name('get-all-verification');


// Route::get('/get-all-agent/{type}',['uses'=>'AdminController@getAllAgent'])->name('get-all-agent');
// Route::get('/get-all-verification/{type}',['uses'=>'AdminController@getAllAgent'])->name('get-all-verification');
 
Route::get('update-agent/{id}', ['uses' => 'AdminController@agentRegistration']);
Route::get('delete-agent/{id}', ['uses' => 'AdminController@deleteAgent']);
Route::get('all-customers/{id}/{redirect?}', ['uses' => 'AdminController@allAgentCustomers'])->name('allCustomers');
Route::get('update-customer-request/{id}/{status}/{phone_number}/{agentId}', ['uses' => 'AdminController@UpdateCustomerRequest']);
Route::post('/asign-field-boy','AdminController@asignFieldBoy')->name('asign-field-boy');
Route::get('/all-decline-customers','AdminController@getAllDeclineCustomers')->name('all-decline-customers');
Route::get('/all-approved-customers','AdminController@getAllApprovedCustomers')->name('all-approved-customers');
Route::get('/all-pending-customers','AdminController@getAllPendingCustomers')->name('all-pending-customers');

 


