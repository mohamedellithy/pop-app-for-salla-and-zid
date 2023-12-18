<template>
    <div class="col-12" v-if="Object.keys(campaigns).length != 0">
        <div class="row container-top-content">
            <div class="col-lg-12">
                <router-link tag="button" class="btn add-new-camp" :to="{name:'add-schedules'}">
                    <img :src="require('../../../../img/icons/newcamp.png')"/>
                    إضافة حملة جديدة
                </router-link>
            </div>
        </div>
        <div class="row">
            <div class="container-card col-md-4" v-for="(campaign,index) in campaigns" :key="index">
                <div class="card">
                    <div class="status">
                        <span v-if="campaign.status == 0" class="badge">
                            <img :src="require('../../../../img/icons/draft.png')" />
                            مسودة
                        </span>
                        <span v-else class="badge">
                            <!-- <i class="fas fa-eye"></i> -->
                            <img :src="require('../../../../img/icons/publish.png')" />
                            منشورة
                        </span>
                        <img class="fas fa-trash" :src="require('../../../../img/icons/delete.png')" @click="TrashCampaign(campaign.id)"/>
                        <!-- <span class="fas fa-trash" @click="TrashCampaign(campaign.id)"></span> -->
                    </div>
                    <div class="header-top-card">
                        <h6>
                            <img :src="require('../../../../img/icons/Ellipse33.png')" />
                            {{ campaign.name || ''}}
                        </h6>
                    </div>
                    <div class="body-card">
                        <div class="container-description">
                            <p class="description">{{ campaign.description | CropeDescription }}</p>
                            <hr/>
                        </div>
                        <div class="container-dates">
                            <ul class="props-card">
                                <li>
                                    <label for="">
                                        <img :src="require('../../../../img/icons/datecreate.png')" />
                                        تاريخ تعديل الحملة

                                    </label> <br/>
                                    <strong>{{ campaign.updated_at }}</strong><br/>
                                </li>
                                <!-- <li>
                                    <label for="">تاريخ تعديل الحملة</label> <br/>
                                    <strong>{{ campaign.updated_at }}</strong><br/>
                                </li> -->
                                <li>
                                    <label for="">
                                        <img :src="require('../../../../img/icons/tasks.png')" />
                                        مهمة التى تقوم بها الحملة
                                    </label> <br/>
                                    <strong class=""> {{ events[campaign.action] }} </strong>

                                </li>
                            </ul>
                        </div>
                    </div>
                    <hr/>
                    <div class="footer-card">
                        <router-link tag="button" :to="{name:'edit-schedule',params:{id:campaign.id}}" class="btn btn-sm">
                            <!-- <i class="fas fa-edit"></i> -->
                            <img :src="require('../../../../img/icons/edit.png')" />
                            تعديل الحملة
                        </router-link>
                        <!-- <button @click="ShowCampDetails(campaign)" type="button" class="btn btn-info btn-sm">
                            <i class="fas fa-eye"></i>
                            تفاصيل الحملة
                        </button> -->
                        <button v-if="campaign.status == 0" @click="changeCampaignStatus(campaign.id,1)" type="button" class="btn active_noactive_camp btn-sm">
                            <!-- <i class="fas fa-stop-circle"></i> -->
                            <img :src="require('../../../../img/icons/active.png')" />
                            تفعيل الحملة
                        </button>
                        <button v-else type="button" @click="changeCampaignStatus(campaign.id,0)" class="btn active_noactive_camp btn-sm">
                            <!-- <i class="far fa-pause-circle"></i> -->
                            <img :src="require('../../../../img/icons/stopcamp.png')" />
                            وقف الحملة
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <details-camp :show-details="Details" :campaign="this.selectedCamp" @modelshow="closeModel"></details-camp>
        <alert-response :showsuccess="showsuccess" :showerrors="showerrors"
        @update_success="showsuccess = false"
        @update_errors="showerrors = false" :errors="errors"
        :success_message="success_message"
        :error_message="error_message"></alert-response>
    </div>
    <div v-else class="col-lg-8 show-alert-messaage" >
        <img class="schedule-img" :src="require('../../../../img/PAGENOPOP.png')">
        <div class="frame-btn-schedule">
            <router-link tag="button" class="btn" :to="{name:'add-schedules'}">
                <img :src="require('../../../../img/icons/noop.svg')" />
                اضافة حملة جديدة
            </router-link>
        </div>
    </div>

</template>
<script>
import DetailsCamp from './Models/DetailsCamp.vue';
import AlertResponse from './Models/AlertResponse.vue';
export default {
    components:{
        DetailsCamp,
        AlertResponse
    },
    data(){
        return{
            campaigns:{key:null},
            events:{
                0 : 'نشر المنتجات',
                1 : 'الغاء نشر المنتجات',
                2 : 'تخفيضات على المنتجات',
                3 : 'تغير فى سعر المنتج',
                4 : 'اضافة الترميزات الخاصة بالمنتح',
                5 : 'حذف الترميزات الخاصة بالمنتج',
                6 : 'انهاء تخفيضات على المنتجات'
            },
            Details:false,
            selectedCamp:{
                status:0
            },
            errors:{},
            showsuccess:false,
            showerrors:false,
            success_message:'تم تحديث الحملة بنجاح',
            error_message:'حدث خطأ اثناء تحديث الحملة'
        }
    },
    methods:{
        changeCampaignStatus:function(id,status){
            let self = this;
            axios.post('/api/campaign/change_status/'+id+'/'+status).then(function({data}){
                self.fetchCampaigns();
                self.showsuccess = true;
            }).catch(function({response}){
                self.showerrors  = true;
            });
        },
        fetchCampaigns:function(){
            let self = this;
            axios.get('/api/campaigns',{
                params:{
                    status:this.$route.params.category,
                }
            }).then(function({data}){
                self.campaigns = data.campaigns;
            }).catch(function({response}){
            });
        },
        TrashCampaign:function(id){
            let self = this;
            axios.delete('/api/campaigns/'+id).then(function({data}){
                self.fetchCampaigns();
                self.success_message = 'تم حذف الحملة بنجاح';
                self.showsuccess = true;
            }).catch(function({response}){
                self.error_message = 'حدث خطأ اثناء حذف الحملة';
                self.showerrors  = true;
            });
        },
        ShowCampDetails:function(campaign){
             this.selectedCamp = campaign;
             this.Details = true;
        },
        closeModel:function(){
             this.selectedCamp = {};
             this.Details = false;
        }
    },
    created(){
        this.fetchCampaigns();
    },
    filters:{
        CropeDescription:function(value){
            if(!value){
               return null;
            }
            return value.substring(0, 150) + ' ... ';
        }
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
.footer-card .btn{
    background: #A9DFD8;
    color: #21222D;
    border-radius: 20px;
    font-weight: bold;
    font-size: 12px;
}
.card::after{
    content: "";
    width: 7px;
    height: 60%;
    background: #2E9E8F;
    position: absolute;
    left: 0;
    top: 17%;
}
.header-top-card h6 img{
    width: 15px;
    margin: 0px 8px;
}
.active_noactive_camp{
    float: left;
}
.props-card{
    list-style: none;
}
.props-card li label img{
    width:15px;
}
.props-card li strong
{
    padding-right: 17px;
    font-size: 16px;
    font-weight: 400;
}
.props-card li label
{
    font-size: 16px;
}
@media(max-width:1000px){
    .schedule-img{
        width: 70%;
        height: auto;
    }
}
</style>
