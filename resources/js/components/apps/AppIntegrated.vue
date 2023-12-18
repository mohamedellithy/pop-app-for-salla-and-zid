<template>
    <div class="container-fluid">
        <section class="row" :style="`backgroundImage: url(${require('../../img/pattern.png')});min-height:755px;background-color: rgb(28 65 158);`">
            <div class="col-lg-7 text-center container-alert-integrated">
                <h2 class="title-login" style="">
                    تم تفعيل التطبيق بنجاح على منصة 
                    <strong> {{ app_name }}</strong>
                </h2>
                <div class="row">
                    <div class="col-md-4">
                        <div class="frame">
                            <img class="img-responsive" :src="require('../../img/lOGOfINAL.png')" />
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="frame">
                            <label class="container-instapp">
                                <img class="img-responsive conncetionapp" :src="require('../../img/icons/installapp.svg')" />
                            </label>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="frame">
                            <img v-if="!$route.query.service || $route.query.service == 'zid'" class="img-responsive" :src="require('../../img/Zidlogo.svg')" />
                            <img v-else-if="$route.query.service == 'salla'" class="img-responsive" :src="require('../../img/Sallalogo.png')" />
                        </div>
                    </div>
                </div>
                <br/>
                <div class="description-login">
                    تم تثبيت التطبيق بنجاح يمكنك الآن البدأ في استخدام بوب اوتو وإنشاء الحملات والجداول المُختلفة
                </div>
                <br/>
                <router-link tag="a" class="btn manageapp" :to="{name:'show-schedules'}" exact>
                    <img :src="require('../../img/icons/manageapp.svg')" />
                   ابدأ فى ادارة تطبيقك الان
                </router-link>

                <!-- <h2 class="title-login" style="">تم تفعيل التطبيق بنجاح على منصة زد</h2>
                <img class="img-zid" :src="require('../../img/zid.png')" />
                <div class="description-login">
                    كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص
                </div>
                <br/>
                <div class="alert alert-warning"> يمكنك ادارة تطبيقك من خلال لوحة تحكم متكاملة</div>
                <router-link tag="a" class="btn btn-success" :to="{name:'show-schedules'}" exact>
                   ابدأ فى ادارة تطبيقك الان
                </router-link> -->
            </div>
        </section>
    </div>
</template>
<script>
export default {
    data() {
        return {
            app_name:'زد',
        }
    },
    async created(){
        this.app_name = (this.$route.query.service == 'salla' ? 'سلة' : 'زد');
        console.log(this.$route.query.token);
        this.auth.setAuthToken(this.$route.query.token);
    }
}
</script>
<style scoped>
.container-alert-integrated{
    margin: auto;
    background: #1D2737;
    padding: 3% 6%;
    border-radius: 10px;
}
.container-alert-integrated .title-login
{
    line-height: 2em;
    color: white;
    padding: 0px 0px 27px 0px;
}
.container-alert-integrated .img-zid
{
   width:20%;
}
.frame{
    width:100%;
}
.frame img{
    width:100%;
}
.frame .container-instapp{
    background: white;
    padding: 20px;
    border-radius: 60px;
}
.description-login{
    color: white;
    padding: 10px;
    border-radius: 10px;
    background: rgba(33, 34, 45, 0.72);
    width: 95%;
    font-size: 17px;
    text-align: right;
    margin: auto;
}
.manageapp{
    background: #A9DFD8;
    border-radius: 20px;
    font-weight: bold;
}
@media(max-width:1000px){
    section{
        padding: 12%;
    }
    .container-alert-integrated .title-login{
        font-size:20px;
    }
    .frame img{
        width: 70%;
    }
    .frame{
        padding: 12px;
    }
    .conncetionapp{
        width:100% !important;
    }
    .description-login{
        font-size: 15px;
    }
    .container-alert-integrated{
        padding: 9% 6%;
    }
}

</style>
