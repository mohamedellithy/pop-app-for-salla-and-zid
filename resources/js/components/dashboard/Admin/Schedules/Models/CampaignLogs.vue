<template>
    <div v-if="ShowCampLogs" class="model-browose-products">
        <div class="card card-model">
            <div class="top-header-model">
                <p class="title-model">
                    <label class="inner-title-model">
                        <img :src="require('../../../../../img/icons/browsevents.svg')" />
                        عرض تفاصيل تنفيذ الحملة 
                    </label>
                </p>
            </div>
            <div class="body-of-model">
                <table class="list-items" style="width:100%">
                    <tbody>
                        <tr v-for="(log,key) in Logs" :key="key">
                            <td>{{  log.created_at  }}</td>
                            <td>
                                <textarea class="form-control" readonly rows="5" cols="35" v-model="log.log"></textarea>
                            </td>
                        </tr>

                    </tbody>
                </table>
            </div>
            <div class="top-footer-model">
                <button @click="CloseModel" type="button" class="btn">
                    <img :src="require('../../../../../img/icons/close.svg')" />
                    اخفاء
                </button>
            </div>
        </div>
    </div>
</template>
<script>
    export default {
        props:{
            ShowCampLogs:{
                default:false,
                type: Boolean
            },
            Logs:{
                default:{},
                type: Object
            }
        },
        data(){
            return{
                checked:null,
                updated:false
            }
        },
        methods:{
            CloseModel:function(){
                this.$emit('modelshow', false);
            }
        },
        watch:{}
    }
</script>
<style scoped>
   .model-browose-products{
        position: fixed;
        left:0%;
        right:0%;
        top:0%;
        bottom:0%;
        /* background-color:#00000047; */
        background: #000000a6;
        text-align: center;
        overflow-y:auto;
        z-index: 100000;
   }
   .card-model{
        /* background-color:white; */
        background-color: #151c28;
        color: white;
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
        border-bottom: 1px solid #151c28;
   }
   .title-model .inner-title-model{
        background: #181920;
        padding: 2px 10px;
        border-radius: 10px;
        font-weight: bold;
   }
   .list-items{
         overflow-y: auto;
   }
   .body-of-model
   {
        max-height:400px;
        overflow-y: auto;
        padding: 20px;
   }
   .list-items tr{
        padding: 14px;
        border-right: 10px solid #151c28;
   }
   .list-items tr.active{
        border-right: 10px solid #23a593;
   }
   .top-footer-model{
        text-align: left;
        padding: 10px;
        border-top: 1px solid #151c28;
   }
   .top-footer-model .btn{
        background: #A9DFD8;
        color: black;
        border-radius: 25px;
        margin: 0px 10px;
        font-weight: bold;
        font-size: 13px;
   }
   .even-td
   {
        text-align: right;
        width: 90%;
        padding: 3px 23px 7px 23px;
        position: relative;
   }
   td input.event_type[type="radio"]
   {
        /* float: right;
        margin-top: -40px;
        margin-right: 20px;
        height: 20px;
        width: 20px;
        vertical-align: middle; */
        position: absolute;
        left: 0;
        right: 0;
        top: 0;
        bottom: 0;
        opacity: 0;
        cursor: pointer;
   }
   .list-items td h6
   {
        color: #87888C;
        font-size: 18px;
        font-weight: bold;
   }
   .list-items td textarea
   {
        height: 117px;
        background-color: #222e42;
        color: white;
        border: 1px solid #222e42;
   }
   @media(max-width:1000px){
        .card-model{
            width: 95%;
        }
        .even-td{
            width:100%;
            /* padding: 3px 0px 7px 10px; */
            padding: 3px 15px 7px 10px;
        }
        td input.event_type[type="radio"]{
            margin-top: -56px;
            margin-right: 10px;
            margin-left: 10px;
        }
    }
</style>
