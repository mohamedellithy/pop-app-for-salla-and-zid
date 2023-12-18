<template>
    <div class="container-body-merchant">
        <div class="row">
            <div class="col-lg-11 profile-image">
                <img :src="iconsProfile" />
                <p>
                    <template>
                        <i class="fas fa-circle" style="color:#00e200;"></i>
                        {{ customer.name }}
                    </template>
                </p>
            </div>
            <p>التفاصيل الحساب</p>
            <div class="col-lg-6 container-form-new-merchant">
                <div class="form-group">
                    <label for="merchant-name">
                        <i class="fas fa-user-edit" style="padding: 5px;"></i>
                        اسم
                    </label>
                    <p v-if="edit_username == false" class="container-value-p">{{ customer.name }} <span @click="edit_username = true" class="btn btn-info btn-sm" style="float: left;color:white"> <i class="fas fa-edit"></i> تعديل</span></p>
                    <form v-if="edit_username == true" method="post" @submit.prevent="SaveEdits">
                        <input class="form-control" type="text" v-model="customer.name" required/>
                        <button style="margin-top:10px;float:left" type="submit" class="btn btn-success btn-sm">حفظ التعديلات</button>
                    </form>
                </div>
                <div class="form-group">
                    <label for="merchant-name">
                        <i class="fas fa-user-edit" style="padding: 5px;"></i>
                        التوقيت الزمني
                    </label>
                    <p v-if="edit_time_zone == false" class="container-value-p">{{ customer.time_zone }} <span @click="edit_time_zone = true" class="btn btn-info btn-sm" style="float: left;color:white"> <i class="fas fa-edit"></i> تعديل</span></p>
                    <form v-if="edit_time_zone == true" method="post" @submit.prevent="SaveEdits">
                        <select class="form-control" v-model="customer.time_zone" required>
                            <option v-for="(time_zone,key) in time_zones" :value="time_zone" :key="key">{{ time_zone }}</option>
                        </select>
                        <button style="margin-top:10px;float:left" type="submit" class="btn btn-success btn-sm">حفظ التعديلات</button>
                    </form>
                </div>
                <div class="form-group">
                    <label for="merchant-name">
                        <i class="fas fa-user-edit" style="padding: 5px;"></i>
                        البريد الالكترونى
                    </label>
                    <p class="container-value-p">{{ customer.email }}</p>
                </div>

                <div class="form-group">
                    <label for="merchant-name">
                        <i class="fas fa-user-edit" style="padding: 5px;"></i>
                        عدد الحملات الفعالة
                    </label>
                    <p class="container-value-p">
                        {{ data.count_campaign_active || 0 }}
                    </p>
                </div>
                <div class="form-group">
                    <label for="merchant-name">
                        <i class="fas fa-user-edit" style="padding: 5px;"></i>
                        عدد الحملات الغير فعالة
                    </label>
                    <p class="container-value-p">
                        {{ data.count_campaign_not_active || 0 }}
                    </p>
                </div>
                <div class="form-group">
                    <label for="merchant-name">
                        <i class="fas fa-user-edit" style="padding: 5px;"></i>
                        عدد الحملات لم تبدأ بعد
                    </label>
                    <p class="container-value-p">
                        {{ data.campaign_not_started || 0 }}
                    </p>
                </div>

            </div>
            <div class="col-lg-6 container-form-new-merchant">
                <div class="form-group" >
                    <form method="post" @submit.prevent="SaveEdits" style="position:relative">
                        <template v-if="edit_password == false">
                            <label for="merchant-name">
                                <i class="fas fa-user-edit" style="padding: 5px;"></i>
                                كلمة المرور
                            </label>
                            <p v-if="edit_password == false" class="container-value-p">*********** <span @click="edit_password = true" class="btn btn-info btn-sm" style="float: left;color:white"> <i class="fas fa-edit"></i> تعديل</span></p>
                        </template>
                        <template v-if="edit_password == true">
                            <template>
                                <i v-if="password_show == false" @click="password_show = !password_show" class="img-show-hide-password fas fa-eye"></i>
                                <i v-if="password_show == true" @click="password_show = !password_show" class="img-show-hide-password fas fa-eye-slash"></i>
                            </template>
                            <template>
                                <label for="merchant-name">
                                    <i class="fas fa-user-edit" style="padding: 5px;"></i>
                                    كلمة المرور
                                </label>
                                <input class="form-control" :type="[password_show == false ? 'password' : 'text']" v-model="customer.password" required/>
                            </template>
                            <template>
                                <label for="merchant-name">
                                    <i class="fas fa-user-edit" style="padding: 5px;"></i>
                                    تأكيد كلمة المرور
                                </label>
                                <input class="form-control" :type="[password_show == false ? 'password' : 'text']" v-model="customer.password_confirmation" required/>
                            </template>
                            <button style="margin-top:10px;float:left" type="submit" class="btn btn-success btn-sm">حفظ التعديلات</button>
                        </template>
                    </form>
                </div>
                <div class="form-group">
                    <label for="merchant-name">
                        <i class="fas fa-user-edit" style="padding: 5px;"></i>
                        رقم الجوال
                    </label>
                    <p class="container-value-p">{{ `201026051966`}}</p>
                </div>
                <div class="form-group">
                    <label for="merchant-name">
                        <i class="fas fa-user-edit" style="padding: 5px;"></i>
                       عدد الحملات
                    </label>
                    <p class="container-value-p">
                        {{ data.campaign_count || 0 }}
                    </p>
                </div>
                <div class="form-group">
                    <label for="merchant-name">
                        <i class="fas fa-user-edit" style="padding: 5px;"></i>
                        عدد الحملات قيد التنفيذ
                    </label>
                    <p class="container-value-p">
                        {{ data.count_campaign_working || 0 }}
                    </p>
                </div>
                <div class="form-group">
                    <label for="merchant-name">
                        <i class="fas fa-user-edit" style="padding: 5px;"></i>
                        عدد الحملات المنتهية
                    </label>
                    <p class="container-value-p">
                        {{ data.count_campaign_ended || 0 }}
                    </p>
                </div>
                <div class="form-group">
                    <label for="merchant-name">
                        <i class="fas fa-user-edit" style="padding: 5px;"></i>
                        المحذوفات
                    </label>
                    <p class="container-value-p">
                       {{ data.count_campaign_trashed || 0 }}
                    </p>
                </div>

            </div>
        </div>
        <alert-response :showsuccess="showsuccess" :showerrors="showerrors"
        @update_success="showsuccess = false"
        @update_errors="showerrors = false"></alert-response>
    </div>
</template>
<script>
import iconsProfile from '../../../../img/Circle-icons-profile.svg.png';
import AlertResponse from './Models/AlertResponse.vue';
export default {
    components:{
        iconsProfile,
        AlertResponse
    },
    data(){
        return{
            data:{},
            customer:{},
            errors:{},
            success:null,
            iconsProfile,
            edit_username:false,
            edit_password:false,
            edit_time_zone:false,
            password_show:false,
            showsuccess:false,
            showerrors:false,
            time_zones:[
                'Europe/Andorra',
                'Asia/Dubai',
                'Asia/Kabul',
                'Europe/Tirane',
                'Asia/Yerevan',
                'Antarctica/Casey',
                'Antarctica/Davis',
                'Antarctica/DumontDUrville', // https://bugs.chromium.org/p/chromium/issues/detail?id=928068
                'Antarctica/Mawson',
                'Antarctica/Palmer',
                'Antarctica/Rothera',
                'Antarctica/Syowa',
                'Antarctica/Troll',
                'Antarctica/Vostok',
                'America/Argentina/Buenos_Aires',
                'America/Argentina/Cordoba',
                'America/Argentina/Salta',
                'America/Argentina/Jujuy',
                'America/Argentina/Tucuman',
                'America/Argentina/Catamarca',
                'America/Argentina/La_Rioja',
                'America/Argentina/San_Juan',
                'America/Argentina/Mendoza',
                'America/Argentina/San_Luis',
                'America/Argentina/Rio_Gallegos',
                'America/Argentina/Ushuaia',
                'Pacific/Pago_Pago',
                'Europe/Vienna',
                'Australia/Lord_Howe',
                'Antarctica/Macquarie',
                'Australia/Hobart',
                'Australia/Currie',
                'Australia/Melbourne',
                'Australia/Sydney',
                'Australia/Broken_Hill',
                'Australia/Brisbane',
                'Australia/Lindeman',
                'Australia/Adelaide',
                'Australia/Darwin',
                'Australia/Perth',
                'Australia/Eucla',
                'Asia/Baku',
                'America/Barbados',
                'Asia/Dhaka',
                'Europe/Brussels',
                'Europe/Sofia',
                'Atlantic/Bermuda',
                'Asia/Brunei',
                'America/La_Paz',
                'America/Noronha',
                'America/Belem',
                'America/Fortaleza',
                'America/Recife',
                'America/Araguaina',
                'America/Maceio',
                'America/Bahia',
                'America/Sao_Paulo',
                'America/Campo_Grande',
                'America/Cuiaba',
                'America/Santarem',
                'America/Porto_Velho',
                'America/Boa_Vista',
                'America/Manaus',
                'America/Eirunepe',
                'America/Rio_Branco',
                'America/Nassau',
                'Asia/Thimphu',
                'Europe/Minsk',
                'America/Belize',
                'America/St_Johns',
                'America/Halifax',
                'America/Glace_Bay',
                'America/Moncton',
                'America/Goose_Bay',
                'America/Blanc-Sablon',
                'America/Toronto',
                'America/Nipigon',
                'America/Thunder_Bay',
                'America/Iqaluit',
                'America/Pangnirtung',
                'America/Atikokan',
                'America/Winnipeg',
                'America/Rainy_River',
                'America/Resolute',
                'America/Rankin_Inlet',
                'America/Regina',
                'America/Swift_Current',
                'America/Edmonton',
                'America/Cambridge_Bay',
                'America/Yellowknife',
                'America/Inuvik',
                'America/Creston',
                'America/Dawson_Creek',
                'America/Fort_Nelson',
                'America/Vancouver',
                'America/Whitehorse',
                'America/Dawson',
                'Indian/Cocos',
                'Europe/Zurich',
                'Africa/Abidjan',
                'Pacific/Rarotonga',
                'America/Santiago',
                'America/Punta_Arenas',
                'Pacific/Easter',
                'Asia/Shanghai',
                'Asia/Urumqi',
                'America/Bogota',
                'America/Costa_Rica',
                'America/Havana',
                'Atlantic/Cape_Verde',
                'America/Curacao',
                'Indian/Christmas',
                'Asia/Nicosia',
                'Asia/Famagusta',
                'Europe/Prague',
                'Europe/Berlin',
                'Europe/Copenhagen',
                'America/Santo_Domingo',
                'Africa/Algiers',
                'America/Guayaquil',
                'Pacific/Galapagos',
                'Europe/Tallinn',
                'Africa/Cairo',
                'Africa/El_Aaiun',
                'Europe/Madrid',
                'Africa/Ceuta',
                'Atlantic/Canary',
                'Europe/Helsinki',
                'Pacific/Fiji',
                'Atlantic/Stanley',
                'Pacific/Chuuk',
                'Pacific/Pohnpei',
                'Pacific/Kosrae',
                'Atlantic/Faroe',
                'Europe/Paris',
                'Europe/London',
                'Asia/Tbilisi',
                'America/Cayenne',
                'Africa/Accra',
                'Europe/Gibraltar',
                'America/Godthab',
                'America/Danmarkshavn',
                'America/Scoresbysund',
                'America/Thule',
                'Europe/Athens',
                'Atlantic/South_Georgia',
                'America/Guatemala',
                'Pacific/Guam',
                'Africa/Bissau',
                'America/Guyana',
                'Asia/Hong_Kong',
                'America/Tegucigalpa',
                'America/Port-au-Prince',
                'Europe/Budapest',
                'Asia/Jakarta',
                'Asia/Pontianak',
                'Asia/Makassar',
                'Asia/Jayapura',
                'Europe/Dublin',
                'Asia/Jerusalem',
                'Asia/Kolkata',
                'Indian/Chagos',
                'Asia/Baghdad',
                'Asia/Tehran',
                'Atlantic/Reykjavik',
                'Europe/Rome',
                'America/Jamaica',
                'Asia/Amman',
                'Asia/Tokyo',
                'Africa/Nairobi',
                'Asia/Bishkek',
                'Pacific/Tarawa',
                'Pacific/Enderbury',
                'Pacific/Kiritimati',
                'Asia/Pyongyang',
                'Asia/Seoul',
                'Asia/Almaty',
                'Asia/Qyzylorda',
                'Asia/Qostanay', // https://bugs.chromium.org/p/chromium/issues/detail?id=928068
                'Asia/Aqtobe',
                'Asia/Aqtau',
                'Asia/Atyrau',
                'Asia/Oral',
                'Asia/Beirut',
                'Asia/Colombo',
                'Africa/Monrovia',
                'Europe/Vilnius',
                'Europe/Luxembourg',
                'Europe/Riga',
                'Africa/Tripoli',
                'Africa/Casablanca',
                'Europe/Monaco',
                'Europe/Chisinau',
                'Pacific/Majuro',
                'Pacific/Kwajalein',
                'Asia/Yangon',
                'Asia/Ulaanbaatar',
                'Asia/Hovd',
                'Asia/Choibalsan',
                'Asia/Macau',
                'America/Martinique',
                'Europe/Malta',
                'Indian/Mauritius',
                'Indian/Maldives',
                'America/Mexico_City',
                'America/Cancun',
                'America/Merida',
                'America/Monterrey',
                'America/Matamoros',
                'America/Mazatlan',
                'America/Chihuahua',
                'America/Ojinaga',
                'America/Hermosillo',
                'America/Tijuana',
                'America/Bahia_Banderas',
                'Asia/Kuala_Lumpur',
                'Asia/Kuching',
                'Africa/Maputo',
                'Africa/Windhoek',
                'Pacific/Noumea',
                'Pacific/Norfolk',
                'Africa/Lagos',
                'America/Managua',
                'Europe/Amsterdam',
                'Europe/Oslo',
                'Asia/Kathmandu',
                'Pacific/Nauru',
                'Pacific/Niue',
                'Pacific/Auckland',
                'Pacific/Chatham',
                'America/Panama',
                'America/Lima',
                'Pacific/Tahiti',
                'Pacific/Marquesas',
                'Pacific/Gambier',
                'Pacific/Port_Moresby',
                'Pacific/Bougainville',
                'Asia/Manila',
                'Asia/Karachi',
                'Europe/Warsaw',
                'America/Miquelon',
                'Pacific/Pitcairn',
                'America/Puerto_Rico',
                'Asia/Gaza',
                'Asia/Hebron',
                'Europe/Lisbon',
                'Atlantic/Madeira',
                'Atlantic/Azores',
                'Pacific/Palau',
                'America/Asuncion',
                'Asia/Qatar',
                'Indian/Reunion',
                'Europe/Bucharest',
                'Europe/Belgrade',
                'Europe/Kaliningrad',
                'Europe/Moscow',
                'Europe/Simferopol',
                'Europe/Kirov',
                'Europe/Astrakhan',
                'Europe/Volgograd',
                'Europe/Saratov',
                'Europe/Ulyanovsk',
                'Europe/Samara',
                'Asia/Yekaterinburg',
                'Asia/Omsk',
                'Asia/Novosibirsk',
                'Asia/Barnaul',
                'Asia/Tomsk',
                'Asia/Novokuznetsk',
                'Asia/Krasnoyarsk',
                'Asia/Irkutsk',
                'Asia/Chita',
                'Asia/Yakutsk',
                'Asia/Khandyga',
                'Asia/Vladivostok',
                'Asia/Ust-Nera',
                'Asia/Magadan',
                'Asia/Sakhalin',
                'Asia/Srednekolymsk',
                'Asia/Kamchatka',
                'Asia/Anadyr',
                'Asia/Riyadh',
                'Pacific/Guadalcanal',
                'Indian/Mahe',
                'Africa/Khartoum',
                'Europe/Stockholm',
                'Asia/Singapore',
                'America/Paramaribo',
                'Africa/Juba',
                'Africa/Sao_Tome',
                'America/El_Salvador',
                'Asia/Damascus',
                'America/Grand_Turk',
                'Africa/Ndjamena',
                'Indian/Kerguelen',
                'Asia/Bangkok',
                'Asia/Dushanbe',
                'Pacific/Fakaofo',
                'Asia/Dili',
                'Asia/Ashgabat',
                'Africa/Tunis',
                'Pacific/Tongatapu',
                'Europe/Istanbul',
                'America/Port_of_Spain',
                'Pacific/Funafuti',
                'Asia/Taipei',
                'Europe/Kiev',
                'Europe/Uzhgorod',
                'Europe/Zaporozhye',
                'Pacific/Wake',
                'America/New_York',
                'America/Detroit',
                'America/Kentucky/Louisville',
                'America/Kentucky/Monticello',
                'America/Indiana/Indianapolis',
                'America/Indiana/Vincennes',
                'America/Indiana/Winamac',
                'America/Indiana/Marengo',
                'America/Indiana/Petersburg',
                'America/Indiana/Vevay',
                'America/Chicago',
                'America/Indiana/Tell_City',
                'America/Indiana/Knox',
                'America/Menominee',
                'America/North_Dakota/Center',
                'America/North_Dakota/New_Salem',
                'America/North_Dakota/Beulah',
                'America/Denver',
                'America/Boise',
                'America/Phoenix',
                'America/Los_Angeles',
                'America/Anchorage',
                'America/Juneau',
                'America/Sitka',
                'America/Metlakatla',
                'America/Yakutat',
                'America/Nome',
                'America/Adak',
                'Pacific/Honolulu',
                'America/Montevideo',
                'Asia/Samarkand',
                'Asia/Tashkent',
                'America/Caracas',
                'Asia/Ho_Chi_Minh',
                'Pacific/Efate',
                'Pacific/Wallis',
                'Pacific/Apia',
                'Africa/Johannesburg'
            ]
        }
    },
    methods:{
        FetchMarketer:function(){
            let self = this;
            axios.get('/api/info-me').then(function({data}) {
                self.data     = data;
                self.errors   = {};
                self.customer = data.user;
            }).catch(function({response}) {
                self.errors = response.data;
            })
        },
        SaveEdits:function(){
            let self = this;
            // this.showsuccess = false;
            // this.showerrors  = false;
            axios.post('/api/info-me-update',this.customer).then(function({data}) {
                self.data     = data;
                self.customer = data.user;
                self.showsuccess = true;
                self.edit_username = false;
                self.edit_password = false;
                self.edit_time_zone = false;
            }).catch(function({response}) {
                self.showerrors  = true;
            })
        },
    },
    created(){
        this.FetchMarketer();
    }
}
</script>

<style scoped>
.container-body-merchant{
    padding: 4%;
}
.title-merchant{
    line-height:2.5em;
    color: #795548;
}
.container-form-new-merchant{
    padding: 0% 0% 0% 5%;
    z-index: 1000;
}
.container-form-new-merchant .form-group label
{
    line-height: 3em;
    font-size: 15px;
    color: gray;
    font-weight: bold;
}
.container-submit-btn-merchant{
    text-align: left;
}
.merchant-event-name{
    padding: 10px 23px;
    background-color: #cff0d0;
    font-weight: bold;
    position: relative;
    border: 1px solid #eee;
}
.change-event{
    position: absolute;
    left: 0;
    top: 0;
    padding: 10px;
    background-color: white;
    box-shadow: 0px 9px 15px 8px #d0d0d0;
    cursor: pointer;
}
.container-errors{
    padding: 20px 30px 0px 26px;
}
.container-errors .alert
{
    border-radius: 0px;
    box-shadow: 0px 0px 0px 0px #eee;
    border: none;
}

.container-submit-btn-merchant  button{
    margin: 5px;
}
.container-form-new-merchant .form-group{
    padding: 0px;
}
.container-form-new-merchant input[type='text'],
.container-form-new-merchant input[type='tel'],
.container-form-new-merchant input[type='email'],
.container-form-new-merchant input[type='password'],
.container-form-new-merchant select
{
    border:1px solid #eee;
    background-color: white;
    /* box-shadow: 0px 10px 23px 5px #eee; */
    border-radius: 0px;
    height: 46px;
}
.container-value-p{
    padding: 5px 30px;
    background-color: #21222d;
    color: white;
    line-height: 2.5em;
}
.show-products-merchants{
    float: left;
}
.container-body-merchant .profile-image img{
    width: 100px;
}
.container-body-merchant .profile-image
{
    text-align: center;
    padding: 10px;
}
.container-body-merchant .profile-image p
{
    padding: 11px 0px;
    margin-bottom: 0px;
    color: white;
}

.img-show-hide-password{
    position: absolute;
    top: 10%;
    left: 15px;
}
</style>
