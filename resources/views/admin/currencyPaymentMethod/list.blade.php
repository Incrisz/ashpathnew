@extends('admin.layouts.master')
@section('title', 'Currency Payment Methods')

@section('head_style')
	<!-- sweetalert -->
	<link rel="stylesheet" type="text/css" href="{{ asset('public/backend/sweetalert/sweetalert.css')}}">
	<style>
	.sa-button-container .confirm {
		color: #fff;
		background-color: #635BFF !important;
		border-color: #635BFF;
		padding: 8px 15px;
	}
	.sa-button-container .confirm:hover {
		background-color: #7ecff4 !important;
	}
	.sa-button-container .cancel {
		color: #fff;
		background-color: #f87272 !important;
		border-color: #f87272;
		padding: 8px 15px;
	}
	.sa-button-container .cancel:hover {
		background-color: #dd1515 !important;
	}
	</style>
@endsection

@section('page_content')
	<div class="box box-default">
		<div class="box-body">
			<div class="row">
				<div class="col-md-12">
					<div class="top-bar-title padding-bottom">Currency Payment Methods</div>
				</div>
			</div>
		</div>
	</div>

	<div class="box">
		<div class="box-body">
			<div class="dropdown">
				<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Currency : <span class="currencyName">{{ $currency->name }}</span>
				<span class="caret"></span></button>
				<ul class="dropdown-menu">
					@foreach($currencyList as $currencyItem)
					<li class="listItem" data-rel="{{$currencyItem->id}}">
						<a href="#">{{$currencyItem->name}}</a>
					</li>
					@endforeach
				</ul>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-md-3">
			@include('admin.common.paymentMethod_menu')
		</div>

		<div class="col-md-9">
			<div class="box box-info">
				<div class="box-header with-border text-center">
					<h3 class="box-title">
						@if ($paymentMethod ==  Bank)
							{{ $paymentMethodName }} Details
						@elseif (config('mobilemoney.is_active') && $paymentMethod == (defined('MobileMoney') ? MobileMoney : ''))
							{{ $paymentMethodName }} Details
						@else
							{{ $paymentMethodName }} Credentials
						@endif
					</h3>
				</div>

				<form action='{{url(\Config::get('adminPrefix').'/settings/payment-methods/update-paymentMethod-Credentials')}}' class="form-horizontal" method="POST" id="currencyPaymentMethod_form">
					{!! csrf_field() !!}

					<input type="hidden" value="{{ isset($currencyPaymentMethod->id) ? $currencyPaymentMethod->id : '' }}" name="id" id="id">
					<input type="hidden" value="{{ $currency->id }}" name="currency_id" id="currency_id">
					<input type="hidden" value="{{ $paymentMethod }}" name="paymentMethod" id="paymentMethod">
					<input type="hidden" value="{{ $list_menu }}" name="tabText" id="tabText">

					<div class="box-body">
						@if ($currency->type == 'fiat') 
							@if($list_menu == 'stripe')
								<!-- Stripe - Secret Key -->
								<div class="form-group">
									<label class="col-sm-3 control-label" for="stripe[secret_key]">Secret Key</label>
									<div class="col-sm-6">

										<input class="form-control" name="stripe[secret_key]" type="text" placeholder="Stripe Secret Key"
										value="{{ isset($currencyPaymentMethod->method_data) ? json_decode($currencyPaymentMethod->method_data)->secret_key : '' }}" id="stripe_secret_key">

										@if ($errors->has('stripe[secret_key]'))
										<span class="help-block">
											<strong>{{ $errors->first('stripe[secret_key]') }}</strong>
										</span>
										@endif
									</div>
								</div>
								<div class="clearfix"></div>

								<!-- Stripe - Publishable Key -->
								<div class="form-group">
									<label class="col-sm-3 control-label" for="stripe[publishable_key]">Publishable Key</label>
									<div class="col-sm-6">

										<input class="form-control" name="stripe[publishable_key]" type="text" placeholder="Stripe Publishable Key"
										value="{{ isset($currencyPaymentMethod->method_data) ? json_decode($currencyPaymentMethod->method_data)->publishable_key : '' }}" id="stripe_publishable_key">

										@if ($errors->has('stripe[publishable_key]'))
										<span class="help-block">
											<strong>{{ $errors->first('stripe[publishable_key]') }}</strong>
										</span>
										@endif
									</div>
								</div>
								<div class="clearfix"></div>

								<!-- processing_time -->
								<div class="form-group">
									<label class="col-sm-3 control-label" for="processing_time">Processing Time (days)</label>
									<div class="col-sm-6">
										<input class="form-control" name="processing_time" type="text" placeholder="Stripe Processing Time"
										value="{{ isset($currencyPaymentMethod->processing_time) ? $currencyPaymentMethod->processing_time : '' }}" id="processing_time">

										@if ($errors->has('processing_time'))
										<span class="help-block">
											<strong>{{ $errors->first('processing_time') }}</strong>
										</span>
										@endif
									</div>
								</div>
								<div class="clearfix"></div>

								@php
								if (isset($currencyPaymentMethod->activated_for))
								{
									$decode=json_decode($currencyPaymentMethod->activated_for);
								}
								@endphp

								<!-- Stripe - Status -->
								<div class="form-group">
									<label class="col-sm-3 control-label" for="stripe_status">Status</label>
									<div class="col-sm-6">
										<select class="form-control" name="stripe_status" id="stripe_status">
											<option value=''>Select Status</option>
											<option value='Active' {{ isset($currencyPaymentMethod->activated_for) && $currencyPaymentMethod->activated_for == json_encode(['deposit' => '']) ? 'selected':"" }}>Active</option>
											<option value='Inactive' {{isset($currencyPaymentMethod->activated_for) &&  $currencyPaymentMethod->activated_for == json_encode(['' => '']) ? 'selected':"" }}>Inactive</option>
										</select>
									</div>
								</div>
								<div class="clearfix"></div>

								<div class="box-footer">
									<a id="cancel_anchor" href="{{  url(\Config::get('adminPrefix')."/settings/currency") }}" class="btn btn-theme-danger">Cancel</a>
									<button type="submit" class="btn btn-theme pull-right" id="paymentMethodList_update">
										<i class="fa fa-spinner fa-spin" style="display: none;"></i> <span id="paymentMethodList_update_text">Update</span>
									</button>
								</div>

							@elseif ($list_menu == 'paypal')
								<!-- paypal - Client ID -->
								<div class="form-group">
									<label class="col-sm-3 control-label" for="paypal[client_id]">Client ID</label>
									<div class="col-sm-6">
										<input class="form-control" name="paypal[client_id]" type="text" placeholder="PayPal Client ID"
										value="{{ isset($currencyPaymentMethod->method_data) ? json_decode($currencyPaymentMethod->method_data)->client_id : '' }}" id="paypal_client_id">

										@if ($errors->has('paypal[client_id]'))
										<span class="help-block">
											<strong>{{ $errors->first('paypal[client_id]') }}</strong>
										</span>
										@endif
									</div>
								</div>
								<div class="clearfix"></div>

								<!-- paypal - Client Secret -->
								<div class="form-group">
									<label class="col-sm-3 control-label" for="paypal[client_secret]">Client Secret</label>
									<div class="col-sm-6">
										<input class="form-control" name="paypal[client_secret]" type="text" placeholder="PayPal Client Secret"
										value="{{ isset($currencyPaymentMethod->method_data) ? json_decode($currencyPaymentMethod->method_data)->client_secret : '' }}" id="paypal_client_secret">
										@if ($errors->has('paypal[client_secret]'))
										<span class="help-block">
											<strong>{{ $errors->first('paypal[client_secret]') }}</strong>
										</span>
										@endif
									</div>
								</div>

								<!-- paypal - processing_time -->
								<div class="form-group">
									<label class="col-sm-3 control-label" for="processing_time">Processing Time (days)</label>
									<div class="col-sm-6">
										<input class="form-control" name="processing_time" type="text" placeholder="PayPal Processing Time"
										value="{{ isset($currencyPaymentMethod->processing_time) ? $currencyPaymentMethod->processing_time : '' }}" id="processing_time">

										@if ($errors->has('processing_time'))
										<span class="help-block">
											<strong>{{ $errors->first('processing_time') }}</strong>
										</span>
										@endif
									</div>
								</div>
								<div class="clearfix"></div>

								<!-- paypal - Mode -->
								<div class="form-group">
									<label class="col-sm-3 control-label" for="paypal[mode]">Mode</label>
									<div class="col-sm-6">
										<select class="form-control" name="paypal[mode]" id="paypal_mode">
											<option value="">Select Mode</option>
											<option value='sandbox' {{ isset($currencyPaymentMethod->method_data) && (json_decode($currencyPaymentMethod->method_data)->mode) == 'sandbox' ? 'selected':"" }} >sandbox</option>
											<option value='live' {{ isset($currencyPaymentMethod->method_data) && (json_decode($currencyPaymentMethod->method_data)->mode) == 'live' ? 'selected':"" }} >live</option>
										</select>
									</div>
								</div>
								<div class="clearfix"></div>

								<!-- paypal - Status -->
								<div class="form-group">
									<label class="col-sm-3 control-label" for="paypal_status">Status</label>
									<div class="col-sm-6">
										<select class="form-control" name="paypal_status" id="paypal_status">
											<option value=''>Select Status</option>

											<option value='Active' {{ isset($currencyPaymentMethod->activated_for) && $currencyPaymentMethod->activated_for == json_encode(['deposit' => '']) ? 'selected':"" }}>Active</option>
											<option value='Inactive' {{ isset($currencyPaymentMethod->activated_for) && $currencyPaymentMethod->activated_for == json_encode(['' => '']) ? 'selected':"" }}>Inactive</option>

										</select>
									</div>
								</div>
								<div class="clearfix"></div>

								<div class="box-footer">
									<a id="cancel_anchor" href="{{  url(\Config::get('adminPrefix')."/settings/currency") }}" class="btn btn-theme-danger ">Cancel</a>
									<button type="submit" class="btn btn-theme pull-right" id="paymentMethodList_update">
										<i class="fa fa-spinner fa-spin" style="display: none;"></i> <span id="paymentMethodList_update_text">Update</span>
									</button>
								</div>
								
								
							

                            @elseif ($list_menu == 'paystack')
								<!-- paystack - public key -->
								<div class="form-group">
									<label class="col-sm-3 control-label" for="paystack[client_id]">Public Key</label>
									<div class="col-sm-6">
										<input class="form-control" name="paystack[client_id]" type="text" placeholder="paystack Public key"
										value="{{ isset($currencyPaymentMethod->method_data) ? json_decode($currencyPaymentMethod->method_data)->client_id : '' }}" id="paystack_client_id">

										@if ($errors->has('paystack[client_id]'))
										<span class="help-block">
											<strong>{{ $errors->first('paystack[client_id]') }}</strong>
										</span>
										@endif
									</div>
								</div>
								<div class="clearfix"></div>

								<!-- paystack - Client Secret -->
								<div class="form-group">
									<label class="col-sm-3 control-label" for="paystack[client_secret]">Secret key</label>
									<div class="col-sm-6">
										<input class="form-control" name="paystack[client_secret]" type="text" placeholder="paystack  Secret key"
										value="{{ isset($currencyPaymentMethod->method_data) ? json_decode($currencyPaymentMethod->method_data)->client_secret : '' }}" id="paystack_client_secret">
										@if ($errors->has('paystack[client_secret]'))
										<span class="help-block">
											<strong>{{ $errors->first('paystack[client_secret]') }}</strong>
										</span>
										@endif
									</div>
								</div>

								<!-- paystack - processing_time -->
								<div class="form-group">
									<label class="col-sm-3 control-label" for="processing_time">Processing Time (days)</label>
									<div class="col-sm-6">
										<input class="form-control" name="processing_time" type="text" placeholder="paystack Processing Time"
										value="{{ isset($currencyPaymentMethod->processing_time) ? $currencyPaymentMethod->processing_time : '' }}" id="processing_time">

										@if ($errors->has('processing_time'))
										<span class="help-block">
											<strong>{{ $errors->first('processing_time') }}</strong>
										</span>
										@endif
									</div>
								</div>
								<div class="clearfix"></div>

								<!-- paystack - Mode -->
								<div class="form-group">
									<label class="col-sm-3 control-label" for="paystack[mode]">Mode</label>
									<div class="col-sm-6">
										<select class="form-control" name="paystack[mode]" id="paystack_mode">
											<option value="">Select Mode</option>
											<option value='sandbox' {{ isset($currencyPaymentMethod->method_data) && (json_decode($currencyPaymentMethod->method_data)->mode) == 'sandbox' ? 'selected':"" }} >sandbox</option>
											<option value='live' {{ isset($currencyPaymentMethod->method_data) && (json_decode($currencyPaymentMethod->method_data)->mode) == 'live' ? 'selected':"" }} >live</option>
										</select>
									</div>
								</div>
								<div class="clearfix"></div>

								<!-- paystack - Status -->
								<div class="form-group">
									<label class="col-sm-3 control-label" for="paystack_status">Status</label>
									<div class="col-sm-6">
										<select class="form-control" name="paystack_status" id="paypal_status">
											<option value=''>Select Status</option>

											<option value='Active' {{ isset($currencyPaymentMethod->activated_for) && $currencyPaymentMethod->activated_for == json_encode(['deposit' => '']) ? 'selected':"" }}>Active</option>
											<option value='Inactive' {{ isset($currencyPaymentMethod->activated_for) && $currencyPaymentMethod->activated_for == json_encode(['' => '']) ? 'selected':"" }}>Inactive</option>

										</select>
									</div>
								</div>
								<div class="clearfix"></div>

								<div class="box-footer">
									<a id="cancel_anchor" href="{{  url(\Config::get('adminPrefix')."/settings/currency") }}" class="btn btn-theme-danger ">Cancel</a>
									<button type="submit" class="btn btn-theme pull-right" id="paymentMethodList_update">
										<i class="fa fa-spinner fa-spin" style="display: none;"></i> <span id="paymentMethodList_update_text">Update</span>
									</button>
								</div>

							@elseif ($list_menu == 'payUMoney')
								<!-- PayUMoney - Secret Key -->
								<div class="form-group">
									<label class="col-sm-3 control-label" for="payUMoney[key]">Secret Key</label>
									<div class="col-sm-6">
										<input class="form-control payUMoney[key]" name="payUMoney[key]" type="text" placeholder="PayUMoney Secret Key"
										value="{{ isset($currencyPaymentMethod->method_data) ? json_decode($currencyPaymentMethod->method_data)->key : '' }}" id="payUMoney_key">
										@if ($errors->has('payUMoney[key]'))
										<span class="help-block">
											<strong>{{ $errors->first('payUMoney[key]') }}</strong>
										</span>
										@endif
									</div>
								</div>
								<div class="clearfix"></div>

								<!-- PayUMoney - Salted Key -->
								<div class="form-group">
									<label class="col-sm-3 control-label" for="payUMoney[salt]">Salted Key</label>
									<div class="col-sm-6">
										<input class="form-control payUMoney[salt]" name="payUMoney[salt]" type="text" placeholder="PayUMoney Salted Key"
										value="{{ isset($currencyPaymentMethod->method_data) ? json_decode($currencyPaymentMethod->method_data)->salt : '' }}" id="payUMoney_salt">
										@if ($errors->has('payUMoney[salt]'))
										<span class="help-block">
											<strong>{{ $errors->first('payUMoney[salt]') }}</strong>
										</span>
										@endif
									</div>
								</div>
								<div class="clearfix"></div>

								<!-- PayUMoney - processing_time -->
								<div class="form-group">
									<label class="col-sm-3 control-label" for="processing_time">Processing Time (days)</label>
									<div class="col-sm-6">
										<input class="form-control processing_time" name="processing_time" type="text" placeholder="PayUMoney Processing Time"
										value="{{ isset($currencyPaymentMethod->processing_time) ? $currencyPaymentMethod->processing_time : '' }}" id="processing_time">

										@if ($errors->has('processing_time'))
										<span class="help-block">
											<strong>{{ $errors->first('processing_time') }}</strong>
										</span>
										@endif
									</div>
								</div>
								<div class="clearfix"></div>
								
								
								
							<!-- paystack - processing_time -->
							<div class="form-group">
								<label class="col-sm-3 control-label" for="processing_time">Processing Time (days)</label>
								<div class="col-sm-5">
									<input class="form-control" name="processing_time" type="text" placeholder="Paystack Processing Time"
									value="{{ isset($currencyPaymentMethod->processing_time) ? $currencyPaymentMethod->processing_time : '' }}" id="processing_time">

									@if ($errors->has('processing_time'))
									<span class="help-block">
										<strong>{{ $errors->first('processing_time') }}</strong>
									</span>
									@endif
								</div>
							</div>
							<div class="clearfix"></div>

							<!-- paystack - Mode -->
							<div class="form-group">
								<label class="col-sm-3 control-label" for="paystack[mode]">Mode</label>
								<div class="col-sm-5">
									<select class="form-control" name="paystack[mode]" id="paystack_mode">
										<option value="">Select Mode</option>
										<option value='sandbox' {{ isset($currencyPaymentMethod->method_data) && (json_decode($currencyPaymentMethod->method_data)->mode) == 'sandbox' ? 'selected':"" }} >sandbox</option>
										<option value='live' {{ isset($currencyPaymentMethod->method_data) && (json_decode($currencyPaymentMethod->method_data)->mode) == 'live' ? 'selected':"" }} >live</option>
									</select>
								</div>
							</div>
							<div class="clearfix"></div>

							<!-- paystack - Status -->
							<div class="form-group">
								<label class="col-sm-3 control-label" for="paystack_status">Status</label>
								<div class="col-sm-5">
									<select class="form-control" name="paystack_status" id="paystack_status">
										<option value=''>Select Status</option>

										<option value='Active' {{ isset($currencyPaymentMethod->activated_for) && $currencyPaymentMethod->activated_for == json_encode(['deposit' => '']) ? 'selected':"" }}>Active</option>
										<option value='Inactive' {{ isset($currencyPaymentMethod->activated_for) && $currencyPaymentMethod->activated_for == json_encode(['' => '']) ? 'selected':"" }}>Inactive</option>

									</select>
								</div>
							</div>
							<div class="clearfix"></div>

							<div class="box-footer">
								<a id="cancel_anchor" href="{{  url(\Config::get('adminPrefix')."/settings/currency") }}" class="btn btn-theme-danger ">Cancel</a>
								<button type="submit" class="btn btn-theme pull-right" id="paymentMethodList_update">
									<i class="fa fa-spinner fa-spin" style="display: none;"></i> <span id="paymentMethodList_update_text">Update</span>
								</button>
							</div>

								<!-- PayUMoney - Mode -->
								<div class="form-group">
									<label class="col-sm-3 control-label" for="payUMoney[mode]">Mode</label>
									<div class="col-sm-6">
										<select class="form-control" name="payUMoney[mode]" id="payUMoney_mode">
											<option value="">Select Mode</option>
											<option value='sandbox' {{ isset($currencyPaymentMethod->method_data) && (json_decode($currencyPaymentMethod->method_data)->mode) == 'sandbox' ? 'selected':"" }} >sandbox</option>
											<option value='live' {{ isset($currencyPaymentMethod->method_data) && (json_decode($currencyPaymentMethod->method_data)->mode) == 'live' ? 'selected':"" }} >live</option>
										</select>
									</div>
								</div>
								<div class="clearfix"></div>

								<!-- payUMoney - Status -->
								<div class="form-group">
									<label class="col-sm-3 control-label" for="payUMoney_status">Status</label>
									<div class="col-sm-6">
										<select class="form-control" name="payUMoney_status" id="payUMoney_status">
											<option value=''>Select Status</option>
											<option value='Active' {{ isset($currencyPaymentMethod->activated_for) && $currencyPaymentMethod->activated_for == json_encode(['deposit' => '']) ? 'selected':"" }}>Active</option>
											<option value='Inactive' {{ isset($currencyPaymentMethod->activated_for) && $currencyPaymentMethod->activated_for == json_encode(['' => '']) ? 'selected':"" }}>Inactive</option>
										</select>
									</div>
								</div>
								<div class="clearfix"></div>

								<div class="box-footer">
									<a id="cancel_anchor" href="{{  url(\Config::get('adminPrefix')."/settings/currency") }}" class="btn btn-theme-danger">Cancel</a>
									<button type="submit" class="btn btn-theme pull-right" id="paymentMethodList_update">
										<i class="fa fa-spinner fa-spin" style="display: none;"></i> <span id="paymentMethodList_update_text">Update</span>
									</button>
								</div>

							@elseif ($list_menu == 'coinPayments')
								<!-- coinPayments - Merchant Id -->
								<div class="form-group">
									<label class="col-sm-3 control-label" for="coinPayments[merchant_id]">Merchant Id</label>
									<div class="col-sm-6">
										<input class="form-control coinPayments[merchant_id]" name="coinPayments[merchant_id]" type="text" placeholder="CoinPayments Merchant Id"
										value="{{ isset($currencyPaymentMethod->method_data) ? json_decode($currencyPaymentMethod->method_data)->merchant_id : '' }}" id="coinPayments_merchant_id">
										@if ($errors->has('coinPayments[merchant_id]'))
										<span class="help-block">
											<strong>{{ $errors->first('coinPayments[merchant_id]') }}</strong>
										</span>
										@endif
									</div>
								</div>
								<div class="clearfix"></div>

								<!-- coinPayments - Public Key -->
								<div class="form-group">
									<label class="col-sm-3 control-label" for="coinPayments[public_key]">Public Key</label>
									<div class="col-sm-6">
										<input class="form-control coinPayments[public_key]" name="coinPayments[public_key]" type="text" placeholder="CoinPayments Public Key"
										value="{{ isset($currencyPaymentMethod->method_data) ? json_decode($currencyPaymentMethod->method_data)->public_key : '' }}" id="coinPayments_public_key">
										@if ($errors->has('coinPayments[public_key]'))
										<span class="help-block">
											<strong>{{ $errors->first('coinPayments[public_key]') }}</strong>
										</span>
										@endif
									</div>
								</div>
								<div class="clearfix"></div>

								<!-- coinPayments - Private Key -->
								<div class="form-group">
									<label class="col-sm-3 control-label" for="coinPayments[private_key]">Private Key</label>
									<div class="col-sm-6">
										<input class="form-control coinPayments[private_key]" name="coinPayments[private_key]" type="text" placeholder="CoinPayments Private Key"
										value="{{ isset($currencyPaymentMethod->method_data) ? json_decode($currencyPaymentMethod->method_data)->private_key : '' }}" id="coinPayments_private_key">
										@if ($errors->has('coinPayments[private_key]'))
										<span class="help-block">
											<strong>{{ $errors->first('coinPayments[private_key]') }}</strong>
										</span>
										@endif
									</div>
								</div>
								<div class="clearfix"></div>

								<div class="form-group">
									<label class="col-sm-3 control-label" for="webhook_url">IPN URL</label>
									<div class="col-sm-6">
										<div class="d-flex justify-content-between">
											<input name="webhook_url" class="form-control coinpayments_ipn_url" type="text" readonly value="{{ url('coinpayment/check') }}">
											<button class="btn btn-md btn-primary" id="coinpayments_copy_button" style="margin-left: 2%;">
												Copy
											</button>
										</div>
										<small style="color: #6c757d"><strong>Copy the above url and set it in <a href="{{ asset('public/images/payment_gateway/coinpayments_ipn.jpg') }}">Coinpayments IPN URL</a> field</strong></small>
									</div>
								</div>
								<div class="clearfix"></div>

								<!-- coinPayments - processing_time -->
								<div class="form-group">
									<label class="col-sm-3 control-label" for="processing_time">Processing Time (days)</label>
									<div class="col-sm-6">
										<input class="form-control processing_time" name="processing_time" type="text" placeholder="CoinPayments Processing Time"
										value="{{ isset($currencyPaymentMethod->processing_time) ? $currencyPaymentMethod->processing_time : '' }}" id="processing_time">

										@if ($errors->has('processing_time'))
										<span class="help-block">
											<strong>{{ $errors->first('processing_time') }}</strong>
										</span>
										@endif
									</div>
								</div>
								<div class="clearfix"></div>

								<!-- coinPayments - Status -->
								<div class="form-group">
									<label class="col-sm-3 control-label" for="coinPayments_status">Status</label>
									<div class="col-sm-6">
										<select class="form-control" name="coinPayments_status" id="coinPayments_status">
											<option value=''>Select Status</option>
											<option value='Active' {{ isset($currencyPaymentMethod->activated_for) && $currencyPaymentMethod->activated_for == json_encode(['deposit' => '']) ? 'selected':"" }}>Active</option>
											<option value='Inactive' {{ isset($currencyPaymentMethod->activated_for) && $currencyPaymentMethod->activated_for == json_encode(['' => '']) ? 'selected':"" }}>Inactive</option>
										</select>
									</div>
								</div>
								<div class="clearfix"></div>

								<div class="box-footer">
									<a id="cancel_anchor" href="{{  url(\Config::get('adminPrefix')."/settings/currency") }}" class="btn btn-theme-danger">Cancel</a>
									<button type="submit" class="btn btn-theme pull-right" id="paymentMethodList_update">
										<i class="fa fa-spinner fa-spin" style="display: none;"></i> <span id="paymentMethodList_update_text">Update</span>
									</button>
								</div>

							@elseif ($list_menu == 'Payeer')

								<!-- Payeer - Merchant Id -->
								<div class="form-group">
									<label class="col-sm-3 control-label" for="payeer[merchant_id]">Merchant Id</label>
									<div class="col-sm-6">
										<input class="form-control payeer[merchant_id]" name="payeer[merchant_id]" type="text" placeholder="Payeer Merchant Id"
										value="{{ isset($currencyPaymentMethod->method_data) ? json_decode($currencyPaymentMethod->method_data)->merchant_id : '' }}" id="payeer_merchant_id">
										@if ($errors->has('payeer[merchant_id]'))
										<span class="help-block">
											<strong>{{ $errors->first('payeer[merchant_id]') }}</strong>
										</span>
										@endif
									</div>
								</div>
								<div class="clearfix"></div>

								<!-- Payeer - Secret Key -->
								<div class="form-group">
									<label class="col-sm-3 control-label" for="payeer[secret_key]">Secret Key</label>
									<div class="col-sm-6">
										<input class="form-control payeer[secret_key]" name="payeer[secret_key]" type="text" placeholder="Payeer Merchant Secret Key"
										value="{{ isset($currencyPaymentMethod->method_data) ? json_decode($currencyPaymentMethod->method_data)->secret_key : '' }}" id="payeer_secret_key">
										@if ($errors->has('payeer[secret_key]'))
										<span class="help-block">
											<strong>{{ $errors->first('payeer[secret_key]') }}</strong>
										</span>
										@endif
									</div>
								</div>
								<div class="clearfix"></div>

								<!-- Payeer - Encryption Key -->
								<div class="form-group">
									<label class="col-sm-3 control-label" for="payeer[encryption_key]">Encryption Key</label>
									<div class="col-sm-6">
										<input class="form-control payeer[encryption_key]" name="payeer[encryption_key]" type="text" placeholder="Payeer Merchant Encryption Key"
										value="{{ isset($currencyPaymentMethod->method_data) ? json_decode($currencyPaymentMethod->method_data)->encryption_key : '' }}" id="payeer_encryption_key">
										@if ($errors->has('payeer[encryption_key]'))
										<span class="help-block">
											<strong>{{ $errors->first('payeer[encryption_key]') }}</strong>
										</span>
										@endif
									</div>
								</div>
								<div class="clearfix"></div>

								<!-- Payeer - Domain -->
								<div class="form-group">
									<label class="col-sm-3 control-label" for="payeer[merchant_domain]">Merchant Domain</label>
									<div class="col-sm-6">
										<input class="form-control payeer[merchant_domain]" name="payeer[merchant_domain]" type="text" placeholder="Payeer Merchant Domain" value="" id="payeer_merchant_domain">
										@if ($errors->has('payeer[merchant_domain]'))
										<span class="help-block">
											<strong>{{ $errors->first('payeer[merchant_domain]') }}</strong>
										</span>
										@endif
									</div>
								</div>
								<div class="clearfix"></div>

								<!-- Payeer - processing_time -->
								<div class="form-group">
									<label class="col-sm-3 control-label" for="processing_time">Processing Time (days)</label>
									<div class="col-sm-6">
										<input class="form-control processing_time" name="processing_time" type="text" placeholder="Payeer Processing Time"
										value="{{ isset($currencyPaymentMethod->processing_time) ? $currencyPaymentMethod->processing_time : '' }}" id="processing_time">

										@if ($errors->has('processing_time'))
										<span class="help-block">
											<strong>{{ $errors->first('processing_time') }}</strong>
										</span>
										@endif
									</div>
								</div>
								<div class="clearfix"></div>

								<!-- Payeer - Status -->
								<div class="form-group">
									<label class="col-sm-3 control-label" for="payeer_status">Status</label>
									<div class="col-sm-6">
										<select class="form-control" name="payeer_status" id="payeer_status">
											<option value=''>Select Status</option>
											<option value='Active' {{ isset($currencyPaymentMethod->activated_for) && $currencyPaymentMethod->activated_for == json_encode(['deposit' => '']) ? 'selected':"" }}>Active</option>
											<option value='Inactive' {{ isset($currencyPaymentMethod->activated_for) && $currencyPaymentMethod->activated_for == json_encode(['' => '']) ? 'selected':"" }}>Inactive</option>
										</select>
									</div>
								</div>
								<div class="clearfix"></div>

								<div class="box-footer">
									<a id="cancel_anchor" href="{{  url(\Config::get('adminPrefix')."/settings/currency") }}" class="btn btn-theme-danger">Cancel</a>
									<button type="submit" class="btn btn-theme pull-right" id="paymentMethodList_update">
										<i class="fa fa-spinner fa-spin" style="display: none;"></i> <span id="paymentMethodList_update_text">Update</span>
									</button>
								</div>
							@endif
						@elseif($currency->type == 'crypto')
							@if ($list_menu == 'coinPayments')
								<!-- coinPayments - Merchant Id -->
								<div class="form-group">
									<label class="col-sm-3 control-label" for="coinPayments[merchant_id]">Merchant Id</label>
									<div class="col-sm-6">
										<input class="form-control coinPayments[merchant_id]" name="coinPayments[merchant_id]" type="text" placeholder="CoinPayments Merchant Id"
										value="{{ isset($currencyPaymentMethod->method_data) ? json_decode($currencyPaymentMethod->method_data)->merchant_id : '' }}" id="coinPayments_merchant_id">
										@if ($errors->has('coinPayments[merchant_id]'))
										<span class="help-block">
											<strong>{{ $errors->first('coinPayments[merchant_id]') }}</strong>
										</span>
										@endif
									</div>
								</div>
								<div class="clearfix"></div>

								<!-- coinPayments - Public Key -->
								<div class="form-group">
									<label class="col-sm-3 control-label" for="coinPayments[public_key]">Public Key</label>
									<div class="col-sm-6">
										<input class="form-control coinPayments[public_key]" name="coinPayments[public_key]" type="text" placeholder="CoinPayments Public Key"
										value="{{ isset($currencyPaymentMethod->method_data) ? json_decode($currencyPaymentMethod->method_data)->public_key : '' }}" id="coinPayments_public_key">
										@if ($errors->has('coinPayments[public_key]'))
										<span class="help-block">
											<strong>{{ $errors->first('coinPayments[public_key]') }}</strong>
										</span>
										@endif
									</div>
								</div>
								<div class="clearfix"></div>

								<!-- coinPayments - Private Key -->
								<div class="form-group">
									<label class="col-sm-3 control-label" for="coinPayments[private_key]">Private Key</label>
									<div class="col-sm-6">
										<input class="form-control coinPayments[private_key]" name="coinPayments[private_key]" type="text" placeholder="CoinPayments Private Key"
										value="{{ isset($currencyPaymentMethod->method_data) ? json_decode($currencyPaymentMethod->method_data)->private_key : '' }}" id="coinPayments_private_key">
										@if ($errors->has('coinPayments[private_key]'))
										<span class="help-block">
											<strong>{{ $errors->first('coinPayments[private_key]') }}</strong>
										</span>
										@endif
									</div>
								</div>
								<div class="clearfix"></div>

								<div class="form-group">
									<label class="col-sm-3 control-label" for="webhook_url">IPN URL</label>
									<div class="col-sm-6">
										<div class="d-flex justify-content-between">
											<input name="webhook_url" class="form-control coinpayments_ipn_url" type="text" readonly value="{{ url('coinpayment/check') }}">
											<button class="btn btn-md btn-primary" id="coinpayments_copy_button" style="margin-left: 2%;">
												Copy
											</button>
										</div>
										<small style="color: #6c757d"><strong>Copy the above url and set it in <a href="{{ asset('public/images/payment_gateway/coinpayments_ipn.jpg') }}">Coinpayments IPN URL</a> field</strong></small>
									</div>
								</div>
								<div class="clearfix"></div>

								<!-- coinPayments - processing_time -->
								<div class="form-group">
									<label class="col-sm-3 control-label" for="processing_time">Processing Time (days)</label>
									<div class="col-sm-6">
										<input class="form-control processing_time" name="processing_time" type="text" placeholder="CoinPayments Processing Time"
										value="{{ isset($currencyPaymentMethod->processing_time) ? $currencyPaymentMethod->processing_time : '' }}" id="processing_time">

										@if ($errors->has('processing_time'))
										<span class="help-block">
											<strong>{{ $errors->first('processing_time') }}</strong>
										</span>
										@endif
									</div>
								</div>
								<div class="clearfix"></div>

								<!-- coinPayments - Status -->
								<div class="form-group">
									<label class="col-sm-3 control-label" for="coinPayments_status">Status</label>
									<div class="col-sm-6">
										<select class="form-control" name="coinPayments_status" id="coinPayments_status">
											<option value=''>Select Status</option>
											<option value='Active' {{ isset($currencyPaymentMethod->activated_for) && $currencyPaymentMethod->activated_for == json_encode(['deposit' => '']) ? 'selected':"" }}>Active</option>
											<option value='Inactive' {{ isset($currencyPaymentMethod->activated_for) && $currencyPaymentMethod->activated_for == json_encode(['' => '']) ? 'selected':"" }}>Inactive</option>
										</select>
									</div>
								</div>
								<div class="clearfix"></div>

								<div class="box-footer">
									<a id="cancel_anchor" href="{{  url(\Config::get('adminPrefix')."/settings/currency") }}" class="btn btn-theme-danger">Cancel</a>
									<button type="submit" class="btn btn-theme pull-right" id="paymentMethodList_update">
										<i class="fa fa-spinner fa-spin" style="display: none;"></i> <span id="paymentMethodList_update_text">Update</span>
									</button>
								</div>
							@endif
						@endif
					</div>
				</form>

				@if ($list_menu == 'bank')
				<div class="row">
					<div class="col-md-10 col-md-offset-1">
						<button data-toggle="modal" data-target="#addModal" id="addBtn" style="margin-bottom: 20px;margin-left: 10px;" class="btn btn-theme pull-left" type="button">
							<span class="fa fa-plus"> &nbsp;</span>Add Bank
						</button>

						<div class="table-responsive">
							<table class="table table-bordered">
								<table class="table text-center" id="banks_list">
									<thead>
										<tr>
											<td style="display: none;"><strong>ID</strong></td>
											<td><strong>Bank Name</strong></td>
											<td><strong>Account</strong></td>
											<td><strong>Default</strong></td>
											<td><strong>Status</strong></td>
											<td><strong>Action</strong></td>
										</tr>
									</thead>
									<tbody id="bank_body">
									</tbody>
								</table>
							</table>
						</div>
					</div>
				</div>

				<!-- addModal Modal-->
				<div class="modal fade" id="addModal" role="dialog">
					<div class="modal-dialog modal-lg">
						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header" style="display: block;">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title text-center">Add Bank Details</h4>
							</div>

							<form id="add-bank" method="post" enctype="multipart/form-data">

								{{csrf_field()}}

								<div class="modal-body">
									<div id="add-bank-error" style="display: none">
										<div class="alert alert-danger">
											<ul id="add-bank-error-messages">
											</ul>
										</div>
									</div>

									<div class="row">
										<div class="col-md-12">

											<div class="col-md-1"></div>
											<div class="col-md-5">
												<div class="form-group">
													<label>Default</label>
													<select class="form-control" name="default" id="default">
														<option value=''></option>
														<option value='Yes'>Yes</option>
														<option value='No'>No</option>
													</select>
												</div>
											</div>

											<div class="col-md-1"></div>
											<div class="col-md-4">
												<div class="form-group">
													<label>Status</label>
													<select class="form-control" name="status" id="status">
														<option value=''></option>
														<option value='Active'>Active</option>
														<option value='Inactive'>Inactive</option>
													</select>
												</div>
											</div>
										</div>
									</div>

									<br>

									<div class="row">
										<div class="col-md-12">
											<div class="col-md-1"></div>
											<div class="col-md-5">
												<div class="form-group">
													<label>Bank Account Holder's name</label>
													<input name="account_name" id="account_name" class="form-control">
												</div>
												<div class="form-group">
													<label>Bank Account Number/IBAN</label>
													<input name="account_number" id="account_number" class="form-control">
												</div>
												<div class="form-group">
													<label>SWIFT Code</label>
													<input name="swift_code" id="swift_code" class="form-control">
												</div>
												<div class="form-group">
													<label>Bank Name</label>
													<input name="bank_name" id="bank_name" class="form-control">
												</div>
											</div>

											<div class="col-md-1"></div>

											<div class="col-md-4">
												<div class="form-group">
													<label>Branch Name</label>
													<input name="branch_name" id="branch_name" class="form-control">
												</div>

												<div class="form-group">
													<label>Branch City</label>
													<input name="branch_city" id="branch_city" class="form-control">
												</div>

												<div class="form-group">
													<label>Branch Address</label>
													<input name="branch_address" id="branch_address" class="form-control">
												</div>

												<div class="form-group">
													<label>Country</label>
													<select name="country" id="country" class="form-control">
														<option value=""></option>
														@foreach($countries as $country)
														<option value="{{$country->id}}">{{$country->name}}</option>
														@endforeach
													</select>
												</div>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-12">
											<div class="col-md-1"></div>
											<div class="col-md-5">
												<div class="form-group">
													<label>Bank Logo</label>
													<input type="file" name="bank_logo" id="bank_logo" class="form-control input-file-field">
													<div class="clearfix"></div>
													<small class="form-text text-muted"><strong>{{ allowedImageDimension(120,80) }}</strong></small>
													<div class="preview_bank_logo">
														<img src="{{ url('public/uploads/userPic/default-image.png') }}" width="120" height="80" id="bank-demo-logo-preview"/>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="modal-footer">
									<div class="row">
										<div class="col-md-12">
											<div class="col-md-1"></div>
											<div class="col-md-4"><button type="button" class="btn btn-theme-danger pull-left" data-dismiss="modal">Close</button></div>
											<div class="col-md-2"></div>
											<div class="col-md-4">
												<button type="submit" class="btn btn-theme pull-right" id="submit_btn">Submit</button>
											</div>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>

				<!-- editModal Modal-->
				<div class="modal fade" id="editModal" role="dialog">
					<div class="modal-dialog modal-lg">
						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header" style="display: block;">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title text-center">Edit Bank Details</h4>
							</div>

							<form id="edit-bank" method="post">
								{{csrf_field()}}

								<input type="hidden" name="bank_id" id="bank_id">
								<input type="hidden" name="file_id" id="file_id">
								<input type="hidden" name="edit_currency_id" id="edit_currency_id">
								<input type="hidden" name="edit_paymentMethod" id="edit_paymentMethod">
								<input type="hidden" name="currencyPaymentMethodId" id="currencyPaymentMethodId">

								<div class="modal-body">
									<div id="bank-error" style="display: none">
										<div class="alert alert-danger">
											<ul id="bank-error-messages">
											</ul>
										</div>
									</div>

									<div class="row">
										<div class="col-md-12">
											<div class="col-md-1"></div>
											<div class="col-md-5">
												<div class="form-group">
													<label>Default</label>
													<select class="form-control" name="edit_default" id="edit_default">
														<option value='Yes'>Yes</option>
														<option value='No'>No</option>
													</select>
												</div>
											</div>

											<div class="col-md-1"></div>
											<div class="col-md-4">
												<div class="form-group">
													<label>Status</label>
													<select class="form-control" name="edit_status" id="edit_status">
														<option value='Active'>Active</option>
														<option value='Inactive'>Inactive</option>
													</select>
												</div>
											</div>
										</div>
									</div>
									<br>

									<div class="row">
										<div class="col-md-12">
											<div class="col-md-1"></div>
											<div class="col-md-5">
												<div class="form-group">
													<label>Bank Account Holder's name</label>
													<input name="edit_account_name" id="edit_account_name" class="form-control">
												</div>
												<div class="form-group">
													<label>Bank Account Number/IBAN</label>
													<input name="edit_account_number" id="edit_account_number" class="form-control">
												</div>
												<div class="form-group">
													<label>SWIFT Code</label>
													<input name="edit_swift_code" id="edit_swift_code" class="form-control">
												</div>
												<div class="form-group">
													<label>Bank Name</label>
													<input name="edit_bank_name" id="edit_bank_name" class="form-control">
												</div>
											</div>

											<div class="col-md-1"></div>

											<div class="col-md-4">
												<div class="form-group">
													<label>Branch Name</label>
													<input name="edit_branch_name" id="edit_branch_name" class="form-control">
												</div>

												<div class="form-group">
													<label>Branch City</label>
													<input name="edit_branch_city" id="edit_branch_city" class="form-control">
												</div>

												<div class="form-group">
													<label>Branch Address</label>
													<input name="edit_branch_address" id="edit_branch_address" class="form-control">
												</div>

												<div class="form-group">
													<label>Country</label>
													<select name="edit_country" id="edit_country" class="form-control">
														@foreach($countries as $country)
														<option value="{{ $country->id }}">{{$country->name}}</option>
														@endforeach
													</select>
												</div>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-12">
											<div class="col-md-1"></div>
											<div class="col-md-5">
												<div class="form-group">
													<label>Bank Logo</label>
													<input type="file" name="edit_bank_logo" id="edit_bank_logo" class="form-control input-file-field">
													<div class="clearfix"></div>
													<small class="form-text text-muted"><strong>{{ allowedImageDimension(120,80) }}</strong></small>
													<div class="preview_edit_bank_logo"></div>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="modal-footer">
									<div class="row">
										<div class="col-md-12">
											<div class="col-md-1"></div>
											<div class="col-md-4"><button type="button" class="btn btn-theme-danger pull-left" data-dismiss="modal">Close</button></div>
											<div class="col-md-2"></div>
											<div class="col-md-4">
												<button type="submit" class="btn btn-theme pull-right" id="edit_submit_btn">Update</button>
											</div>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				@endif
				@if (config('mobilemoney.is_active') && $list_menu == 'mobilemoney')
					@include('admin.common.mobile-money')
				@endif
			</div>
		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->
@endsection

@push('extra_body_scripts')

<script src="{{ asset('public/dist/js/jquery.validate.min.js') }}" type="text/javascript"></script>
<script src="{{ asset('public/dist/js/jquery-validation-1.17.0/dist/additional-methods.min.js') }}" type="text/javascript"></script>
<script src="{{ asset('public/backend/sweetalert/sweetalert.min.js')}}" type="text/javascript"></script>

<script type="text/javascript">

	var isActiveMobileMoney = "{!! config('mobilemoney.is_active') !!}";

    $(function () {
        $(".select2").select2({
        });
    });

    $('#currencyPaymentMethod_form').validate({
        rules: {
			"stripe[secret_key]": {
				required: true,
			},
			"stripe[publishable_key]":{
				required: true,
			},
			stripe_status:{
				required: true,
			},
			"paypal[client_id]": {
				required: true,
			},
			"paypal[client_secret]":{
				required: true,
			},
			"paypal[mode]":{
				required: true,
			},
			paypal_status:{
				required: true,
			},
			"payUMoney[key]":{
				required: true,
			},
			"payUMoney[salt]":{
				required: true,
			},
			"payUMoney[mode]":{
				required: true,
			},
			payUMoney_status:{
				required: true,
			},
			"coinPayments[merchant_id]":{
				required: true,
			},
			"coinPayments[public_key]":{
				required: true,
			},
			"coinPayments[private_key]":{
				required: true,
			},
			coinPayments_status:{
				required: true,
			},
			"payeer[merchant_id]":{
				required: true,
			},
			"payeer[secret_key]":{
				required: true,
			},
			"payeer[encryption_key]":{
				required: true,
			},
			"payeer[merchant_domain]":{
				required: true,
			},
			payeer_status:{
				required: true,
			},
			"cash[merchant_reference]": {
				required: true,
			},
			cash_status:{
				required: true,
			},
			"cash[payment_number]": {
				required: true,
			},
			mobile_status:{
				required: true,
			},
			processing_time:{
				required: true,
				number: true,
			},
        },
        messages: {
            "paypal[mode]": {
                required: "Please select a mode."
            },
            "payUMoney[mode]": {
                required: "Please select a mode."
            }
        },
        submitHandler: function(form)
        {
            $("#paymentMethodList_update").attr("disabled", true);
            $('#cancel_anchor').attr("disabled","disabled");
            $(".fa-spin").show();
            $("#paymentMethodList_update_text").text('Updating...');
            // Click False
            $('#paymentMethodList_update').click(false);
            $('#cancel_anchor').click(false);
            form.submit();
        }
    });


	$('#add-bank').validate({
        rules: {
            account_name: {
                required: true
            },
            default: {
                required: true
            },
            status: {
                required: true
            },
            account_number: {
                required: true,
            },
            swift_code: {
                required: true,
            },
            bank_name: {
                required: true
            },
            branch_name: {
                required: true
            },
            branch_city: {
                required: true
            },
            branch_address: {
                required: true
            },
            country: {
                required: true
            },
            bank_logo: {
                extension: "png|jpg|jpeg|gif|bmp|ico",
            }
        },
        messages: {
			bank_logo: {
				extension: "Please select (png, jpg, jpeg, gif, bmp or ico) file!"
			},
        },
		submitHandler: function (form) 
		{
			var form_data = new FormData();
			form_data.append('_token', '{{csrf_token()}}');
			form_data.append('currency_id', $('#currency_id').val());
			form_data.append('paymentMethod', $('#paymentMethod').val());
			form_data.append('default', $('#default').val());
			form_data.append('status', $('#status').val());
			form_data.append('account_name', $('#account_name').val());
			form_data.append('account_number', $('#account_number').val());
			form_data.append('swift_code', $('#swift_code').val());
			form_data.append('bank_name', $('#bank_name').val());
			form_data.append('branch_name', $('#branch_name').val());
			form_data.append('branch_city', $('#branch_city').val());
			form_data.append('branch_address', $('#branch_address').val());
			form_data.append('country', $('#country').val());

			var bank_logo = document.getElementById('bank_logo');
			form_data.append('bank_logo', bank_logo.files[0]);

			$.ajax({
				method: "POST",
				url: SITE_URL+"/"+ADMIN_PREFIX+"/settings/payment-methods/add-bank",
				cache: false,
				dataType:'json',
				contentType: false,
				processData: false,
				data: form_data,
			})
			.done(function(response)
			{
				if (response.status == true) {
					$('#edit_currency_id').val(response.currency_id);
					$('#edit_paymentMethod').val(response.paymentMethod);

					$('#addModal').modal('hide');
					swal({title: "Success!", text: response.message, type: "success"},
						function(){
							window.location.reload();
						}
					);
				} else {
					var errorMessage = '';
					$.each(response.message, function(key, value)
					{
						errorMessage += '<li>'+ value+'</li>';
					});
					$('#add-bank-error').css('display', 'block');
					$('#add-bank-error-messages').html(errorMessage);
				}
			});
			return false;  
		}
    });

    $('#edit-bank').validate({
        rules: {
            edit_account_name: {
                required: true
            },
            edit_account_number: {
                required: true,
            },
            edit_swift_code: {
                required: true,
            },
            edit_bank_name: {
                required: true
            },
            edit_branch_name: {
                required: true
            },
            edit_branch_city: {
                required: true
            },
            edit_branch_address: {
                required: true
            },
            edit_country: {
                required: true
            },
            edit_bank_logo: {
                extension: "png|jpg|jpeg|gif|bmp|ico",
            }
        },
        messages: {
			edit_bank_logo: {
				extension: "Please select (png, jpg, jpeg, gif, bmp or ico) file!"
			},
        },
		submitHandler: function (form) 
		{
			var form_data = new FormData();
			form_data.append('_token', '{{csrf_token()}}');
			form_data.append('bank_id', $('#bank_id').val());
			form_data.append('file_id', $("#file_id").val());
			form_data.append('currencyPaymentMethodId', $('#currencyPaymentMethodId').val());
			form_data.append('currency_id', $('#edit_currency_id').val());
			form_data.append('paymentMethod', $('#edit_paymentMethod').val());
			form_data.append('default', $('#edit_default').val());
			form_data.append('status', $('#edit_status').val());
			form_data.append('account_name', $('#edit_account_name').val());
			form_data.append('account_number', $('#edit_account_number').val());
			form_data.append('swift_code', $('#edit_swift_code').val());
			form_data.append('bank_name', $('#edit_bank_name').val());
			form_data.append('branch_name', $('#edit_branch_name').val());
			form_data.append('branch_city', $('#edit_branch_city').val());
			form_data.append('branch_address', $('#edit_branch_address').val());
			form_data.append('country', $('#edit_country').val());

			var edit_bank_logo = document.getElementById('edit_bank_logo');

			form_data.append('bank_logo', edit_bank_logo.files[0]);

			$.ajax({
				method: "POST",
				url: SITE_URL+"/"+ADMIN_PREFIX+"/settings/payment-methods/update-bank",
				cache: false,
				dataType:'json',
				contentType: false,
				processData: false,
				data: form_data,
			})
			.done(function(response)
			{
				if (response.status == true) {
					$('#editModal').modal('hide');
					swal({title: "Success!", text: response.message, type: "success"},
						function(){
							window.location.reload();
						}
					);
				} else {
					var errorMessage = '';
					$.each(response.message, function(key, value)
					{
						errorMessage += '<li>'+ value+'</li>';
					});
					$('#bank-error').css('display', 'block');
					$('#bank-error-messages').html(errorMessage);
				}
			})
			.fail(function(){
				swal('Oops...', 'Something went wrong with ajax !', 'error');
			});
			return false;
		}
    });


    $(document).ready(function() {
		$('#addModal').on('hidden.bs.modal', function (e) {
			$('#add-bank').validate().resetForm();
			$('#add-bank').find('.error').removeClass('error');
			$('#submit_btn').prop('disabled',false);
			$('#bank_logo').val('');
			$('#bank-demo-logo-preview').attr({src: '{{ url('public/uploads/userPic/default-image.png') }}'});
		});

		$('#editModal').on('hidden.bs.modal', function (e) {
			$('#edit-bank').validate().resetForm();
			$('#edit-bank').find('.error').removeClass('error');
			$('#submit_btn').prop('disabled',false);
			$('#edit_bank_logo').val('');
		});
    });

    function handleFileSelect()
    {
		var input = this;
		if (input.files && input.files.length) {
			var reader = new FileReader();
			this.enabled = false;
			reader.onload = (function (e)
			{
				if (!input.files[0].name.match(/.(png|jpg|jpeg|gif|bmp|ico)$/i)) {
					$('#bank-demo-logo-preview').attr({src: '{{ url('public/uploads/userPic/default-image.png') }}'});
					$('#submit_btn').prop('disabled',true);
				} else {
					$('#bank-demo-logo-preview').attr({src: reader.result});
					$('#submit_btn').prop('disabled',false);
				}
			});
			reader.readAsDataURL(input.files[0]);
		}
	}

	$('#bank_logo').change(handleFileSelect);

    function handleFileSelectEdit()
    {
		var input = this;
		if (input.files && input.files.length) {
			var reader = new FileReader();
			this.enabled = false;
			reader.onload = (function (e)
			{
				if (!input.files[0].name.match(/.(png|jpg|jpeg|gif|bmp|ico)$/i)) {
					$('.thumb-bank-logo').attr({src: '{{ url('public/uploads/userPic/default-image.png') }}'});
					$('.remove_edit_bank_logo_preview').remove();
					$('#edit_submit_btn').prop('disabled',true);
				} else {
					let logo = $('.thumb-bank-logo').attr('data-bank-logo');
					if (logo != '') {
						$('.thumb-bank-logo').attr({src: reader.result});
						$('.remove_edit_bank_logo_preview').remove();
					}
					$('.thumb-bank-logo').attr({src: reader.result});
					$('#edit_submit_btn').prop('disabled',false);
				}
			});
			reader.readAsDataURL(input.files[0]);
		}
	}

	$('#edit_bank_logo').change(handleFileSelectEdit);

    //edit-setting
    $(document).on('click','.edit-setting', function (e)
    {
        e.preventDefault();

        var bank_id = $(this).data('id');
        var currency_id = $('#currency_id').val();
        var paymentMethod = $('#paymentMethod').val();

        if (bank_id && currency_id) {
			getCpmId(bank_id,currency_id,paymentMethod);
        }
    });


    function getCpmId(bank_id,currency_id,paymentMethod)
    {
        $.ajax({
			headers:
			{
				'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
			},
			method: "POST",
			url: SITE_URL+"/"+ADMIN_PREFIX+"/settings/payment-methods/getCpmId",
			cache: false,
			dataType:'json',
			data: {
				'bank_id': bank_id,
				'currency_id': currency_id,
			},
        })
        .done(function(response)
        {
			var preview_edit_bank_logo = $('.preview_edit_bank_logo'), img;

			if (response.status == true) {
				$('#bank_id').val(bank_id);
				$('#edit_currency_id').val(currency_id);
				$('#edit_paymentMethod').val(paymentMethod);
				$('#currencyPaymentMethodId').val(response.cpmId);

				$('#edit_default').val(response.is_default);

				var activated_for = JSON.parse(response.cpmActivatedFor);
				if(activated_for.hasOwnProperty('deposit')) {
					$('#edit_status').val('Active');
				} else {
					$('#edit_status').val('Inactive');
				}
				$('#edit_account_name').val(response.account_name);
				$('#edit_account_number').val(response.account_number);
				$('#edit_branch_address').val(response.bank_branch_address);
				$('#edit_branch_city').val(response.bank_branch_city);
				$('#edit_branch_name').val(response.bank_branch_name);
				$('#edit_bank_name').val(response.bank_name);
				$('#edit_country').val(response.country_id);
				$('#edit_swift_code').val(response.swift_code);

				if (response.bank_logo && response.file_id) {
					//et file ID of bank logo
					$("#file_id").val(response.file_id);

					$(".preview_edit_bank_logo").html(`<img class="thumb-bank-logo" data-bank-logo="${response.bank_logo}" data-file-id="${response.file_id}" src="${SITE_URL}/public/uploads/files/bank_logos/${response.bank_logo}" width="120" height="80"/><span class="remove_edit_bank_logo_preview"></span>`);
				} else {
					$(".preview_edit_bank_logo").html(`<img class="thumb-bank-logo" src="${SITE_URL}/public/uploads/userPic/default-image.png" width="120" height="80"/>`);
				}

				$('#editModal').modal();
			} else {
				swal('Oops...', 'No response !', 'error');
			}
        });
    }

    //remove_edit_bank_logo_preview
    $('.preview_edit_bank_logo').on('click', '.remove_edit_bank_logo_preview', function ()
    {
		var file_id = $('.thumb-bank-logo').attr('data-file-id');

        if(file_id) {
			$.ajax(
			{
				headers:
				{
					'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
				},
				type : "POST",
				url : SITE_URL+"/"+ADMIN_PREFIX+"/settings/payment-methods/delete-bank-logo",
				data: {
					'file_id' : file_id,
				},
				dataType : 'json',
				success: function(response)
				{
					if (response.success == 1) {
						swal(
							'Deleted!',
							response.message,
							'success'
						)

						$(".preview_edit_bank_logo").html('');
						$(".preview_edit_bank_logo").html(`<img class="thumb-bank-logo" src="${SITE_URL}/public/uploads/userPic/default-image.png" width="120" height="80"/>`);
					} else {
						swal("Oops...", response.message);
					}
				}
			});
        } else {
			$(".preview_edit_bank_logo").empty();
			$("#edit_bank_logo").val("");
        }
	});

    //DELETE
    $(document).on('click', '.delete', function()
    {
        var bank_id = $(this).data('id');

        swal({
			title: "Are you sure you want to delete?",
			text: "You won't be able to revert this!",
			type: "warning",
			showCancelButton: true,
			confirmButtonText: "Yes, delete it!",
			cancelButtonText: "Cancel",
			closeOnConfirm: false,
			showLoaderOnConfirm: true,
			closeOnCancel: true
        },
        function(isConfirm)
        {
            if (!isConfirm) return;

            if (isConfirm) {
                $.ajax({
                    headers:
                    {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    },
                    method: "POST",
                    url: SITE_URL+"/"+ADMIN_PREFIX+"/settings/payment-methods/delete-bank",
                    dataType: "json",
                    cache: false,
                    data: {
                        'bank_id': bank_id,
                    }
                })
                .done(function(response)
                {
					if (response.status == true) {
						swal({title: "Deleted!", text: response.message, type:response.type},
							function(){
							window.location.reload();
							}
						);
					} else {
						swal("Oops...", response.message, response.type);
					}
                })
                .fail(function(){
                    swal('Oops...', 'Something went wrong with ajax !', 'error');
                });
            } else {
                swal("Cancelled", "You Cancelled", "error");
            }
        });
    });

	///////////////////////////////////////////////////////////////

    $(window).on('load',function()
    {
        var previousUrl = document.referrer;
        var urlByOwn    = SITE_URL+'/'+ADMIN_PREFIX+'/settings/currency';
        if(previousUrl==urlByOwn) {
			localStorage.removeItem('currencyId');
			localStorage.removeItem('currencyName');
        } else {
			if ((localStorage.getItem('currencyName')) && (localStorage.getItem('currencyId'))) {
				$('.currencyName').text(localStorage.getItem('currencyName'));
				$('#currency_id').val(localStorage.getItem('currencyId'));
				getPaymentMethodsDetails();
			} else {
				getPaymentMethodsSpecificCurrencyDetails();
			}
        }
    });


    $('.listItem').on('click',function()
    {
		var currencyId       = $(this).attr('data-rel');
		var currencyName     = $(this).text();

		localStorage.setItem('currencyId',currencyId);
		localStorage.setItem('currencyName',currencyName);

		$('.currencyName').text(currencyName);
		$('#currency_id').val(currencyId);
		getPaymentMethodsDetails();
    });


    //Window on load/click on list item get fees limit details
    function getPaymentMethodsDetails()
    {
        var currencyId = $('#currency_id').val();
        var paymentMethod = $('#paymentMethod').val();
        var token = $("input[name=_token]").val();
        var url = SITE_URL+'/'+ADMIN_PREFIX+'/settings/get-payment-methods-details';

		$.ajax({
			url : url,
			type : "post",
			data : {
				'currency_id':currencyId,
				'paymentMethod':paymentMethod,
				'_token':token
			},
			dataType : 'json',
			success:function(data)
			{
				if (data.flag == true && data.methodTitle == 'Bank') {
					let tr = '';
					$.each(data.banks, function(key, value)
					{
						tr += 	'<tr>'+
									'<td style="display: none;">'+ value.id + '</td>'+
									'<td>'+ value.bank_name +'</td>'+
									'<td>'+ value.account_name  + '&nbsp;&nbsp;' + '(*****' + value.account_number.substr(-4) + ')&nbsp;&nbsp;' + value.bank_name +'</td>'+
									'<td>'+ checkBankDefault(value.is_default) +'</td>'+
									'<td>'+ checkBankStatus(value.activated_for) +'</td>'+
									'<td>'+
										'<a data-id="'+value.id+'" class="btn btn-xs btn-primary edit-setting"><i class="glyphicon glyphicon-edit"></i></a> '+
										'<button data-id="'+value.id+'" type="button" class="btn btn-xs btn-danger delete"><i class="glyphicon glyphicon-trash"></i></button>' +
									'</td>'+
								'</tr>';
					});
					$('#bank_body').html(tr);
				} else if (isActiveMobileMoney == true && data.flag == true && data.methodTitle == 'MobileMoney') {
					let tr = '';
					$.each(data.mobileMoneys, function(key, value)
					{
						tr += 	'<tr>'+
									'<td style="display: none;">'+ value.id + '</td>'+
									'<td>'+ value.mobilemoney_name +'</td>'+
									'<td>'+ value.mobilemoney_number +'</td>'+
									'<td>'+ value.holder_name +'</td>'+
									'<td>'+ value.merchant_code +'</td>'+
									'<td>'+ checkBankDefault(value.is_default) +'</td>'+
									'<td>'+ checkBankStatus(value.activated_for) +'</td>'+
									'<td>'+
										'<a data-id="'+value.id+'" class="btn btn-xs btn-primary mobile-money-edit-setting"><i class="glyphicon glyphicon-edit"></i></a> '+
										'<button data-id="'+value.id+'" type="button" class="btn btn-xs btn-danger mobilemoney_delete"><i class="glyphicon glyphicon-trash"></i></button>' +
									'</td>'+
								'</tr>';
					});
					$('#mobilemoney_body').html(tr); 
				} else {
					$('#bank_body').html('');
					if (isActiveMobileMoney == true) {
                        $('#mobilemoney_body').html('');
                    }
				}

				if(data.status == 200) {
					$('#id').val(data.currencyPaymentMethod.id);

					$('#stripe_secret_key').val(JSON.parse(data.currencyPaymentMethod.method_data).secret_key);
					$('#stripe_publishable_key').val(JSON.parse(data.currencyPaymentMethod.method_data).publishable_key);

					$('#paypal_client_id').val(JSON.parse(data.currencyPaymentMethod.method_data).client_id);
					$('#paypal_client_secret').val(JSON.parse(data.currencyPaymentMethod.method_data).client_secret);
					$('#paypal_mode').val(JSON.parse(data.currencyPaymentMethod.method_data).mode);

					$('#payUMoney_key').val(JSON.parse(data.currencyPaymentMethod.method_data).key);
					$('#payUMoney_salt').val(JSON.parse(data.currencyPaymentMethod.method_data).salt);
					$('#payUMoney_mode').val(JSON.parse(data.currencyPaymentMethod.method_data).mode);

					$('#coinPayments_merchant_id').val(JSON.parse(data.currencyPaymentMethod.method_data).merchant_id);
					$('#coinPayments_public_key').val(JSON.parse(data.currencyPaymentMethod.method_data).public_key);
					$('#coinPayments_private_key').val(JSON.parse(data.currencyPaymentMethod.method_data).private_key);

					$('#payeer_merchant_id').val(JSON.parse(data.currencyPaymentMethod.method_data).merchant_id);
					$('#payeer_secret_key').val(JSON.parse(data.currencyPaymentMethod.method_data).secret_key);
					$('#payeer_encryption_key').val(JSON.parse(data.currencyPaymentMethod.method_data).encryption_key);
					$('#payeer_merchant_domain').val(JSON.parse(data.currencyPaymentMethod.method_data).merchant_domain);

					$('#cash_merchant_reference').val(JSON.parse(data.currencyPaymentMethod.method_data).merchant_reference);

					$('#mobile_payment_number').val(JSON.parse(data.currencyPaymentMethod.method_data).payment_number);

					$('#processing_time').val(data.currencyPaymentMethod.processing_time);

					var activated_for = JSON.parse(data.currencyPaymentMethod.activated_for);

					if (activated_for.hasOwnProperty('deposit')) {
						$('#stripe_status').val('Active');
						$('#paypal_status').val('Active');
						$('#payUMoney_status').val('Active');
						$('#coinPayments_status').val('Active');
						$('#payeer_status').val('Active');
						$('#cash_status').val('Active');
						$('#mobile_status').val('Active');
					} else {
						$('#stripe_status').val('Inactive');
						$('#paypal_status').val('Inactive');
						$('#payUMoney_status').val('Inactive');
						$('#coinPayments_status').val('Inactive');
						$('#payeer_status').val('Inactive');
						$('#cash_status').val('Inactive');
						$('#mobile_status').val('Inactive');
					}
				} else {
					$('#id').val('');
					$('#stripe_secret_key').val('');
					$('#stripe_publishable_key').val('');

					$('#paypal_client_id').val('');
					$('#paypal_client_secret').val('');
					$('#paypal_mode').val('');

					$('#payUMoney_key').val('');
					$('#payUMoney_salt').val('');
					$('#payUMoney_mode').val('');

					$('#coinPayments_merchant_id').val('');
					$('#coinPayments_public_key').val('');
					$('#coinPayments_private_key').val('');

					$('#payeer_merchant_id').val('');
					$('#payeer_secret_key').val('');
					$('#payeer_encryption_key').val('');
					$('#payeer_merchant_domain').val('');

					$('#cash_merchant_reference').val('');

					$('#mobile_payment_number').val('');

					$('#processing_time').val('');

					$('#stripe_status').val('');
					$('#paypal_status').val('');
					$('#payUMoney_status').val('');
					$('#coinPayments_status').val('');
					$('#payeer_status').val('');
					$('#cash_status').val('');
					$('#mobile_status').val('');
				}
			},
			error: function(error){
				console.log(error);
			}
        });
    }

    //Get Specific Currency Details
    function getPaymentMethodsSpecificCurrencyDetails()
    {
		var currencyId       = $('#currency_id').val();
		var paymentMethod = $('#paymentMethod').val();
		var token            = $("input[name=_token]").val();
		var url              = SITE_URL+'/'+ADMIN_PREFIX+'/settings/get-payment-methods-specific-currency-details';

        $.ajax({
            url : url,
            type : "post",
            data : {
				'currency_id':currencyId,
				'paymentMethod':paymentMethod,
				'_token':token
            },
            dataType : 'json',
            success:function(data)
            {
				if (data.flag == true && data.methodTitle == 'Bank') {
					var tr = '';
					$.each(data.banks, function(key, value)
					{
						tr += 	'<tr>'+
									'<td style="display: none;">'+ value.id + '</td>'+
									'<td>'+ value.bank_name +'</td>'+
									'<td>'+ value.account_name  + '&nbsp;&nbsp;' + '(*****' + value.account_number.substr(-4) + ')&nbsp;&nbsp;' + value.bank_name +'</td>'+
									'<td>'+ checkBankDefault(value.is_default) +'</td>'+
									'<td>'+ checkBankStatus(value.activated_for) +'</td>'+
									'<td>'+
										'<a data-id="'+value.id+'" class="btn btn-xs btn-primary edit-setting"><i class="glyphicon glyphicon-edit"></i></a> '+
										'<button data-id="'+value.id+'" type="button" class="btn btn-xs btn-danger delete"><i class="glyphicon glyphicon-trash"></i></button>' +
									'</td>'+
								'</tr>';
					});
					$('#bank_body').html(tr);
				} else if (isActiveMobileMoney == true && data.flag == true && data.methodTitle == 'MobileMoney') {
					var tr = '';
					$.each(data.mobileMoneys, function(key, value)
					{
						tr += 	'<tr>'+
									'<td style="display: none;">'+ value.id + '</td>'+
									'<td>'+ value.mobilemoney_name +'</td>'+
									'<td>'+ value.mobilemoney_number +'</td>'+
									'<td>'+ value.holder_name +'</td>'+
									'<td>'+ value.merchant_code +'</td>'+
									'<td>'+ checkBankDefault(value.is_default) +'</td>'+
									'<td>'+ checkBankStatus(value.activated_for) +'</td>'+
									'<td>'+
										'<a data-id="'+value.id+'" class="btn btn-xs btn-primary mobile-money-edit-setting"><i class="glyphicon glyphicon-edit"></i></a> '+
										'<button data-id="'+value.id+'" type="button" class="btn btn-xs btn-danger mobilemoney_delete"><i class="glyphicon glyphicon-trash"></i></button>' +
									'</td>'+
								'</tr>';
					});
					$('#mobilemoney_body').html(tr);
				} else {
					$('#bank_body').html('');
					if (isActiveMobileMoney == true) {
                        $('#mobilemoney_body').html('');
                    }
				}

                if(data.status == 200) {
					$('.currencyName').text(data.currency.name);
					$('#currency_id').val(data.currency.id);

					$('#stripe_secret_key').val(JSON.parse(data.currencyPaymentMethod.method_data).secret_key);
					$('#stripe_publishable_key').val(JSON.parse(data.currencyPaymentMethod.method_data).publishable_key);

					$('#paypal_client_id').val(JSON.parse(data.currencyPaymentMethod.method_data).client_id);
					$('#paypal_client_secret').val(JSON.parse(data.currencyPaymentMethod.method_data).client_secret);
					$('#paypal_mode').val(JSON.parse(data.currencyPaymentMethod.method_data).mode);

					$('#payUMoney_key').val(JSON.parse(data.currencyPaymentMethod.method_data).key);
					$('#payUMoney_salt').val(JSON.parse(data.currencyPaymentMethod.method_data).salt);
					$('#payUMoney_mode').val(JSON.parse(data.currencyPaymentMethod.method_data).mode);

					$('#coinPayments_merchant_id').val(JSON.parse(data.currencyPaymentMethod.method_data).merchant_id);
					$('#coinPayments_public_key').val(JSON.parse(data.currencyPaymentMethod.method_data).public_key);
					$('#coinPayments_private_key').val(JSON.parse(data.currencyPaymentMethod.method_data).private_key);

					$('#payeer_merchant_id').val(JSON.parse(data.currencyPaymentMethod.method_data).merchant_id);
					$('#payeer_secret_key').val(JSON.parse(data.currencyPaymentMethod.method_data).secret_key);
					$('#payeer_encryption_key').val(JSON.parse(data.currencyPaymentMethod.method_data).encryption_key);
					$('#payeer_merchant_domain').val(JSON.parse(data.currencyPaymentMethod.method_data).merchant_domain);

					$('#cash_merchant_reference').val(JSON.parse(data.currencyPaymentMethod.method_data).merchant_reference);

					$('#mobile_payment_number').val(JSON.parse(data.currencyPaymentMethod.method_data).payment_number);

					$('#processing_time').val(data.currencyPaymentMethod.processing_time);

					var activated_for = JSON.parse(data.currencyPaymentMethod.activated_for);
					if (activated_for.hasOwnProperty('deposit')) {
						$('#stripe_status').val('Active');
						$('#paypal_status').val('Active');
						$('#payUMoney_status').val('Active');
						$('#coinPayments_status').val('Active');
						$('#payeer_status').val('Active');
						$('#cash_status').val('Active');
						$('#mobile_status').val('Active');
					} else {
						$('#stripe_status').val('Inactive');
						$('#paypal_status').val('Inactive');
						$('#payUMoney_status').val('Inactive');
						$('#coinPayments_status').val('Inactive');
						$('#payeer_status').val('Inactive');
						$('#cash_status').val('Inactive');
						$('#mobile_status').val('Inactive');
					}
                } else {
					$('#id').val('');
					$('.currencyName').text(data.currency.name);
					$('#currency_id').val(data.currency.id);

					$('#stripe_secret_key').val('');
					$('#stripe_publishable_key').val('');

					$('#paypal_client_id').val('');
					$('#paypal_client_secret').val('');
					$('#paypal_mode').val('');

					$('#payUMoney_key').val('');
					$('#payUMoney_salt').val('');
					$('#payUMoney_mode').val('');

					$('#coinPayments_merchant_id').val('');
					$('#coinPayments_public_key').val('');
					$('#coinPayments_private_key').val('');

					$('#payeer_merchant_id').val('');
					$('#payeer_secret_key').val('');
					$('#payeer_encryption_key').val('');
					$('#payeer_merchant_domain').val('');

					$('#cash_merchant_reference').val('');
					$('#mobile_payment_number').val('');

					$('#processing_time').val('');

					$('#stripe_status').val('');
					$('#paypal_status').val('');
					$('#payUMoney_status').val('');
					$('#coinPayments_status').val('');
					$('#payeer_status').val('');
					$('#cash_status').val('');
					$('#mobile_status').val('');
				}
            },
			error: function(error){
				console.log(error);
			}
        });
    }


    function checkBankDefault(is_default)
	{
		var cell = '';
		if (is_default == "Yes") {
			cell = '<span class="label label-success">Yes</span>';
		} else if (is_default == "No") {
			cell = '<span class="label label-danger">No</span>';
		}
		return cell;
	}

	function checkBankStatus(activated_for)
	{
		var cell = '';
		var activated = JSON.parse(activated_for);
		if (activated.hasOwnProperty('deposit')) {
			cell = '<span class="label label-success">Active</span>';
		} else {
			cell = '<span class="label label-danger">Inactive</span>';
		}
		return cell;
	}

	$(document).on('click', '#coinpayments_copy_button', function(e) {
		e.preventDefault();
		$('.coinpayments_ipn_url').select();
		document.execCommand('copy');
		swal({
			title: "{{ __('Copied!') }}",
			text: "{{ __('IPN URL link Copied!') }}",
			type: "success",
			icon: "success",
			closeOnClickOutside: false,
			closeOnEsc: false,
		});
	})	

</script>

@if (config('mobilemoney.is_active') && $list_menu == 'mobilemoney')
    <script>
        var token = '{!! csrf_token() !!}';
        var defaultImagePath = "{!! asset('public/uploads/userPic/default-image.png') !!}";
    </script>
    <script src="{{ asset('public/dist/js/mobile-money.min.js') }}"></script>
@endif

@endpush
