@extends('admin.layouts.master')
@section('title', 'Edit Transfer')

@section('page_content')
    <div class="box box-default">
        <div class="box-body">
            <div class="d-flex justify-content-between">
                <div>
                    <div class="top-bar-title padding-bottom pull-left">Transfer Details</div>
                </div>

                <div>
                    @if ($transfer->status)
                        <h4 class="text-left">Status : @if ($transfer->status == 'Success')
                                <span class="text-green">Success</span>@endif
                            @if ($transfer->status == 'Pending')<span
                                    class="text-blue">Pending</span>@endif
                            @if ($transfer->status == 'Refund')<span
                                    class="text-orange">Refunded</span>@endif
                            @if ($transfer->status == 'Blocked')<span
                                    class="text-red">Cancelled</span>@endif
                        </h4>
                    @endif
                </div>
            </div>
        </div>
    </div>

    <section class="min-vh-100">
        <div class="my-30">
            <div class="row">
                <form action="{{ url(\Config::get('adminPrefix') . '/transfers/update') }}" class="form-horizontal"
                    id="transfers_form" method="POST">
                    {{ csrf_field() }}
                    <!-- Page title start -->
                    <div class="col-md-8 col-xl-9">
                        <div class="box">
                            <div class="box-body">
                                <div class="panel">
                                    <div class="panel-body">
                                        <div class="mt-4 p-4 bg-secondary rounded shadow">
                                            <input type="hidden" value="{{ $transfer->id }}" name="id" id="id">
                                            <input type="hidden" value="{{ $transfer->uuid }}" name="uuid" id="uuid">
                                            <input type="hidden" value="{{ $transfer->sender_id }}" name="sender_id" id="sender_id">
                                            <input type="hidden" value="{{ $transfer->receiver_id }}" name="receiver_id" id="receiver_id">
                                            <input type="hidden" value="{{ $transfer->currency->id }}" name="currency_id" id="currency_id">
                                            <input type="hidden" value="{{ $transfer->note }}" name="note" id="note">
                                            <input type="hidden" value="{{ $transfer->email }}" name="email" id="email">
                                            <input type="hidden" value="{{ $transfer->phone }}" name="phone" id="phone">
                                            <input type="hidden" value="{{ $transaction->transaction_type_id }}" name="transaction_type_id" id="transaction_type_id">
                                            <input type="hidden" value="{{ $transaction->transaction_type->name }}" name="transaction_type" id="transaction_type">
                                            <input type="hidden" value="{{ $transaction->status }}" name="transaction_status" id="transaction_status">
                                            <input type="hidden" value="{{ $transaction->transaction_reference_id }}" name="transaction_reference_id" id="transaction_reference_id">
                                            <input type="hidden" value="{{ $transaction->percentage }}" name="percentage" id="percentage">
                                            <input type="hidden" value="{{ $transaction->charge_percentage }}" name="charge_percentage" id="charge_percentage">
                                            <input type="hidden" value="{{ $transaction->charge_fixed }}" name="charge_fixed" id="charge_fixed">

                                            <div class="panel panel-default">
                                                <div class="panel-body">

                                                    <div class="form-group">
                                                        @if (!empty($transfer->bank))
                                                            <label class="control-label col-sm-3" for="sender">Transferred By</label>
                                                        @else
                                                            <label class="control-label col-sm-3" for="sender">Paid By</label>
                                                        @endif
                                                        <input type="hidden" class="form-control" name="sender"
                                                            value="{{ isset($transfer->sender) ? $transfer->sender->first_name . ' ' . $transfer->sender->last_name : '-' }}">
                                                        <div class="col-sm-9">
                                                            <p class="form-control-static">
                                                                {{ isset($transfer->sender) ? $transfer->sender->first_name . ' ' . $transfer->sender->last_name : '-' }}
                                                            </p>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="control-label col-sm-3" for="receiver">Paid To</label>
                                                        @if ($transfer->receiver)
                                                            <input type="hidden" class="form-control" name="receiver" value="{{ isset($transfer->receiver) ? $transfer->receiver->first_name . ' ' . $transfer->receiver->last_name : '-' }}">
                                                            <div class="col-sm-9">
                                                                <p class="form-control-static">
                                                                    {{ isset($transfer->receiver) ? $transfer->receiver->first_name . ' ' . $transfer->receiver->last_name : '-' }}
                                                                </p>
                                                            </div>
                                                        @else
                                                            <input type="hidden" class="form-control" name="receiver"
                                                                value="{{ isset($transfer->email) ? $transfer->email : $transfer->phone }}">
                                                            <div class="col-sm-9">
                                                                <p class="form-control-static">
                                                                    {{ isset($transfer->email) ? $transfer->email : $transfer->phone }}
                                                                </p>
                                                            </div>
                                                        @endif
                                                    </div>

                                                    @if ($transfer->uuid)
                                                        <div class="form-group">
                                                            <label class="control-label col-sm-3"
                                                                for="transfer_uuid">Transaction ID</label>
                                                            <input type="hidden" class="form-control" name="transfer_uuid"
                                                                value="{{ $transfer->uuid }}">
                                                            <div class="col-sm-9">
                                                                <p class="form-control-static">{{ $transfer->uuid }}</p>
                                                            </div>
                                                        </div>
                                                    @endif

                                                    @if ($transfer->currency)
                                                        <div class="form-group">
                                                            <label class="control-label col-sm-3"
                                                                for="currency">Currency</label>
                                                            <input type="hidden" class="form-control" name="currency"
                                                                value="{{ $transfer->currency->code }}">
                                                            <div class="col-sm-9">
                                                                <p class="form-control-static">
                                                                    {{ $transfer->currency->code }}</p>
                                                            </div>
                                                        </div>
                                                    @endif
                                                    @if ($transfer->created_at)
                                                        <div class="form-group">
                                                            <label class="control-label col-sm-3" for="created_at">Date</label>
                                                            <input type="hidden" class="form-control" name="created_at" value="{{ $transfer->created_at }}">
                                                            <div class="col-sm-9">
                                                                <p class="form-control-static">{{ dateFormat($transfer->created_at) }}</p>
                                                            </div>
                                                        </div>
                                                    @endif

                                                    @if ($transfer->status)
                                                        <div class="form-group">
                                                            <label class="control-label col-sm-3" for="status">Change Status</label>
                                                            <div class="col-sm-9">
                                                                @if (isset($transactionOfRefunded) && isset($transferOfRefunded))
                                                                    <p class="form-control-static"><span class="label label-success">Already Refunded</span></p>

                                                                    <p class="form-control-static"><span
                                                                            class="label label-danger">Refund Reference:
                                                                            <i>
                                                                                <a id="transferOfRefunded"
                                                                                    href="{{ url(\Config::get('adminPrefix') . "/transfers/edit/$transferOfRefunded->id") }}">(
                                                                                    {{ $transactionOfRefunded->refund_reference }}
                                                                                    )
                                                                                </a>
                                                                            </i>
                                                                        </span>
                                                                    </p>
                                                                @else
                                                                    <select class="form-control select2" name="status" style="width: 60%;">
                                                                        @if ($transfer->status == 'Success')
                                                                            <option value="Success" {{ $transfer->status == 'Success' ? 'selected' : '' }}> Success</option>
                                                                            <option value="Pending" {{ $transfer->status == 'Pending' ? 'selected' : '' }}> Pending</option>
                                                                            <option value="Refund" {{ $transfer->status == 'Refund' ? 'selected' : '' }}>Refund</option>
                                                                            <option value="Blocked" {{ $transfer->status == 'Blocked' ? 'selected' : '' }}> Cancel</option>
                                                                        @else
                                                                            <option value="Success" {{ $transfer->status == 'Success' ? 'selected' : '' }}>Success</option>
                                                                            <option value="Pending"{{ $transfer->status == 'Pending' ? 'selected' : '' }}>Pending</option>
                                                                            <option value="Blocked"{{ $transfer->status == 'Blocked' ? 'selected' : '' }}>Cancel</option>
                                                                        @endif
                                                                    </select>
                                                                @endif

                                                            </div>
                                                        </div>
                                                    @endif

                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="row">
                                                        <div class="col-md-3"></div>
                                                        <div class="col-md-2"><a id="cancel_anchor" class="btn btn-theme-danger pull-left" href="{{ url(\Config::get('adminPrefix') . '/transfers') }}">Cancel</a>
                                                        </div>

                                                        @if (!isset($transactionOfRefunded->refund_reference))
                                                            <div class="col-md-4">
                                                                <button type="submit" class="btn btn-theme pull-right"
                                                                    id="transfers_edit">
                                                                    <i class="fa fa-spinner fa-spin"
                                                                        style="display: none;"></i> <span
                                                                        id="transfers_edit_text">Update</span>
                                                                </button>
                                                            </div>
                                                        @endif
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-xl-3">
                        <div class="box">
                            <div class="box-body">
                                <div class="panel">
                                    <div class="panel-body">
                                        <div class="mt-4 p-4 bg-secondary rounded shadow">
                                            <div class="panel panel-default">
                                                <div class="panel-body">
                                                    @if ($transfer->amount)
                                                        <div class="form-group">
                                                            <label class="control-label col-sm-6"
                                                                for="amount">Amount</label>
                                                            <input type="hidden" class="form-control" name="amount"
                                                                value="{{ $transfer->amount }}">
                                                            <div class="col-sm-6">
                                                                <p class="form-control-static">
                                                                    {{ moneyFormat($transfer->currency->symbol, formatNumber($transfer->amount, $transfer->currency->id)) }}
                                                                </p>
                                                            </div>
                                                        </div>
                                                    @endif

                                                    <div class="form-group total-deposit-feesTotal-space">
                                                        <label class="control-label col-sm-6" for="feesTotal">Fees
                                                            <span>
                                                                <small class="transactions-edit-fee">
                                                                    @if (isset($transaction))
                                                                        ({{ formatNumber($transaction->percentage, $transfer->currency->id) }}% +
                                                                        {{ formatNumber($transaction->charge_fixed, $transfer->currency->id) }})
                                                                    @else
                                                                        ({{ 0 }}%+{{ 0 }})
                                                                    @endif
                                                                </small>
                                                            </span>
                                                        </label>
                                                        <input type="hidden" class="form-control" name="feesTotal" value="{{ $transfer->fee }}">

                                                        <div class="col-sm-6">
                                                            <p class="form-control-static">
                                                                {{ moneyFormat($transfer->currency->symbol, formatNumber($transfer->fee, $transfer->currency->id)) }}
                                                            </p>
                                                        </div>
                                                    </div>
                                                    <hr class="increase-hr-height">

                                                    @php
                                                        $total = $transfer->fee + $transfer->amount;
                                                    @endphp

                                                    @if (isset($total))
                                                        <div class="form-group total-deposit-space">
                                                            <label class="control-label col-sm-6" for="total">Total</label>
                                                            <input type="hidden" class="form-control" name="total"
                                                                value="{{ $total }}">
                                                            <div class="col-sm-6">
                                                                <p class="form-control-static">
                                                                    {{ moneyFormat($transfer->currency->symbol, formatNumber($total, $transfer->currency->id)) }}
                                                                </p>
                                                            </div>
                                                        </div>
                                                    @endif
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
@endsection

@push('extra_body_scripts')
    <script type="text/javascript">
        $(".select2").select2({});

        // disabling submit and cancel button after clicking it
        $(document).ready(function() {
            $('form').submit(function() {
                $("#transfers_edit").attr("disabled", true);
                $('#cancel_anchor').attr("disabled", "disabled");
                $(".fa-spin").show();
                $("#transfers_edit_text").text('Updating...');

                // Click False
                $('#transfers_edit').click(false);
                $('#cancel_anchor').click(false);
            });

            $('#transferOfRefunded').css('color', 'white');
        });
    </script>
@endpush
