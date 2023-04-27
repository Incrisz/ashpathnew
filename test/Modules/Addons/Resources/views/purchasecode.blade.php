<link rel="stylesheet" type="text/css" href="{{ asset('Modules\Addons\Resources\assets\css\addon.css') }}">
<?php 
  $addons = \Modules\Addons\Entities\Addon::all();
  $numberOfAddons = count(array_filter($addons, function($addon) { return !$addon->get('core'); }));
?>

@if(session('AddonMessage'))
  <div class="addon-alert addon-alert-{{ (session('AddonStatus') == 'success') ? 'success' : 'danger' }}">
    <span class="addon-alert-closebtn">&times;</span>  
    <strong>{{ session('AddonMessage') }}</strong>
  </div>
@endif

@if($errors->any())
  @foreach($errors->all() as $error)
    <div class="addon-alert addon-alert-danger">
      <span class="addon-alert-closebtn">&times;</span>  
      <strong>{{ $error }}</strong>
    </div>
  @endforeach
@endif

<div style="padding-top:40px; padding-bottom:70px" class="addons-section">
  <div class="addons-card">
      <h5><span style="color: #04a9f5">{{ base64_decode($name) }}</span> {{ __('verification') }}</h5>
    </div>
    <hr>

  <div id="addons-form-container" style="display: {{ ($numberOfAddons > 0) ? 'block' : 'none' }}">
    <form action="{{ route('addon.verify', $name) }}" method="post" class="addons-form">
      @csrf
      <div>
        <!-- Purchase Code -->
        <div>
          <p>{{ __('Purchase Code') }}</p>
          <input type="text" value="{{ old('purchase_code') }}" placeholder="Purchase Code" name="purchase_code" required>
        </div>
        <!-- Envato Username -->
        <div>
          <p>{{ __('Envato Username') }}</p>
          <input type="text" value="{{ old('username') }}" placeholder="Envato username" name="username" required>
        </div>
      </div>
      <div style="position: absolute; right:50px; bottom:25px;"  class="input-file-container">
        <button class="submit-style" style="background-color: #04a9f5;
          color: white;
          font-size: 16px;
          padding: 8px 15px;
          border: none;
          border-radius: 5px;
          cursor: pointer;" type="submit">{{ __('Verify') }}</button>
        </div>
    </form>
    <hr>
  </div>
  
</div>
<script src="{{ asset('Modules/Addons/Resources/assets/js/addons.min.js') }}"></script>