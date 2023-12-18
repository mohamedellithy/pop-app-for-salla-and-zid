<!DOCTYPE html>
<html lang="en" dir="rtl">
<head>
  <meta charset="UTF-8" />
  <link rel="icon" type="image/svg+xml" href="/popup-fav.png" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="icon" href="{{ asset('assets/landing/img/favicon/favicon.ico') }}" type="image/x-icon">
  <link rel="icon" sizes="16x16" href="{{ asset('assets/landing/img/favicon/favicon-16x16.png') }}" type="image/x-icon">
  <link rel="icon" sizes="32x32" href="{{ asset('assets/landing/img/favicon/favicon-32x32.png') }}" type="image/x-icon">
  <link rel="shortcut icon" href="{{ asset('assets/landing/img/favicon/favicon.ico') }}" type="image/x-icon">
  <link rel="apple-touch-icon" href="{{ asset('assets/landing/img/favicon/apple-touch-icon.png') }}">
  <link rel="icon" sizes="192x192" href="{{ asset('assets/landing/img/favicon/android-chrome-192x192.png') }}">
  <link rel="icon" sizes="512x512" href="{{ asset('assets/landing/img/favicon/android-chrome-512x512.png') }}">
  <link rel="manifest" href="{{ asset('assets/landing/img/favicon/manifest.json') }}">
  <meta name="msapplication-TileImage" content="tile-image.png">
  <meta name="theme-color" content="#111827">
  <title>بوب أوتو | PopAutomate</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Alexandria:wght@300;400;500;700&display=swap" rel="stylesheet">
  {{-- <link rel="stylesheet" href="{{  asset('assets/landing/css/bootstrap.min.css') }}"> --}}
  <link rel="stylesheet" href="{{  asset('assets/landing/css/custom.css') }}">
  <link rel="stylesheet" href="{{  asset('assets/landing/css/style.css') }}">
</head>
<body>
<div class='container'>
    <header>
        <div class="container mx-auto px-2">
        <nav class="flex justify-between py-2 items-center">
            <div class="logo">
                <a href="{{ url('/') }}">
                    <img src="{{ asset('assets/landing/img/lOGOfINAL.png') }}" alt="">
                </a>
            </div>
            <div class="sign">
                <a href="{{ url('register') }}" class="p-2 bg-pb-light rounded text-gray-900 hover:bg-pb-dark hover:text-white">حساب جديد</a>
                <a href="{{ url('/login') }}" class="p-2 bg-pb-light rounded text-gray-900 hover:bg-pb-dark hover:text-white">
                    تسجيل الدخول
                </a>
            </div>
        </nav>
        </div>
    </header>
    <div class="container-content">
        <h1>
            سياسة الخصوصية
        </h1>
        <p>
            نحن في تطبيق بوب أوتو نقدر خصوصيتك ونلتزم بحماية المعلومات الشخصية التي تشاركها معنا. توضح سياسة الخصوصية هذه كيف نجمع ونستخدم ونحمي معلوماتك الشخصية.
        </p>
        <h2>
            جمع المعلومات
        </h2>
        <p> 1 -
            قد نجمع معلومات شخصية عنك مثل الاسم والبريد الإلكتروني ورقم الهاتف عند تسجيلك في التطبيق. كما نجمع معلومات غير شخصية مثل نوع الجهاز ونظام التشغيل وعنوان IP.
        </p>
        <h2>
            استخدام المعلومات
        </h2>
        <p>  2 -
            نستخدم معلوماتك الشخصية لتوفير الخدمات وتحسين تجربة المستخدم في التطبيق. قد نستخدم معلوماتك أيضًا لإرسال إشعارات وتحديثات حول التطبيق والترويج للعروض والمنتجات ذات الصلة.
        </p>
        <h2>
            مشاركة المعلومات
        </h2>
        <p>
            3 -
            نحن لا نبيع أو نشارك معلوماتك الشخصية مع أطراف ثالثة لأغراض تسويقية بدون موافقتك المسبقة. قد نشارك معلوماتك مع مقدمي الخدمات لدينا لتنفيذ مهام نيابة عنا.
        </p>
        <h2>
            حماية المعلومات
        </h2>
        <p>
            4 -
            نتخذ التدابير الأمنية المناسبة لحماية معلوماتك الشخصية من الوصول غير المصرح به والفقدان والتعديل والإفصاح. يجب أن تكون مسؤولًا عن الحفاظ على سرية كلمة المرور الخاصة بك.
        </p>
        <h2>
            ملفات تعريف الارتباط (الكوكيز)
        </h2>
        <p>
            5 -
            يمكن أن يستخدم التطبيق ملفات تعريف الارتباط لتحسين تجربة المستخدم وتوفير ميزات مخصصة. يمكنك تعطيل ملفات تعريف الارتباط من إعدادات جهازك، ولكن قد ي
        </p>
    </div>
    <br/><br/>
    <!-- Start Footer -->
    <footer class="py-5 ">
      <div class="container mx-auto px-4 sm:p-0 sm:flex justify-between">
        <div class="heading font-medium">
          <div class="subhead relative inline-block">
            <span class="relative z-10 text-2xl">حلول بوب أوتو</span>
          </div>
          <ul class= "columns-2">
            <li><a href="#" title="title">جدول حذف المنتجات فى زد</a></li>
            <li><a href="#" title="title">جدول تغير سعر المنتجات فى زد</a></li>
            <li><a href="#" title="title">جدول التخفيضات فى زد</a></li>
            <li><a href="#" title="title">جدول نشر المنتجات فى زد</a></li>
            <li><a href="#" title="title">جدول اضافة التاجات فى زد</a></li>
          </ul>
        </div>

        <div class="heading font-medium">
          <div class="subhead relative inline-block">
            <span class="relative z-10 text-2xl">روابط مهمة</span>
          </div>
          <ul class= "columns-2">
            <li><a href="https://popautomate.com#faq" title="title">مركز المساعدة  </a></li>
            <li><a onclick="$crisp.push(['do', 'chat:open']);" style="cursor: pointer" title="title">تواصل معنا </a></li>
            <li><a href="https://popautomate.com/blog" title="title">المدونة </a></li>
            <li><a href="{{ url('privacy-policy') }}" title="title">سياسة الخصوصية </a></li>
            <li><a href="{{ url('terms-conditions') }}" title="title">الشروط والأحكام </a></li>
          </ul>
        </div>
      </div>
      <div class="container text-left mx-auto mt-3">صنع بكل حب ❤️ في الإمارات العربية المتحدة 🇦🇪</div>
    </footer>
    <!-- End Footer -->
</div>


  <script>
    function Tabs() {
      var bindAll = function() {
        var menuElements = document.querySelectorAll('[data-tab]');
        for(var i = 0; i < menuElements.length ; i++) {
          menuElements[i].addEventListener('click', change, false);
        }
      }

      var clear = function() {
        var menuElements = document.querySelectorAll('[data-tab]');
        for(var i = 0; i < menuElements.length ; i++) {
          menuElements[i].classList.remove('active');
          var id = menuElements[i].getAttribute('data-tab');
          document.getElementById(id).classList.remove('active');
        }
      }

      var change = function(e) {
        clear();
        e.target.classList.add('active');
        var id = e.currentTarget.getAttribute('data-tab');
        document.getElementById(id).classList.add('active');
        event.preventDefault();
      }

      bindAll();
    }

    var connectTabs = new Tabs();

    var accItem = document.getElementsByClassName('accordionItem');
    var accHD = document.getElementsByClassName('accordionItemHeading');
    for (i = 0; i < accHD.length; i++) {
      accHD[i].addEventListener('click', toggleItem, false);
    }
    function toggleItem() {
      var itemClass = this.parentNode.className;
      for (i = 0; i < accItem.length; i++) {
        accItem[i].className = 'accordionItem close';
      }
      if (itemClass == 'accordionItem close') {
        this.parentNode.className = 'accordionItem open';
      }
    }

    const modals = document.querySelectorAll('[data-modal]');

    modals.forEach(function (trigger) {
      trigger.addEventListener('click', function (event) {
        event.preventDefault();
        const modal = document.getElementById(trigger.dataset.modal);
        modal.classList.add('open');
        const exits = modal.querySelectorAll('.modal-exit');
        exits.forEach(function (exit) {
          exit.addEventListener('click', function (event) {
            event.preventDefault();
            modal.classList.remove('open');
          });
        });
      });
    });

    // document.addEventListener('mouseout', e => {
    //   if (!e.toElement && !e.relatedTarget) {
    //     document.querySelector('#modal-register').classList.add('open');
    //   }
    // });
    //
    const mouseEvent = e => {
      if (!e.toElement && !e.relatedTarget) {
        document.removeEventListener('mouseout', mouseEvent);

        document.querySelector('#modal-wait').classList.add('open');
      }
    };

    document.addEventListener('mouseout', mouseEvent);

    const exitso = document.querySelector('#modal-wait').querySelectorAll('.modal-close');
    exitso.forEach(function (exit) {
      exit.addEventListener('click', function (event) {
        event.preventDefault();
        document.querySelector('#modal-wait').classList.remove('open');
      });
    });
  </script>
  <script type="text/javascript">window.$crisp=[];window.CRISP_WEBSITE_ID="3923844f-984b-4390-addf-645595338dbf";(function(){d=document;s=d.createElement("script");s.src="https://client.crisp.chat/l.js";s.async=1;d.getElementsByTagName("head")[0].appendChild(s);})();</script>
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
<style>
    #how .pointers:before ,
    #how .pointers:after {
        background : url({{ asset('assets/landing/img/arrow.4e712cf1.png')}}) no-repeat;
    }
    .container-content {
        padding: 3% 8% 0% 35%;
    }
    .container-content p
    {
        padding:0px;
        line-height: 2em;
        text-align: justify;
    }
    .container-content h1{
        font-size: 23px;
        margin-bottom: 35px;
        font-weight: bold;
    }
    .container-content h1::after{
        content: "";
        width: 218px;
        height: 13px;
        display: flex;
        background-color: #115f52;
        margin-top: -10px;
    }
    .container-content h2
    {
        padding: 3px 0px;
        font-weight: bold;
        color: #aef1e7;
        margin-top: 16px;
        font-size: 16px;
    }
    @media(max-width:1000px){
        .container-content {
            padding: 3% 8% 0% 5%;
        }
    }

</style>
</body>
</html>
