@extends('admin.layouts.master')

@section('title', 'Payout')

@section('page_content')

<style type="text/css">
.confirm-btns {
    width: 35px;
    height: 35px;
    background-color: #58c42b !important;
    border-radius: 50%;
    border: 1px solid #247701;
    color: #FFFFFF;
    text-align: center;
    line-height: 25px;
    font-size: 25px;
    text-shadow: #009933;
    margin: 0 auto;
}
</style>

<div class="box">
    <div class="panel-body">
        <ul class="nav nav-tabs cus" role="tablist">
            <li class="active">
                <a href='{{ url(\Config::get('adminPrefix')."/users/edit/$user_id")}}'>Profile</a>
            </li>
            <li>
                <a href="{{ url(\Config::get('adminPrefix')."/users/transactions/$user_id")}}">Transactions</a>
            </li>
            <li>
                <a href="{{ url(\Config::get('adminPrefix')."/users/wallets/$user_id")}}">Wallets</a>
            </li>
            <li>
                <a href="{{ url(\Config::get('adminPrefix')."/users/tickets/$user_id")}}">Tickets</a>
            </li>
            <li>
                <a href="{{ url(\Config::get('adminPrefix')."/users/disputes/$user_id")}}">Disputes</a>
            </li>
        </ul>
        <div class="clearfix"></div>
    </div>
</div>

<div class="row">
    <div class="col-md-4">
        <h3>{{ $name }}</h3>
    </div>
    <div class="col-md-3"></div>
    <div class="col-md-5">
        <div class="pull-right">
            <a href="{{ url(\Config::get('adminPrefix').'/users/withdraw/create/' . $user_id) }}" style="margin-top: 15px;" class="pull-right btn btn-theme active">Withdraw</a>
        </div>
    </div>
</div>

<div class="box mt-20">
    <div class="box-body">
        <div class="row">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-7">

                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="text-center">
                                    <div class="confirm-btns"><i class="fa fa-check"></i></div>
                                </div>
                                <div class="text-center">
                                    <div class="h3 mt6 text-success">Success</div>
                                </div>
                                <div class="text-center"><p><strong>Withdrawal completed successfully.</strong></p></div>
                                    <h5 class="text-center mt10">Amount : {{ moneyFormat($transInfo['currSymbol'], formatNumber($transInfo['subtotal'], $transInfo['currency_id'])) }}</h5>
                                </div>
                        </div>
                    </div>

                    <div class="col-md-7">

                        <div style="margin-left: 0 auto">
                            <div style="float: left;">
                                <a href="{{ url(\Config::get('adminPrefix')."/users/withdraw/print/".$transInfo['id'])}}" target="_blank" class="btn button-secondary"><strong>Print</strong></a>
                            </div>
                            <div style="float: right;">
                                <a href="{{ url(\Config::get('adminPrefix')."/users/withdraw/create/$user_id")}}" class="btn btn-theme"><strong>Withdraw Again</strong></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@push('extra_body_scripts')
<script type="text/javascript">
</script>
@endpush