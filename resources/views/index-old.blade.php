<!DOCTYPE html>
<html lang="en" dir="rtl">
<head>
    <meta charset="UTF-8" />
    <link rel="icon" type="image/svg+xml" href="/popup-fav.png') }}" />
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
    <link rel="stylesheet" href="{{ asset('assets/landing-old/css/index.29054b40.css') }}">
    <!-- Google Tag Manager -->
    <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
    new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
    j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
    'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
    })(window,document,'script','dataLayer','GTM-PRZKZ5H');</script>
    <!-- End Google Tag Manager -->
</head>
<body>

  <header>
    <div class="container mx-auto px-2">
      <nav class="flex justify-between py-2 items-center">
        <div class="logo"><a href="">
            <img src="{{ asset('assets/landing-old/img/popupsnap-logo.891ac042.png') }}" alt=""></a>
        </div>
        <div class="sign">
          <a href="{{ url('register') }}" class="p-2 bg-pb-light rounded text-gray-900 hover:bg-pb-dark hover:text-white">حساب جديد</a>
          <a href="{{ url('login') }}" href="#" class="p-2 bg-pb-light rounded text-gray-900 hover:bg-pb-dark hover:text-white">دخول</a>
        </div>
      </nav>
    </div>
  </header>

  <!-- Start Hero Section -->
  <div id="hero" class="mt-6 py-5 sm:py-20">
    <div class="container mx-auto relative text-center lg:text-right p-2 sm:p-0">
      <div class="grid lg:flex justify-between items-center">
        <div class="text row-start-2">
          <h1 class="text-3xl lg:text-5xl font-medium lg:max-w-2xl">
            لأصحاب المتاجر الرقمية الآن يمكنكم
            <br>
            <strong class="inline-block mt-6 relative z-10 max-w-lg">
              <span class="z-20 inline-block relative text-rotate text-center sm:text-right">
                <ul>
                  <li>رفع معدل التحويلات</li>
                  <li>زيادة مبيعاتك</li>
                  <li>زيادة متابعينك</li>
                  <li>بناء قائمتك البريدية</li>
                  <li>والمزيد..</li>
                </ul>
              </span>
            </strong>
          </h1>

          <div class="leading max-w-3xl text-xl sm:text-3xl mt-12 ">
            زّد من مبيعاتك ومعدل التحويلات والتفاعل مع العملاء باستخدام اشعارات جميلة وبسيطة دون الحاجة الى كتابة أسطر برمجية
          </div>

          <a href="{{ url('/dashboard/add-schedules') }}" class="px-16 font-medium text-xl mt-6 text-gray-900 bg-pb-light hover:bg-pb-dark hover:text-white rounded inline-block clear-both">ابدأ الآن</a>

        </div>
        <div class="image pt-3 relative z-10">
          <img class="mx-auto" src="{{ asset('assets/landing-old/img/hero_components.734437cd.png') }}" alt="">
        </div>
      </div>
      <div class="hero-bg absolute top-0 left-0 z-0 ">
        <img src="{{ asset('assets/landing-old/img/hero_bg.05ef4c06.png') }}" alt="">
      </div>
    </div>
  </div>
  <!-- End Hero Section -->

  <!-- Start Components Section -->
  <div id="components" class="bg-slate-800 py-20">
    <div class="container mx-auto">
      <div class="heading text-center mx-auto max-w-md font-medium relative">
        <div class="subhead relative inline-block">
          <span class="relative z-10 text-2xl">أنواع المكونات</span>
        </div>
        <h2 class="text-2xl lg:text-4xl mt-2">حول زوارك الى عملاء باستخدام المكون المناسب</h2>

        <div id="tabs" class="p-1 absolute left-1 sm:left-10 lg:-left-96 -bottom-20 flex flex-row-reverse space-x-6">
          <a class="w-icon h-icon social" data-tab="tab-social" href="#tab-social"></a>
          <a class="w-icon h-icon videos" data-tab="tab-videos" href="#tab-videos"></a>
          <a class="w-icon h-icon convert" data-tab="tab-convert" href="#tab-convert"></a>
          <a class="w-icon h-icon discounts" data-tab="tab-discounts" href="#tab-discounts"></a>
          <a class="w-icon h-icon newsletter active" data-tab="tab-newsletter" href="#tab-newsletter"></a>
        </div>

      </div>


      <!-- Tabs Container -->
      <div class="tabs-container mt-28 lg:mt-0">

        <div id="tab-newsletter" class="sm:grid-cols-9 sm:gap-6 space-y-3 sm:space-y-0 text-center mt-12 items-center active">
          <div class="sm:col-span-6">
            <img class="mx-auto" src="{{ asset('assets/landing-old/img/tab-newsletter.89a996db.jpg') }}" alt="">
          </div>
          <div class="sm:col-span-3">
            <div class="heading font-medium">
              <div class="subhead relative inline-block">
                <h3 class="relative z-10 text-2xl">بناء القائمة البريدية</h3>
              </div>
            </div>
            <div class="leading-10 text-lg mt-5">
              ابني قائمتك البريدية بسهولة واستهدف عملائك بناءًا على أهتماماتهم
            </div>
            <a href="{{ url('/dashboard/add-schedules') }}" class="px-16 py-2 font-medium text-xl mt-8 text-gray-900 bg-pb-light hover:bg-pb-dark hover:text-white rounded inline-block clear-both">استخدمه الآن</a>
          </div>
        </div>

        <div id="tab-discounts" class="sm:grid-cols-9 sm:gap-6 space-y-3 sm:space-y-0 text-center mt-12 items-center">
          <div class="sm:col-span-6">
            <img class="mx-auto" src="{{ asset('assets/landing-old/img/tab-discounts.b1cedecc.jpg') }}" alt="">
          </div>
          <div class="sm:col-span-3">
            <div class="heading font-medium">
              <div class="subhead relative inline-block">
                <h3 class="relative z-10 text-2xl">إشعارات التخفيضات</h3>
              </div>
            </div>
            <div class="leading-10 text-lg mt-5">
              زّد من مبيعاتك باستخدام كوبونات التخفيضات الذكية
            </div>
            <a href="{{ url('/dashboard/add-schedules') }}" class="px-16 py-2 font-medium text-xl mt-8 text-gray-900 bg-pb-light hover:bg-pb-dark hover:text-white rounded inline-block clear-both">استخدمه الآن</a>
          </div>
        </div>

        <div id="tab-convert" class="sm:grid-cols-9 sm:gap-6 space-y-3 sm:space-y-0 text-center mt-12 items-center">
          <div class="sm:col-span-6">
            <img class="mx-auto" src="{{ asset('assets/landing-old/img/tab-convert.6b6c63bb.jpg') }}" alt="">
          </div>
          <div class="sm:col-span-3">
            <div class="heading font-medium">
              <div class="subhead relative inline-block">
                <h3 class="relative z-10 text-2xl">إشعارات أحدث التحويلات</h3>
              </div>
            </div>
            <div class="leading-10 text-lg mt-5">
              زد من معدل تحويلات المبيعات بإظهار عملاء اشتروا نفس المنتج
            </div>
            <a href="{{ url('/dashboard/add-schedules') }}" class="px-16 py-2 font-medium text-xl mt-8 text-gray-900 bg-pb-light hover:bg-pb-dark hover:text-white rounded inline-block clear-both">استخدمه الآن</a>
          </div>
        </div>

        <div id="tab-videos" class="sm:grid-cols-9 sm:gap-6 space-y-3 sm:space-y-0 text-center mt-12 items-center">
          <div class="sm:col-span-6">
            <img class="mx-auto" src="{{ asset('assets/landing-old/img/tab-videos.742025de.jpg') }}" alt="">
          </div>
          <div class="sm:col-span-3">
            <div class="heading font-medium">
              <div class="subhead relative inline-block">
                <h3 class="relative z-10 text-2xl">فيديوهات المنتجات</h3>
              </div>
            </div>
            <div class="leading-10 text-lg mt-5">
              استعرض منتجاتك بشكل أجمل بأستخدام مقاطع الفيديو وزد مبيعاتك x3
            </div>
            <a href="#" class="px-16 py-2 font-medium text-xl mt-8 text-gray-900 bg-pb-light hover:bg-pb-dark hover:text-white rounded inline-block clear-both">استخدمه الآن</a>
          </div>
        </div>

        <div id="tab-social" class="sm:grid-cols-9 sm:gap-6 space-y-3 sm:space-y-0 text-center mt-12 items-center">
          <div class="sm:col-span-6">
            <img class="mx-auto" src="{{ asset('assets/landing-old/img/components_placeholder.4f2d9f0b.png') }}" alt="">
          </div>
          <div class="sm:col-span-3">
            <div class="heading font-medium">
              <div class="subhead relative inline-block">
                <h3 class="relative z-10 text-2xl">ايقونات الشبكات الاجتماعية</h3>
              </div>
            </div>
            <div class="leading-10 text-lg mt-5">
              وجه عملائك لحساباتك الاجتماعية وزد من متابعيك
            </div>
            <a href="{{ url('/dashboard/add-schedules') }}" class="px-16 py-2 font-medium text-xl mt-8 text-gray-900 bg-pb-light hover:bg-pb-dark hover:text-white rounded inline-block clear-both">استخدمه الآن</a>
          </div>
        </div>

      </div>
      <!-- End Tabs Container -->
    </div>
  </div>
  <!-- End Components Section -->

  <!-- Start Responsive -->
  <div id="responsive" class="py-20">
    <div class="grid sm:grid-cols-9 sm:gap-6 space-y-6 text-center sm:text-right p-2 sm:p-0 mt-12 container mx-auto items-center">
      <div class="col-span-3">
        <div class="heading font-medium">
          <div class="subhead relative inline-block">
            <span class="relative z-10 text-2xl">مكونات متجاوبه</span>
          </div>
          <h2 class="text-xl sm:text-2xl mt-2">استخدم المكون المناسب لحملتك، دون القلق بخصوص التوافق مع حجم الشاشة او أنواع الأجهزة</h2>

          <div class="leading text-lg mt-5">
            لوريم ابسوم دولور سيت اميت لوريم ابسوم دولور سيت اميت لوريم ابسوم دولور سيت اميت لوريم ابسوم دولور سيت اميت لوريم ابسوم دولور سيت اميت لوريم ابسوم دولور سيت اميت لوريم ابسوم دولور
          </div>
          <a href="{{ url('/dashboard/add-schedules') }}" class="px-16 py-2 font-medium text-xl mt-6 text-gray-900 bg-pb-light hover:bg-pb-dark hover:text-white rounded inline-block clear-both">ابدأ الآن</a>
        </div>
      </div>
      <div class="col-span-6">
        <img class="mx-auto" src="{{ asset('assets/landing-old/img/responsive.b1d747a2.jpg') }}" alt="">
      </div>
    </div>
  </div>
  <!-- End Responsive -->

  <!-- Start How -->
  <div id="how" class="sm:block bg-slate-800 py-10 sm:py-20">
    <div class="container mx-auto">
      <div class="heading text-center mx-auto max-w-md font-medium">
        <div class="subhead relative inline-block">
          <span class="relative z-10 text-2xl">كيف يعمل؟</span>
        </div>
      </div>
      <div class="diagram mt-6 py-20 mx-auto max-w-5xl grid grid-cols-1 space-y-16 sm:space-y-0 sm:flex justify-between text-xl smtext-4xl text-bold text-center">
        <div class="">ثبت التطبيق</div>
        <div class="pointers relative">اختر الاشعار المناسب لك</div>
        <div>اطلق حملتك</div>
      </div>
    </div>
  </div>

  <div class="container mx-auto text-center relative">
    <a href="{{ url('/dashboard/add-schedules') }}" class="px-16 py-2 font-medium text-xl relative -top-5 text-gray-900 bg-pb-light hover:bg-pb-dark hover:text-white rounded inline-block">ابدأ الآن</a>
  </div>
  <!-- End How -->

  <!-- Start Blog -->

  <div id="blog" class="py-20">
    <div class="container mx-auto">
      <div class="heading text-center mx-auto font-medium">
        <div class="subhead relative inline-block">
          <span class="relative z-10 text-2xl">من المدونة</span>
        </div>
        <h2 class="text-2xl sm:text-3xl mt-2">تعلم كيف تزيد من مبيعات متجرك بالاشعارات</h2>
      </div>

      <div class="px-3 sm:px-0 space-y-8 sm:space-y-0 grid sm:grid-cols-3 sm:gap-8 mt-12 max-w-5xl mx-auto text-center text-xl font-medium">
        <a class="blog-item block" href="#" title="title">
          <img class="mx-auto rounded-xl" src="{{ asset('assets/landing-old/img/blog.f2ab6280.jpg') }}" alt="">
          <h3 class="px-3 mt-3 block">عنوان الموضوع  عنوان الموضوع</h3>
        </a>
        <a class="blog-item block" href="#" title="title">
          <img class="mx-auto rounded-xl" src="{{ asset('assets/landing-old/img/blog.f2ab6280.jpg') }}" alt="">
          <h3 class="px-3 mt-3 block">عنوان الموضوع  عنوان الموضوع</h3>
        </a>
        <a class="blog-item block" href="#" title="title">
          <img class="mx-auto rounded-xl" src="{{ asset('assets/landing-old/img/blog.f2ab6280.jpg') }}" alt="">
          <h3 class="px-3 mt-3 block">عنوان الموضوع  عنوان الموضوع</h3>
        </a>
      </div>
    </div>
  </div>

  <!-- End Blog -->


  <!-- Start FAQ -->
  <div id="faq" class="py-20 bg-slate-800 pb-32">
    <div class="container mx-auto">
      <div class="heading text-center mx-auto font-medium">
        <div class="subhead relative inline-block">
          <span class="relative z-10 text-2xl">الاسئلة الشائعة</span>
        </div>
        <h2 class="text-2xl sm:text-3xl px-1 mt-2">تعلم كيف تزيد من مبيعات متجرك بالاشعارات</h2>
      </div>

      <div class="grid grid-cols-1 lg:grid-cols-5 sm:gap-8 mt-12  mx-auto text-center text-xl font-medium">
        <div class="col-span-3 text-center">
          <img src="{{ asset('assets/landing-old/img/faq.a6117956.png') }}" alt="">
        </div>
        <div class="col-span-2 mt-4 sm:mt-0 p-2 sm:p-0">

          <div class="accordionWrapper">
            <div class="accordionItem close">
              <div class="accordionItemHeading"><h3>من يجب ان يستخدم Popupsnap؟</h3></div>
              <div class="accordionItemContent">
                <p>
                  اي متجر مبني على منصة زد يسعي الى زيادة مبيعاته والتفاعل مع العملاء بوب اب سناب هي الأداة الأمثل لتحقيق ذلك مع تشيكلة متنوعة من الأشعارات المميزة والأهداف المختلفة
                </p>
                <p>
                  نوفر إشعارات لـ زيادة متابعيك على الشبكات الاجتماعية، زيادة مبيعات متجرك، زيادة وبناء قائمتك البريدية، استعراض المنتجات بشكل جذاب من خلال الفيديوهات
                </p>
              </div>
            </div>

            <div class="accordionItem close">
              <div class="accordionItemHeading"><h3>ما المطلوب لأستخدام Popupsnap؟</h3></div>
              <div class="accordionItemContent">
                <p>
                  اذا لديك متجر على زد فانت جاهز لتفعيل بوب اب سناب كل ما عليك هو تثبيت التطبيق واختيار الباقة المناسبة لك
                </p>
              </div>
            </div>

            <div class="accordionItem close">
              <div class="accordionItemHeading"><h3>هل أحتاج مهارات برمجية لأستخدام Popupsnap؟</h3></div>
              <div class="accordionItemContent">
                <p>
                  بوب اب سناب هي اداة نو كود No-Code اي لا تتطلب اي معرفة تقنية برمجية لأطلاق حملاتك وتفعيل التطبيق
                </p>
              </div>
            </div>

            <div class="accordionItem close">
              <div class="accordionItemHeading"><h3>لماذا يجب أن استخدم Popupsnap بدلاً من تطبيقات آخرى؟</h3></div>
              <div class="accordionItemContent">
                <p>
                  هنالك العديد من التطبيقات على سوق تطبيقات زد تتيح بناء الإشعارات لكن أغلبها بتسعيرة مركبة مرهقة للتجار، كل نوع مُختلف من الاشعار تحتاج ان تفعل له تطبيق منفصل مع باقة منفصلة ترغب في تفعيل ٣ أنواع من الأشعارات ستدفع في المتوسط 105 ريال شهرياً
                </p>
                <p>
                  لكن في بوب اب سناب نوفر لك تشكيلة من الإشعارات المتنوعة تحت باقة واحدة دون حدود أو قيود مع تطويرات مستمرة وتوفير دعم فني متواجد لدعمك في اي وقت باللغة العربية
                </p>
              </div>
            </div>

            <div class="accordionItem close">
              <div class="accordionItemHeading"><h3>كم تكلفة الأشتراك في PopupSnap؟</h3></div>
              <div class="accordionItemContent">
                <p>
                  الأشتراك الشهري 79 ريال، الأشتراك السنوي 799 ريال
                </p>
                <p>
                  دون قيود أو حدود على الزيارات وكل أنواع الإشعارات المتوافرة والتي سنطلقها قريباً بتكون متاحة تحت نفس الباقة
                </p>
              </div>
            </div>

          </div>

        </div>
      </div>
    </div>
  </div>
  <!-- End FAQ -->

  <!-- Start Contact -->

  <div id="contact" class="mx-auto container max-w-4xl bg-white p-6 sm:flex text-center sm:text-right text-gray-900 justify-between items-center rounded-xl relative -top-16">
    <span class="max-w-xl text-xl leading-10 font-medium">
      فريق خبرائنا متاحين هنا لدعمك 24/7 باللغة العربية
      لمساعدتك على تطوير متجرك وزيادة مبيعاتك
    </span>
    <a href="{{ url('/dashboard/add-schedules') }}" class="px-12 lg:px-16 py-2 font-medium text-xl text-gray-900 bg-pb-light hover:bg-pb-dark hover:text-white rounded inline-block clear-both">تحدث معنا</a>
  </div>

  <!-- End Contact -->

  <!-- Start Footer -->

  <footer class="py-5 sm:py-20">
    <div class="container mx-auto px-4 sm:p-0 sm:flex justify-between">
      <div class="heading font-medium">
        <div class="subhead relative inline-block">
          <span class="relative z-10 text-2xl">حلول PopupSnap</span>
        </div>
        <ul class= "columns-2">
          <li><a href="#" title="title">زيادة مبيعاتك </a></li>
          <li><a href="#" title="title">بناء قائمتك البريدية </a></li>
          <li><a href="#" title="title">زيادة تفاعل المستخدمين </a></li>
          <li><a href="#" title="title">استعراض المنتجات بالفيديو </a></li>
          <li><a href="#" title="title">زيادة متابعيك على الشبكات الاجتماعية </a></li>
        </ul>
      </div>

      <div class="heading font-medium">
        <div class="subhead relative inline-block">
          <span class="relative z-10 text-2xl">روابط مهمة</span>
        </div>
        <ul class= "columns-2">
          <li><a href="#" title="title">مركز المساعدة  </a></li>
          <li><a href="#" title="title">تواصل معنا </a></li>
          <li><a href="#" title="title">المدونة </a></li>
          <li><a href="#" title="title">سياسة الخصوصية </a></li>
          <li><a href="#" title="title">الشروط والأحكام </a></li>
        </ul>
      </div>
    </div>
    <div class="container text-left mx-auto mt-3">صنع بكل حب ❤️ في الإمارات العربية المتحدة 🇦🇪</div>
  </footer>

  <!-- End Footer -->


  <div class="modal" id="modal-register">
    <div class="modal-bg modal-exit"></div>
    <div class="modal-container max-w-md mx-auto">
      <h2>التسجيل متاح فقط عبر الدعوات</h2>
      <h3>قم بادخال بريدك الالكتروني وسيتم اخطاركم </h3>
      <form action="" class="pt-3 space-y-4 block overflow-hidden">
        <input type="text" class="w-full p-2 text-sm slate-400 bg-gray-100 rounded-lg shadow shadow shadow-gray-400 outline-0" name="store" value="" placeholder="رابط المتجر على زد">
        <span class="error text-xs text-red-500">تم التسجيل بنجاح</span>
        <input type="email" class="w-full p-2 text-sm slate-400 bg-gray-100 rounded-lg shadow shadow shadow-gray-400 outline-0" name="store" value="" placeholder="البريد الإلكتروني">
        <button type="submit" class="bg-pb-dark hover:bg-pb-light text-white hover:text-slate-800 p-2 px-3 rounded-lg text-sm float-left fill-white hover:fill-slate-800 flex">
          <div class="icon ml-2">
            <svg id="Send" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 16.003 16.003">
              <path id="Send-2" data-name="Send" d="M17.784,2.22a.751.751,0,0,1,.172.794L12.885,17.5a.75.75,0,0,1-1.393.057L8.708,11.3,2.445,8.512A.75.75,0,0,1,2.5,7.118L16.99,2.048a.751.751,0,0,1,.794.172ZM14.4,4.544,4.783,7.909,9.11,9.832Zm-4.228,6.349L15.46,5.6,12.094,15.22Z" transform="translate(-2 -2)" fill-rule="evenodd"/>
            </svg>
          </div>
          احجز مقعدك
        </button>
      </form>
      <div>

      </div>
      <button class="modal-close modal-exit">
        <svg id="X" xmlns="http://www.w3.org/2000/svg" width="12.001" height="12.001" viewBox="0 0 12.001 12.001">
          <path id="X-2" data-name="X" d="M15.781,5.28A.75.75,0,0,0,14.72,4.22L10,8.94,5.28,4.22A.75.75,0,0,0,4.22,5.28L8.94,10,4.22,14.72A.75.75,0,0,0,5.28,15.781L10,11.061l4.72,4.72a.75.75,0,0,0,1.061-1.061L11.061,10Z" transform="translate(-4 -4)" fill-rule="evenodd"/>
        </svg>
      </button>

      <div class="result msg">
        <span class="error text-xs text-green-500">تم التسجيل بنجاح</span>
        <span class="error text-xs text-red-500">تم التسجيل بنجاح</span>
      </div>
    </div>
  </div>


  <div class="modal" id="modal-wait">
    <div class="modal-bg modal-exit"></div>
    <div class="modal-container max-w-md mx-auto">
      <div class="modal-heading flex justify-between">
        <div class="emoj text-6xl flex flex-col w-5/12 text-center">
          🥺<span dir="ltr" class="text-3xl">👉👈</span>
        </div>
        <div>
          <h2 class="text-4xl"> انتظر</h2>
          <h3>هذا مكون اضافي تستكشفه بنفسك الآن 🖖</h3>
        </div>
      </div>
      <form action="" class="pt-3 space-y-4">
        <input type="text" class="w-full p-2 text-sm slate-400 bg-gray-100 rounded-lg shadow shadow shadow-gray-400 outline-0" name="store" value="" placeholder="رابط المتجر على زد">
        <input type="email" class="w-full p-2 text-sm slate-400 bg-gray-100 rounded-lg shadow shadow shadow-gray-400 outline-0" name="store" value="" placeholder="البريد الإلكتروني">
        <button type="submit" class="bg-pb-dark hover:bg-pb-light text-white hover:text-slate-800 p-2 px-3 rounded-lg text-sm float-left fill-white hover:fill-slate-800 flex">
          <div class="icon ml-2">
            <svg id="Send" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 16.003 16.003">
              <path id="Send-2" data-name="Send" d="M17.784,2.22a.751.751,0,0,1,.172.794L12.885,17.5a.75.75,0,0,1-1.393.057L8.708,11.3,2.445,8.512A.75.75,0,0,1,2.5,7.118L16.99,2.048a.751.751,0,0,1,.794.172ZM14.4,4.544,4.783,7.909,9.11,9.832Zm-4.228,6.349L15.46,5.6,12.094,15.22Z" transform="translate(-2 -2)" fill-rule="evenodd"/>
            </svg>
          </div>
          احجز مقعدك
        </button>
      </form>
      <button class="modal-close modal-exit">
        <svg id="X" xmlns="http://www.w3.org/2000/svg" width="12.001" height="12.001" viewBox="0 0 12.001 12.001">
          <path id="X-2" data-name="X" d="M15.781,5.28A.75.75,0,0,0,14.72,4.22L10,8.94,5.28,4.22A.75.75,0,0,0,4.22,5.28L8.94,10,4.22,14.72A.75.75,0,0,0,5.28,15.781L10,11.061l4.72,4.72a.75.75,0,0,0,1.061-1.061L11.061,10Z" transform="translate(-4 -4)" fill-rule="evenodd"/>
        </svg>
      </button>
    </div>
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
  <!-- Google Tag Manager (noscript) -->
    <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-PRZKZ5H"
    height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
    <!-- End Google Tag Manager (noscript) -->
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
    #components #tabs .w-icon:hover:after, #components #tabs .w-icon.active:after {
        background: url('data:image/jpeg;base64,/9j/4QAYRXhpZgAASUkqAAgAAAAAAAAAAAAAAP/sABFEdWNreQABAAQAAAA8AAD/4QMqaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLwA8P3hwYWNrZXQgYmVnaW49Iu+7vyIgaWQ9Ilc1TTBNcENlaGlIenJlU3pOVGN6a2M5ZCI/PiA8eDp4bXBtZXRhIHhtbG5zOng9ImFkb2JlOm5zOm1ldGEvIiB4OnhtcHRrPSJBZG9iZSBYTVAgQ29yZSA1LjUtYzAxNCA3OS4xNTE0ODEsIDIwMTMvMDMvMTMtMTI6MDk6MTUgICAgICAgICI+IDxyZGY6UkRGIHhtbG5zOnJkZj0iaHR0cDovL3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+IDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCBDQyAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6OTM4OTFEODA3MUFDMTFFREE2NEZERTg5MUY2MUNBQjciIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6OTM4OTFEODE3MUFDMTFFREE2NEZERTg5MUY2MUNBQjciPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo5Mzg5MUQ3RTcxQUMxMUVEQTY0RkRFODkxRjYxQ0FCNyIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo5Mzg5MUQ3RjcxQUMxMUVEQTY0RkRFODkxRjYxQ0FCNyIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/Pv/uAA5BZG9iZQBkwAAAAAH/2wCEAAYEBAQFBAYFBQYJBgUGCQsIBgYICwwKCgsKCgwQDAwMDAwMEAwODxAPDgwTExQUExMcGxsbHB8fHx8fHx8fHx8BBwcHDQwNGBAQGBoVERUaHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fH//AABEIAA0APgMBEQACEQEDEQH/xAB7AAEBAQAAAAAAAAAAAAAAAAAHCAYBAQEBAQAAAAAAAAAAAAAAAAMCBAEQAAECAwUFBQYHAQAAAAAAAAECAxEEBQAhEgYHQVETFBYxYSJCFXGhMlJECLFikiM0JSYXEQADAQEAAgMBAAAAAAAAAAAAARECITEDQVFhgf/aAAwDAQACEQMRAD8AR6XlfSjVTTtErQ5RmnLlk4Gy0hKZmTfAu4kL1pV3mCh32Rt5ZETQQZX+27OdQzdM0mrIMhSpBYEzUwIpdQb08vH4yofp27rI/YoSsMoVl3SjJ6JHIK1Sktz6ChEi8AsuxuxPqIIxORuK+3ZYuvpfFwFdYftznaW8us5NYcm6a6scaloBW8wpRhFvatuJ9qfZZMez7I1j6NlpRoPRcoyIzRnUsuVJlHGDLxTy0mkCOJZPhU4N/YNm+073eIrOZ5NHmbKmnesuWzOUqaaVOy5U3K1RlMHWlpuwOoOFRQYdh2Xi3E3lnWkwTyf9t+bZ7Ob9Kr7SpKkU9SVTU8i9L6DelMuraVjtPl232R+xQhYG2r0zR5rMdB0+XR5R+oTDb6WWW0JxS7SZVxRU6seLEtKfDExj4rEnqUvngnPQw59GeZc5PSFPgf2CXipMoZePiEwpIVAfKQCY9ln3J0PNpXWcl566cd6WYk/W1Nn+S6vAgwv4X7cHFR+HHhG+2ZS9FdIVzF1B67Oevcf1rinnOZjxuJHzR93utrQLK80HVqd0swnNrbZkSgGnOvrWJ8N+UOtlBSUw+EqWFbxbPuXguaHH3Oq1PVwjONttZOxQbTIrW4kuR8JmypDZCj5RDD3k2v1z+k7ocaJ/9F6wa6KBL93PB0kShZj9SQDduh4t1r3J0nN+CwK85nU5VeNHl5IZlU0QhDjzhl0OQvKFFoKWflCkpG82zKUV0h//AG3W/wBX1hzn5ua5rF+Puh3W1cn4D2n/2Q==');
    }
    #components #tabs .w-icon {
        background-image: url("{{ asset('assets/landing-old/img/tabs_sprite.7d18c515.jpg') }}");
    }
    #how .pointers:before{
        background: url("{{ asset('assets/landing-old/img/arrow.4e712cf1.png') }}") no-repeat;
    }
    #how .pointers:after{
        background: url("{{ asset('assets/landing-old/img/arrow.4e712cf1.png') }}") no-repeat;
    }
</style>
</body>
</html>
