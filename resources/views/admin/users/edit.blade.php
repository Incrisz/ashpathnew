@extends('admin.layouts.master')

@section('title', 'Edit Profile')

@section('head_style')
  <!-- intlTelInput -->
  <link rel="stylesheet" type="text/css" href="{{ asset('public/backend/intl-tel-input-13.0.0/intl-tel-input-13.0.0/build/css/intlTelInput.css')}}">
@endsection

@section('page_content')
<div id="user-edit">
    <div class="box">
        <div class="panel-body ml-20">
            <ul class="nav nav-tabs cus" role="tablist">
                <li class="active">
                    <a href='{{ url(\Config::get('adminPrefix')."/users/edit/$users->id")}}'>Profile</a>
                </li>
                <li>
                    <a href="{{ url(\Config::get('adminPrefix')."/users/transactions/$users->id")}}">Transactions</a>
                </li>
                <li>
                    <a href="{{ url(\Config::get('adminPrefix')."/users/wallets/$users->id")}}">Wallets</a>
                </li>
                <li>
                    <a href="{{ url(\Config::get('adminPrefix')."/users/tickets/$users->id")}}">Tickets</a>
                </li>
                <li>
                    <a href="{{ url(\Config::get('adminPrefix')."/users/disputes/$users->id")}}">Disputes</a>
                </li>
                @if (config('referral.is_active') && count($users->referral_award_awarded_user) > 0)
                    <li>
                        <a href='{{ url(\Config::get("adminPrefix")."/users/referral-awards/" . $users->id) }}'>{{ __('Referral Awards') }}</a>
                    </li>
                @endif
            </ul>
            <div class="clearfix"></div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4">
            @if ($users->status == 'Inactive')
                <h3>{{ $users->first_name.' '.$users->last_name }}&nbsp;<span class="label label-danger">Inactive</span></h3>
            @elseif ($users->status == 'Suspended')
                <h3>{{ $users->first_name.' '.$users->last_name }}&nbsp;<span class="label label-warning">Suspended</span></h3>
            @elseif ($users->status == 'Active')
                <h3>{{ $users->first_name.' '.$users->last_name }}&nbsp;<span class="label label-success">Active</span></h3>
            @endif
        </div>
        <div class="col-md-3"></div>

        <div class="col-md-5">
            <div class="pull-right">
                <a style="margin-top: 15px;" href="{{ url(\Config::get('adminPrefix').'/users/deposit/create/'.$users->id) }}" class="btn btn-theme">Deposit</a>
                &nbsp;&nbsp;&nbsp;
                <a style="margin-top: 15px;" href="{{ url(\Config::get('adminPrefix').'/users/withdraw/create/'.$users->id) }}" class="btn btn-theme">Withdraw</a>
                &nbsp;&nbsp;&nbsp;
            </div>
        </div>
    </div>


    <div class="box mt-20">
        <div class="box-body">
            <div class="row">
                <div class="col-md-12">
                    <!-- form start -->
                    <form action="{{ url(\Config::get('adminPrefix').'/users/update') }}" class="form-horizontal" id="user_form" method="POST">
                        {{ csrf_field() }}

                        <input type="hidden" value="{{ $users->id }}" name="id" id="id" />
                        <input type="hidden" value="{{ $users->defaultCountry }}" name="user_defaultCountry" id="user_defaultCountry" />
                        <input type="hidden" value="{{ $users->carrierCode }}" name="user_carrierCode" id="user_carrierCode" />
                        <input type="hidden" name="formattedPhone" id="formattedPhone">

                        <div class="box-body">
                            @if (count($errors) > 0)
                                <div class="alert alert-danger">
                                    <ul>
                                        @foreach ($errors->all() as $error)
                                            <li>{{ $error }}</li>
                                        @endforeach
                                    </ul>
                                </div>
                            @endif
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="col-md-7">
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label" for="inputEmail3">
                                                First Name
                                            </label>
                                            <div class="col-sm-8">
                                                <input class="form-control" placeholder="Update First Name" name="first_name" type="text" id="first_name" value="{{ $users->first_name }}">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-4 control-label" for="inputEmail3">
                                                Last Name
                                            </label>
                                            <div class="col-sm-8">
                                                <input class="form-control" placeholder="Update Last Name" name="last_name" type="text" id="last_name" value="{{ $users->last_name }}">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-4 control-label" for="inputEmail3">
                                                Phone
                                            </label>
                                            <div class="col-sm-8">
                                                <input type="tel" class="form-control" id="phone" name="phone">
                                                <span id="phone-error"></span>
                                                <span id="tel-error"></span>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-4 control-label require" for="inputEmail3">
                                                Email
                                            </label>
                                            <div class="col-sm-8">
                                                <input class="form-control" placeholder="Update Email" name="email" type="email" id="email" value="{{ $users->email }}">
                                                <span id="emailError"></span>
                                                <span id="email-ok" class="text-success"></span>
                                            </div>
                                        </div>

                                        <!-- Role -->
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label require" for="inputEmail3">Group</label>
                                            <div class="col-sm-8">
                                                <select class="select2" name="role" id="role">
                                                    @foreach ($roles as $role)
                                                    <option value='{{ $role->id }}' {{ $role->id == $users->role_id ? 'selected':""}}> {{ $role->display_name }}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>


                                        <div class="form-group">
                                            <label class="col-sm-4 control-label" for="inputEmail3">
                                                Password
                                            </label>
                                            <div class="col-sm-8">
                                                <input class="form-control" placeholder="Update Password (min 6 characters)" name="password" type="password" id="password">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-4 control-label" for="inputEmail3">
                                                Confirm Password
                                            </label>
                                            <div class="col-sm-8">
                                                <input class="form-control" placeholder="Confirm password (min 6 characters)" name="password_confirmation" type="password" id="password_confirmation">
                                            </div>
                                        </div>

                                        <!-- Status -->
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label require" for="status">Status</label>
                                            <div class="col-sm-8">
                                                <select class="select2" name="status" id="status">
                                                    <option value='Active' {{ $users->status == 'Active' ? 'selected' : '' }}>Active</option>
                                                    <option value='Inactive' {{ $users->status == 'Inactive' ? 'selected' : '' }}>Inactive</option>
                                                    <option value='Suspended' {{ $users->status == 'Suspended' ? 'selected' : '' }}>Suspended</option>
                                                </select>
                                                <label id="user-status" class="error" for="status"></label>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-4" for="inputEmail3">
                                            </label>
                                            <div class="col-sm-8">
                                                <a class="btn btn-theme-danger" href="{{ url(\Config::get('adminPrefix').'/users') }}" id="users_cancel">
                                                    Cancel
                                                </a>
                                                <button type="submit" class="btn btn-theme pull-right" id="users_edit">
                                                    <i class="fa fa-spinner fa-spin" style="display: none;"></i> <span id="users_edit_text">Update</span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@push('extra_body_scripts')
<script src="{{ asset('public/dist/js/jquery.validate.min.js') }}" type="text/javascript"></script>
<script src="{{ asset('public/backend/intl-tel-input-13.0.0/intl-tel-input-13.0.0/build/js/intlTelInput.js')}}" type="text/javascript"></script>
<script src="{{ asset('public/dist/js/isValidPhoneNumber.js') }}" type="text/javascript"></script>
<script type="text/javascript">
    'use strict';
    var hasPhoneError = false;
    var hasEmailError = false;
    var userNameError = '{{ __("Please enter only alphabet and spaces.") }}';
    var userNameLengthError = '{{ __("Name length can not be more than 30 characters") }}';
    var utilsScriptLoadingPath = '{{ url("public/backend/intl-tel-input-13.0.0/intl-tel-input-13.0.0/build/js/utils.js") }}';
    var formattedPhoneNumber = '{{ !empty($users->formattedPhone) ? $users->formattedPhone : NULL }}';
    var carrierCode = '{{ !empty($users->carrierCode) ? $users->carrierCode : NULL }}';
    var defaultCountry = '{{ !empty($users->defaultCountry) ? $users->defaultCountry : NULL }}';
    var validPhoneNumberErrorText = '{{ __("Please enter a valid international phone number.") }}';
    var inactiveWarning = '{!! __("Warning! User would not be able to login.") !!}';
    var suspendWarning = '{!! __("Warning! User would not be able to do any transaction.") !!}';
    var passwordMatchErrorText = '{{ __("Please enter same value as the password field.") }}';
    var updatingText = '{{ __("Updating...") }}';
</script>
<script src="{{ asset('public/dist/js/admin_custom.min.js') }}" type="text/javascript"></script>
@endpush
