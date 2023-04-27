<!DOCTYPE html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <title>Print</title>
</head>
<style>
    body {
        font-family: 'Lato', sans-serif;
        color: #121212;
    }

    hr {
        border-top: 1px solid #f0f0f0;
    }

    table {
        border-collapse: collapse;
    }

    .code td {
        padding: 5px;
    }

</style>

<body>
    <div style="width:900px; margin:auto; top:20px; position:relative;">
        <table style="margin-bottom:40px;">
            <tr>
                <td>
                    @if (!empty(settings('logo')) && file_exists(public_path('images/logos/' . settings('logo'))))
                        <img src='{{ public_path('/images/logos/' . settings('logo')) }}' width="288" height="90"
                            alt="Logo" />
                    @else
                        <img src="{{ url('public/uploads/userPic/default-logo.jpg') }}" width="288" height="90">
                    @endif
                </td>
            </tr>
        </table>

        <table>
            <tr>
                <td>
                    <table>

                        <tr>
                            <td style="font-size:16px; color:#000000; line-height:25px; font-weight:bold;">Payout With</td>
                        </tr>
                        <tr>
                            <td style="font-size:15px; color:#4e5c6e; line-height:22px;">
                                {{ $transactionDetails->payment_method->name == 'Mts' ? 'Pay Money' : $transactionDetails->payment_method->name }}
                            </td>
                        </tr>
                        <br><br>
                        <tr>
                            <td style="font-size:16px; color:#000000; line-height:25px; font-weight:bold;">Transaction ID</td>
                        </tr>
                        <tr>
                            <td style="font-size:15px; color:#4e5c6e; line-height:22px;">{{ $transactionDetails->uuid }}</td>
                        </tr>
                        <br><br>
                        <tr>
                            <td style="font-size:16px; color:#000000; line-height:25px; font-weight:bold;">Transaction Date</td>
                        </tr>
                        <tr>
                            <td style="font-size:15px; color:#4e5c6e; line-height:22px;">{{ dateFormat($transactionDetails->created_at) }}</td>
                        </tr>
                        <br><br>
                        <tr>
                            <td style="font-size:16px; color:#000000; line-height:25px; font-weight:bold;">Status</td>
                        </tr>
                        <tr>
                            <td style="font-size:15px; color:#4e5c6e; line-height:22px;">
                                {{ $transactionDetails->status == 'Blocked' ? __('Cancelled') : ($transactionDetails->status == 'Refund' ? __('Refunded') : __($transactionDetails->status)) }}
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>

            <tr>
                <td>
                    <table style="margin-top:20px; width:300px;">
                        <tr>
                            <td colspan="2" style="font-size:16px; color:#000000; font-weight:bold;">Details</td>
                        </tr>
                        <tr>
                            <td style="font-size:15px; color:#000000;">Payout Amount</td>
                            <td style="font-size:15px; color:#4e5c6e; text-align:right;">
                                {{ moneyFormat($transactionDetails->currency->symbol, formatNumber($transactionDetails->subtotal, $transactionDetails->currency->id)) }}
                            </td>
                        </tr>
                        @if (abs($transactionDetails->total) - abs($transactionDetails->subtotal) > 0)
                            <tr style="padding-bottom:10px;">
                                <td style="font-size:15px; color:#000000;">Fee</td>
                                <td style="font-size:15px; color:#4e5c6e; text-align:right;">
                                    {{ moneyFormat($transactionDetails->currency->symbol, formatNumber($transactionDetails->charge_percentage + $transactionDetails->charge_fixed, $transactionDetails->currency->id)) }}
                                </td>
                            </tr>
                        @endif
                        <tr>
                            <td colspan="2" style="border-top:1px solid #eaeaea; padding-top:0; margin-bottom:3px;">
                            </td>
                        </tr>
                        <tr>
                            <td style="font-size:15px; color:#000000; font-weight:bold;">Total</td>
                            <td style="font-size:15px; color:#4e5c6e; text-align:right; font-weight:bold;">
                                {{ moneyFormat($transactionDetails->currency->symbol, str_replace('-', '', formatNumber($transactionDetails->total, $transactionDetails->currency->id))) }}
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
</body>

</html>
