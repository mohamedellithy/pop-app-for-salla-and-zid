<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}" dir="rtl">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="{{ asset('assets/landing/img/favicon/favicon.ico') }}" type="image/x-icon">
    <link rel="icon" sizes="16x16" href="{{ asset('assets/landing/img/favicon/favicon-16x16.png') }}" type="image/x-icon">
    <link rel="icon" sizes="32x32" href="{{ asset('assets/landing/img/favicon/favicon-32x32.png') }}" type="image/x-icon">
    <link rel="shortcut icon" href="{{ asset('assets/landing/img/favicon/favicon.ico') }}" type="image/x-icon">
    <link rel="apple-touch-icon" href="{{ asset('assets/landing/img/favicon/apple-touch-icon.png') }}">
    <link rel="icon" sizes="192x192" href="{{ asset('assets/landing/img/favicon/android-chrome-192x192.png') }}">
    <link rel="icon" sizes="512x512" href="{{ asset('assets/landing/img/favicon/android-chrome-512x512.png') }}">
    <meta name="msapplication-TileImage" content="tile-image.png">
    <meta name="theme-color" content="#111827">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>بوب أوتو | PopAutomate</title>

    <!-- Scripts -->
    <script src="{{ asset('js/app.js') }}" defer></script>

    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">
    <link href="{{ asset('assets/css/style.css') }}">

    <!-- Styles -->
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <!-- Google Tag Manager -->
    <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
    new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
    j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
    'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
    })(window,document,'script','dataLayer','GTM-PRZKZ5H');</script>
    <!-- End Google Tag Manager -->
</head>
<body>
    <div id="app">
        @yield('content')
    </div>
    <script src="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.min.js" defer></script>
    <script type="text/javascript">window.$crisp=[];window.CRISP_WEBSITE_ID="3923844f-984b-4390-addf-645595338dbf";(function(){d=document;s=d.createElement("script");s.src="https://client.crisp.chat/l.js";s.async=1;d.getElementsByTagName("head")[0].appendChild(s);})();</script>
    <!-- Google Tag Manager (noscript) -->
    <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-PRZKZ5H"
    height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
    <!-- End Google Tag Manager (noscript) -->

    <!-- Frill Widget (https://frill.co) -->
    <script>
        window.Frill_Config = window.Frill_Config || [];
        window.Frill_Config.push({ key: '55b600ac-b128-4ab3-b84d-ae98667f04b2' });
    </script>
    <script async src="https://widget.frill.co/v2/widget.js"></script>
  <!-- End Frill Widget -->
    <script>
    (function(h,o,t,j,a,r){
        h.hj=h.hj||function(){(h.hj.q=h.hj.q||[]).push(arguments)};
        h._hjSettings={hjid:3534318,hjsv:6};
        a=o.getElementsByTagName('head')[0];
        r=o.createElement('script');r.async=1;
        r.src=t+h._hjSettings.hjid+j+h._hjSettings.hjsv;
        a.appendChild(r);
    })(window,document,'https://static.hotjar.com/c/hotjar-','.js?sv=');
    </script>
</body>
</html>
