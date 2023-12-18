<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class MerchantRegistered extends Notification
{
    use Queueable;

    protected $merchant;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct($merchant)
    {
        //
        $this->merchant = $merchant;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['mail'];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
        return (new MailMessage)
                    ->subject('تفعيل خدماتنا على متجرك')
                    ->greeting('مرحبًا')
                    ->line('شكرًا لك على تثبيت تطبيق بوب أوتو. أنت الآن أقرب الى تقليل العمل اليدوي في متجرك وأتمتة المهام المملة .')
                    ->line('إليك بيانات الدخول الخاصة بك:')
                    ->line('البريد الالكترونى :'.$this->merchant['merchant_email'])
                    ->line('كلمة المرور : '.$this->merchant['password'])
                    ->line('يرجى الاحتفاظ بهذه البيانات في مكان آمن.')
                    ->action('أضغط هنا للتوجة الى لوحة التحكم', url('/login'))
                    ->line('إذا كانت لديك أي أسئلة أو استفسارات، لا تتردد في الاتصال بنا.')
                    ->line('نتطلع إلى مساعدتك في تحقيق أهدافك لنمو متجرك.')
                    ->line('شكرًا لك مرة أخرى على اختيارك بوب أوتو.')
                    ->line('مع أطيب التحيات، ')
                    ->line('فريق بوب أوتو، جروث شوب')
                    ->line('------------')
                    ->salutation('يمكنك نسخ ولصق الرابط التالي اذا لم يعمل الزر بالأعلى '.url('/login'));
    }

    /**
     * Get the array representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function toArray($notifiable)
    {
        return [
            //
        ];
    }
}
