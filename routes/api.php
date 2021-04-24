<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/login','ApiController@login');
Route::post('/reset-password','ApiController@resetPassword');
Route::post('/update-agent-info','ApiController@userProfileUpdate');
Route::post('/upload-user-image','ApiController@imageUpload');
Route::get('/get-products','ApiController@getAllProducts');
Route::post('/insert-customer-data','ApiController@insertDataOfCustomer');
Route::post('/get-all-loans','ApiController@getAllLoansDetails');
Route::get('/logout','ApiController@logoutUser');
Route::post('/get-customer','ApiController@getCustomerData');
Route::post('/update-customer-status','ApiController@updateStatusFromFieldBoy');
Route::post('/all-leads-of-agent','ApiController@getAllLeadsOfAgent');
Route::post('/update-token','ApiController@updateFireBaseToken');
Route::post('/upload-documents','ApiController@documentsimageUpload');
# financial buddy login system in this api 
Route::post('/login-wtih-fbuddy','ApiController@financialBuddyLogin');


