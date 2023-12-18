<template>
    <div v-if="ShowDetails" class="model-details-camp">
        <div class="card card-model">
            <div class="top-header-model">
                <p class="title-model">
                    <strong>تفاصيل حملة ( {{ campaign.name }} )</strong>
                </p>
            </div>
            <div class="body-of-model">
                <div class="row">
                    <div class="col-6">
                        <ul class="list-items-details">
                            <li>
                                <strong> اسم الحملة </strong>
                                <p>{{ campaign.name }}</p>
                            </li>
                            <li>
                                <strong> تاريخ انشاء الحملة</strong>
                                <p>{{ campaign.created_at }}</p>
                            </li>
                            <li>
                                <strong> تاريخ تعديل الحملة</strong>
                                <p>{{ campaign.updated_at }}</p>
                            </li>
                            <li>
                                <strong> وصف الحملة</strong>
                                <p>{{ campaign.description }}</p>
                            </li>
                        </ul>
                    </div>
                    <div class="col-6">
                        <ul class="list-items-details">
                            <li>
                                <strong> مهمة الحملة</strong>
                                <p>{{ events[campaign.action] }}</p>
                            </li>
                            <li v-if="campaign.repeate">
                                <strong> نظام التكرار</strong>
                                <p>{{ repeates[campaign.repeate] }}</p>
                            </li>
                            
                            <li>
                                <strong> مرات التكرار</strong>
                                <p v-if="campaign.count_repeate">{{ campaign.count_repeate }}</p>
                                <p v-else> تكرار لا محدود </p>
                            </li>
                            <li v-if="campaign.products.length != 0">
                                <strong> عدد المنتجات المحددة</strong>
                                <p>{{ campaign.products.length }} منتج</p>
                            </li>
                            <li v-if="campaign.repeate_at_time">
                                <strong> توقيت تنفيذ الحملة</strong>
                                <p>{{ campaign.repeate_at_time }}</p>
                            </li>
                            <li v-if="campaign.end_at">
                               
                                <strong> توقيت نهاية الحملة</strong>
                                <p>
                                     <strong> {{ end_types_cal[campaign.end_type_cal] }}</strong>
                                     <strong>(  {{ campaign.end_at }}  )</strong>
                                     <strong v-if="campaign.end_type_cal == 2"> مرات</strong>
                                </p>
                            </li>
                            <li v-if="campaign.reapete_on.length != 0">
                                <strong> ايام التكرار</strong>
                                <ul>
                                    <li v-for="(day,key) in campaign.reapete_on" :key="key">
                                        {{ day }} 
                                    </li>
                                </ul>
                            </li>
                            <br/>
                            <li>
                                <strong> حالة الحملة</strong><br/>
                                <span class="badge text-bg-danger" v-if="campaign.status == 0">مسودة</span>
                                <span class="badge text-bg-success" v-if="campaign.status == 1">فعالة</span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="top-footer-model">
                <button @click="CloseModel" type="button" class="btn btn-danger">اغلاق</button>
            </div>
        </div>
    </div>
</template>
<script>
    export default {
        props:{
            ShowDetails:{
                default:false,
                type: Boolean
            },
            campaign:{
                default:{},
                type: Object
            }
        },
        data(){
            return{
                checked:null,
                events:{
                    0 : 'نشر المنتجات',
                    1 : 'الغاء نشر المنتجات',
                    2 : 'تخفيضات على المنتجات',
                    3 : 'تغير فى سعر المنتج',
                    4 : 'اضافة الترميزات الخاصة بالمنتح',
                    5 : 'حذف الترميزات الخاصة بالمنتج'
                },
                repeates:{
                    0        : "بدون تكرار",
                    daily    : "يوميا",
                    weekly   : "اسبوعيا كل خميس",
                    monthly  : "شهريا كل اول خميس",
                    annually : "سنويا كل مطلع شهر يناير",
                    weekends : "كل ايام العطلات من الجمعة حتى الاثنين",
                    custom   : "تكرار مخصص",
                },
                end_types_cal:{
                    0:'ابدا',
                    1:'في',
                    2:'بعد'
                }
            }
        },
        methods:{
            CloseModel:function(){
                this.$emit('modelshow', false);
            },
        }
    }
</script>
<style scoped>
   .model-details-camp{
        position: fixed;
        left:0%;
        right:0%;
        top:0%;
        bottom:0%;
        background-color:#00000047;
        text-align: center;
        overflow-y:auto;
        z-index: 100000;
   }
   .card-model{
        background-color:white;
        width:60%;
        height:auto;
        margin:auto;
        margin-top: 5%;
   }
   .title-model{
        padding: 9px 15px;
        text-align: right;
        font-size: 17px;
        line-height: 3em;
        border-bottom: 1px solid #eee;
   }
   .list-items-details{
     text-align: right;
   }
   .body-of-model
   {
        /* max-height:400px; */
   }
   .list-items tr{
        padding: 14px;
   }
   .top-footer-model{
        text-align: left;
        padding: 10px;
        border-top:1px solid #eee;
   }
   .even-td
   {
        text-align: right;
        width: 90%;
        padding: 3px 0px 7px 80px;
   }
   td input.event_type[type="radio"]
   {
        float: right;
        margin-top: -40px;
        margin-right: 20px;
        height: 20px;
        width: 20px;
        vertical-align: middle;
   }
   @media(max-width:1000px){
        .card-model{
            width: 95%;
        }
        .even-td{
            width:100%;
            padding: 3px 0px 7px 10px;
        }
        td input.event_type[type="radio"]{
            margin-top: -56px;
            margin-right: 10px;
            margin-left: 10px;
        }
    }
</style>