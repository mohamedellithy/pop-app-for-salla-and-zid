@component('mail::message')
<div style="width:100%;text-align:center">
   <img style="width:50px;height:50px" src="https://popautomate.com/images/lOGOfINAL.png?7eb165507865767957597cd7e998f1ab" />
</div>
{{-- Greeting --}}
@if (! empty($greeting))
# {{ $greeting }}
@else
@if ($level === 'error')
# @lang('Whoops!')
@else
# @lang('Hello!')
@endif
@endif

{{-- Intro Lines --}}
@foreach ($introLines as $line)
{{ $line }}

@endforeach

{{-- Action Button --}}
@isset($actionText)
<?php
    switch ($level) {
        case 'success':
        case 'error':
            $color = $level;
            break;
        default:
            $color = 'primary';
    }
?>
@component('mail::button', ['url' => $actionUrl, 'color' => $color])
{{ $actionText }}
@endcomponent
@endisset

{{-- Outro Lines --}}
@foreach ($outroLines as $line)
{{ $line }}

@endforeach

<br/>
<br/>
<br/>

{{-- Salutation --}}
@if (! empty($salutation))
{{ $salutation }}
@endif
{{-- 
@else
@lang('Regards'),<br>
{{ config('app.name') }}
@endif --}}

{{-- Subcopy --}}
@isset($actionText)
@slot('subcopy')
 {{-- <span class="break-all">[{{ $displayableActionUrl }}]({{ $actionUrl }})</span> --}}
@endslot
@endisset
@endcomponent
