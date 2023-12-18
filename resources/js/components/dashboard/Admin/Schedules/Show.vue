<template>
    <div class="col-12">
        <div class="row container-top-content">
            <small class="small-descrip">اسم الحملة</small>
            <h4 class="title-camp"> {{ campaign.name }}</h4>
        </div>
        <div class="row container-top-content">
            <div class="col-md-12" style="text-align: left;">
                <button @click="OpenCampLogs" class="btn btn-danger btn-sm">عرض نتائج الحملة</button>
            </div>
        </div>
        <div class="row container-camp" style="background-color: rgb(32 39 49);margin-top:1%;">
            <div class="col-md-3 top-alert-info">
                <small class="small-descrip">حالة الحملة</small>
                <p>
                    <template v-if="campaign.status == 0">
                        <i class="fas fa-circle icon-status-camp draft-camp"></i>
                        مسودة
                    </template>
                    <template v-else-if="campaign.status == 1">
                        <i class="fas fa-circle icon-status-camp active-camp"></i>
                        نشطة
                    </template>
                </p>
            </div>
            <div class="col-md-3 top-alert-info">
                <small class="small-descrip">تقدم الحملة</small>
                <p>
                    <template v-if="campaign.progress == 0">
                        <i class="fas fa-circle icon-status-camp draft-camp"></i>
                        انتظار
                    </template>
                    <template v-else-if="campaign.progress == 1">
                        <i class="fas fa-circle icon-status-camp active-camp"></i>
                        جاري التنفيذ
                    </template>
                    <template v-else-if="campaign.progress == 2">
                        <i class="fas fa-circle icon-status-camp complete-camp"></i>
                        مكتملة
                    </template>
                </p>
            </div>
            <div class="col-md-3 top-alert-info">
                <small class="small-descrip">تاريخ انشاء الحملة</small>
                <p>
                    {{ campaign.created_at }}
                </p>
            </div>
            <div  class="col-md-3 top-alert-info">
                <small class="small-descrip">توفر الحملة</small>
                <p v-if="campaign.deleted_at">
                    محذوفة
                </p>
                <p v-else>
                    متاحة
                </p>
            </div>
        </div>
        <div class="row container-camp">
            <div class="col-md-6 container-form-new-schedule">
                <div class="section-detilas">
                    <small class="small-descrip">مهمة الحملة</small>
                    <p class="description-camp"> {{ events[campaign.action] }}</p>
                </div>
                <div class="section-detilas">
                    <small class="small-descrip">اسم التاجر</small>
                    <p class="description-camp"> {{ campaign.merchant.name }}</p>
                </div>
                <div class="section-detilas">
                    <small class="small-descrip">بريد الكترونى للمتجر</small>
                    <p class="description-camp"> {{ campaign.merchant.zid_config.merchant_email || '-' }}</p>
                </div>
                <div class="section-detilas">
                    <small class="small-descrip">رقم جوال المتجر</small>
                    <p class="description-camp"> {{ campaign.merchant.zid_config.merchant_phone || '-' }}</p>
                </div>
                <div class="section-detilas">
                    <small class="small-descrip">رابط المتجر</small>
                    <p class="description-camp">
                        <a class="store-link" :href="campaign.merchant.zid_config.store_url" target="_blank">
                            <i class="fas fa-store"></i>
                            {{ campaign.merchant.zid_config.store_url }}
                        </a>
                    </p>
                </div>
                <div class="section-detilas">
                    <small class="small-descrip">وصف الحملة</small>
                    <p class="description-camp"> {{ campaign.description || 'لا يوجد  وصف للحملة' }}</p>
                </div>
            </div>
            <div class="col-md-6 container-form-new-schedule">
                <div class="row">
                    <div class="col-md-6 section-detilas">
                        <small class="small-descrip">حالة التكرار</small>
                        <p class="description-camp"> {{ repeates[campaign.repeate] }}</p>
                    </div>
                    <div class="col-md-6 section-detilas">
                        <small class="small-descrip">عدد مرات التكرار</small>
                        <p class="description-camp"> 
                            {{ campaign.count_repeate }} مرات /  {{ unit_repeate[campaign.unit_repeate] }}
                        </p>
                    </div>
                    <div class="col-md-6 section-detilas">
                        <small class="small-descrip">مواعيد تنفيذ الحملة</small>
                        
                        <div class="container-repeate-on">
                            <ul>
                                <template v-if="campaign.repeate == 'monthly' || campaign.repeate == 'annually'">
                                    <li v-for="(day,key) in campaign.reapete_on" :key="key" style="color:white">
                                        <label v-if="day == 1 || day == 2">{{ `${day}st` }}</label>
                                        <label v-else>{{ `${day}th` }}</label>
                                    </li>
                                </template>
                                <template v-if="campaign.repeate == 'weekly' || campaign.repeate == 'weekends' || campaign.repeate == 'custom'">
                                    <li v-for="(day,key) in campaign.reapete_on" :key="key" style="color:white">
                                       <label>{{ day }}</label>
                                    </li>
                                </template>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-6 section-detilas">
                        <small class="small-descrip">توقيت تنفيذ الحملة</small>
                        <p class="description-camp"> 
                            {{ campaign.repeate_at_time }}
                        </p>
                    </div>
                    <div class="col-md-6 section-detilas">
                        <small class="small-descrip">توقيت الزمنى الخاص بالحملة</small>
                        <p class="description-camp"> 
                            {{ campaign.merchant.time_zone }}
                        </p>
                    </div>
                    <div class="col-md-6 section-detilas">
                        <small class="small-descrip">تاريخ انتهاء الحملة</small>
                        <p class="description-camp"> 
                            <template v-if="campaign.end_at"> 
                                {{ campaign.end_at }}
                            </template>
                            <template v-else-if="campaign.type_repeate == 0">
                                غير منتهى
                            </template>
                            <template v-else-if="campaign.type_repeate == 1">
                                وفقا لعدد مرات التكرار
                            </template>
                        </p>
                    </div>
                    
                    <div class="col-md-6 section-detilas">
                        <small class="small-descrip">تاريخ تحديث الحملة</small>
                        <p class="description-camp"> 
                            {{ campaign.updated_at }}
                        </p>
                    </div>
                    <div v-if="campaign.deleted_at" class="col-md-6 section-detilas">
                        <small class="small-descrip">تاريخ حذف الحملة</small>
                        <p class="description-camp"> 
                            {{ campaign.deleted_at }}
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <camp-logs :show-camp-logs="ShowCampLogs" :logs="campaign.logs" @modelshow="closeModel"></camp-logs>
    </div>
</template>
<script>
import CampLogs from './Models/CampaignLogs.vue';
export default{
    components:{
        CampLogs
    },
    data(){
        return{
            ShowCampLogs:false,
            logs:[],
            campaign:{},
            events:{
                0 : 'نشر المنتجات',
                1 : 'الغاء نشر المنتجات',
                2 : 'تخفيضات على المنتجات',
                3 : 'تغير فى سعر المنتج',
                4 : 'اضافة التصنيفات الخاصة بالمنتح',
                5 : 'حذف التصنيفات الخاصة بالمنتج',
                6 : 'انهاء تخفيضات على المنتجات'
            },
            repeates:{
                0        : "بدون تكرار",
                daily    : "يوميا",
                weekly   : "اسبوعيا كل خميس",
                monthly  : "شهريا ",
                annually : "سنويا كل مطلع شهر يناير",
                weekends : "كل ايام العطلات من الجمعة حتى الاثنين",
                custom   : "تكرار مخصص",
            },
            unit_repeate:{
                0:'يوميا',
                1:'اسبوعيا',
                2:'شهريا',
                3:'سنويا',
            }
        }
    },
    methods:{
        OpenCampLogs:function(campaign){
             this.selectedCamp = campaign;
             this.ShowCampLogs = true;
        },
        closeModel:function(campaign){
            this.selectedCamp = campaign;
            this.ShowCampLogs = false;
        }
    },
    async created(){
        let self = this;
        console.log(this.$route.params.camp_id);
        await axios.get('/api/admin/campaign/'+this.$route.params.camp_id).then(function({data}) {
            self.campaign = data.campaign;
            console.log(self.campaign);
        }).catch(function({response}) {
            console.log(response);
            self.errors = response.data;
        });
    }
}
</script>

<style scoped>
.row{
    margin: 0px;
}
.show-alert-messaage{
    height:auto;
    /*background-color: antiquewhite;*/
    padding:20px;
    text-align:center;
    margin:auto;
    margin-top:5%;
}

.schedule-img{
    width: 70%;
    /* height: 220px;
    border-radius: 60%; */
}
.frame-btn-schedule{
    padding: 30px;
}
.frame-btn-schedule .btn{
    border-radius: 26px;
    background: #a9dfd8;
    font-weight: bold;
    font-size: 15px;
    padding: 10px 23px;
}
p.description-schedule-empty{
    padding: 6% 15%;
}
.container-card{
    padding: 20px;
}
.card{
    padding: 25px;
    /* border: 1px solid #e0dfdf; */
    border-radius: 1px;
    /* box-shadow: 0px 5px 10px 8px #eee; */
    border-radius: 10px;
    /* box-shadow:0px 10px 10px 10px #eee; */
    box-shadow: inset 0px 6px 4px 0px #a9dfd8;
    /* background: #A9DFD8; */
    background: #21222D;
}
.body-card{
    color:white
}
.header-top-card h6{
    line-height: 2em;
    padding: 14px 0px;
    color: white;
    color:white;
    font-weight: bold;
    font-size: 16px;
}
.props-card{
    width: 100%;
    padding: 0px 12px;
}
.props-card li{
    padding: 12px 0px;
}
.badge{
    font-size: 13px !important;
}
.footer-card .btn{
    font-size: 11px;
}
.container-top-content{
    padding: 16px 9px 0px;
    color:white
}
.card .status{
    position: relative;
}
.card .status .fa-trash{
    position: absolute;
    left: 0;
    top: 4px;
    color: #b71c1c;
    font-size: 18px;
    cursor: pointer;
    width: 16px;
}
.container-top-content .add-new-camp{
    background: #21222D;
    color:white;
    border-radius: 10px;
    font-size: 18px;
    font-weight: bold;
    padding: 14px;
}
.container-top-content img
{
    margin: 0px 8px;
}
.card .status .badge{
    margin: 0px 0px 0px 5px;
}
.card .status .badge img
{
    color: white;
    width: 15px;
    margin: 0px 0px 0px 6px;
}
.container-description hr{
    width: 80%;
    height: 6px;
    background: #A9DFD8;
    opacity: 1;
    border: 0px;
    margin: 16px auto;
    border-radius: 11px;
}
.title-camp,
.description-camp{
    color:white;
}
.description-camp
{
    background-color: #2b3543;
    padding: 10px;
}
.small-descrip{
    line-height: 3em;
    color: #198754;
    font-weight: bold;
    font-size: 15px;
}
.container-camp{
    padding: 2%;
}
.icon-status-camp{
    background:transparent;
}
.icon-status-camp.active-camp
{
    color: orange;
}
.icon-status-camp.draft-camp
{
    color: red;
}
.icon-status-camp.complete-camp{
    color: green;
}
.top-alert-info{
    color:white;
}
</style>

