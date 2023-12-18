<template>
    <div v-if="ShowProductsValues" class="model-browose-products">
        <div class="card card-model">
            <div class="top-header-model">
                <p class="title-model">
                    <label class="inner-title-model">
                        <img :src="require('../../../../../img/icons/timespop.svg')" />
                        اضافة تصنيفات المنتجات التى قمت يتحديدها
                    </label>
                </p>
            </div>
            <div class="body-of-model">
                <div class="overlayer-products" v-if="startfetch == true" >
                    <img src="../../../../../img/Enso-2.gif" class="image-loading" style="width: 47px;margin-top: 20%;"/>
                </div>
                <table class="list-items">
                    <tbody>
                        <!-- ----------- -->
                        <!-- الجزء الاول اضافة قيم عامة لكل المنتجات -->
                        <!-- اضافة الترميذات الخاصة لكل منتج -->
                        <template>
                            <tr>
                                <td class="container-check" colspan="6">
                                    <input class="set_type" type="radio" v-model="campaign.type_set" value="0"/>
                                    <label style="text-align: right;margin-bottom: 5px;">اضافة التصنيفات الخاصة بالمنتجات</label>
                                    <div class="form-group" v-if="campaign.type_set == '0'" style="text-align:right">
                                        <input @keyup.enter="addGlobalValues" v-model="newtag" class="form-control input_values" style="display:inline-block;width:85%" type="text" placeholder="اضافة التصنيفات الخاصة بالمنتجات" :disabled="campaign.type_set != '0'" />

                                        <button @click="addGlobalValues" type="button" class="btn btn-warning btn-sm" :disabled="campaign.type_set != '0'" style="padding: 7px;width: 42px;cursor: pointer;"><i class="fas fa-plus-circle"></i></button>

                                        <ul class="container-tags" v-if="campaign.type_set == '0'" style="margin-top: 10px;">
                                            <template v-if="typeof globalValues == 'object'">
                                                <li v-for="(tag,index) in globalValues" :key="index">
                                                    <span>
                                                        {{ tag }}
                                                    </span>
                                                </li>
                                            </template>
                                            <template>
                                                <li class="onyourplatform" v-for="(tag,key) in looped_categories" :key="key">
                                                    <span v-if="(globalValues == null) || (globalValues.indexOf(tag) == -1)">
                                                        {{ tag }}
                                                    </span>
                                                </li>
                                            </template>
                                        </ul>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="container-check" colspan="6">
                                    <input class="set_type" type="radio" v-model="campaign.type_set" value="1"/>
                                    <label style="text-align: right;margin-bottom: 15px;"> اضافة التصنيفات لكل منتج</label>
                                </td>
                            </tr>
                        </template>
                        <!-- اضافة الترميذات الخاصة لكل منتج -->
                        <!-- اضافة قيم مفصلة لكل منتج على حدي -->
                        <template v-if="campaign.type_set == '1'">
                            <template >
                                <template v-for="(single_product,index) in selected_products">
                                    <tr :key="index" v-if="campaign.products.indexOf(single_product.id) != -1">
                                        <template>
                                            <td>
                                                <img :src="(single_product.image ? single_product.image : require('../../../../../img/product.png'))"  class="product-img"/>
                                            </td>
                                            <td>
                                                <h6> {{ single_product.name }}</h6>
                                            </td>
                                            <td>
                                                <!-- اضافة تاج لكل منتج -->
                                                <template>
                                                    <div class="form-group" style="text-align:right">

                                                        <input @keyup.enter="addPrivateValues(single_product.id)" class="form-control input_values" v-model="privatevalue[single_product.id]" style="display:inline-block;width:70%" type="text"  placeholder="اضافة التصنيفات الخاصة بالمنتجات" />

                                                        <button @click="addPrivateValues(single_product.id)" type="button" class="btn btn-warning btn-sm" style="padding: 7px;width: 42px;cursor: pointer;"><i class="fas fa-plus-circle"></i></button>

                                                        <ul  class="container-tags">
                                                            <template v-if="(privateValues[single_product.id] && typeof privateValues[single_product.id] == 'object')">
                                                                <li v-for="(tag ,index) in privateValues[single_product.id]" :key="index">
                                                                    <span>
                                                                        {{ tag }}
                                                                    </span>
                                                                </li>
                                                            </template>
                                                            <li class="onyourplatform" v-for="(tag,index_category) in single_product.categories" :key="index_category">
                                                                <span v-if="(privateValues[single_product.id] == null ) || (privateValues[single_product.id].indexOf(tag.id) == -1)">
                                                                    {{ tag.name.ar || tag.name }}
                                                                </span>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </template>
                                            </td>
                                        </template>
                                    </tr>
                                </template>
                            </template>
                        </template>
                        <!-- اضافة قيم مفصلة لكل منتج على حدي -->
                    </tbody>
                </table>
            </div>
            <div class="top-footer-model">
                <button @click="AddProductsValuesForCampaign" class="btn">
                    <img :src="require('../../../../../img/icons/addevent.svg')" />
                    اضافة التصنيفات
                </button>
                <button @click="CloseModel" type="button" class="btn">
                    <img :src="require('../../../../../img/icons/close.svg')" />
                    الغاء
                </button>
            </div>
        </div>
    </div>
</template>
<script>
    import MultipleSelect from 'multiple-select-js'
    export default {
        components:{
            MultipleSelect
        },
        props:{
            ShowProductsValues:{
                default:false,
                type: Boolean
            },
            campaign:{
                default:{},
                type: Object
            },
        },
        data(){
            return{
                results:{},
                globalValues:null,
                privateTags:[],
                privateValues:[],
                products:[],
                selected_products:[],
                newtag:null,
                privatetag:[],
                privatevalue:[],
                errors:{},
                counter:0,
                values_of_products:null,
                value_all:null,
                current_event:this.campaign.action,
                startfetch:false,
                fetched_products:[],
                looped_categories:{}
            }
        },
        methods:{
            CloseModel:function(){
                this.ShowEvents = false;
                this.$emit('modelshow', false);
            },
            addGlobalValues:function(){
                if(typeof this.globalValues !== 'object'){
                    this.globalValues = [];
                }
                this.globalValues.push(this.newtag);
                this.newtag = null;
            },
            removePrivateTag:function(tag_id,tag){
                this.privateValues[tag_id].splice(this.privateValues[tag_id].indexOf(tag),1);
                this.globalValues = Object.values(this.privateValues)[0];

            },
            removeTag:function(tag){
                this.globalValues.splice(this.globalValues.indexOf(tag),1);

            },
            addPrivateValues:function(id){
                if(!this.privateValues[id]){
                    this.counter = 0;
                } else if(typeof this.privateValues[id] !== 'object'){
                    this.privateValues[id] = null;
                    this.counter = 0;
                } else{
                    this.counter = this.privateValues[id].length;
                }

                this.privateValues[id] = this.privateValues[id] || [];
                this.privateValues[id][this.counter++] = this.privatevalue[id];
                this.privatevalue[id]  = null;
            },
            AddProductsValuesForCampaign:function(){
                this.CloseModel();
                let set_values_products = {};
                // tags
                if(this.campaign.type_set == '0'){
                    set_values_products = null;
                    set_values_products = this.globalValues.join('-');
                } else {
                    for(let product_id in  this.privateValues){
                        if(this.privateValues[product_id] != null){
                            set_values_products[product_id] = this.privateValues[product_id].join('-');
                        } else {
                            set_values_products[product_id] = null;
                        }
                    }
                }

                // update from products values
                this.$emit('updateFromProductsValuesCampaign',set_values_products);
            },
        },
        filters:{
            filter_tags_loop(tags){
               return tags;
            }
        },
        watch:{
            ShowProductsValues:async function(value){
                let self         = this;
                if(value == true){
                    self.privateValues = self.campaign.products_values || {};
                    self.globalValues  = Object.values(self.privateValues)[0] || [];
                    self.startfetch    = true;
                    const loops_products = self.campaign.products.map(async function(element){
                        if(self.fetched_products.indexOf(element) == -1){
                            self.fetched_products.push(element);
                            await axios.get('/api/single-app-product/' + element).then(async function({data}){
                                if(self.selected_products.indexOf(data.product) == -1){
                                    self.selected_products.push(data.product);
                                    for await (const element_cat of data.product.categories){
                                        self.looped_categories[element_cat.id] = element_cat.name.ar || element_cat.name;
                                    }
                                }
                            }).catch(function({response}){

                            });
                        }
                    });

                    await Promise.all(loops_products);
                    self.startfetch = false;
                }
            }
        },
        created(){
        }
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
   .body-of-model{
        padding: 0px 20px;
        max-height:400px;
        overflow-y: auto;
   }
   .overlayer-products{
        position: absolute;
        top:0;
        right:0;
        left:0;
        bottom:0;
        background: #000000a6;
        z-index: 100;
   }
   .list-items{
     width:100%;
   }
   .list-items tr{
        padding: 14px;
   }
   .top-footer-model{
        text-align: left;
        padding: 10px;
        /* border-top:1px solid #eee; */
   }
   .even-td
   {
        text-align: right;
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
   .list-items tr{
        border-bottom: 1px solid #eee
   }
   .list-items tr:first-child
    {
        position: sticky;
        top: 0px;
        /* background: #e3f8e3; */
        background: #0b1017;
        border-bottom: 0px solid #ffffff;
    }
    .list-items tr:nth-child(2){
        position: sticky;
        top: 48px;
        /* background: #e3f8e3; */
        background: #0b1017;
        border-bottom: 1px solid #eee;
    }
    .list-items tr td
   {
    padding: 5px;
   }
   .list-items tr:nth-child(2) td,
   .list-items tr:first-child td
   {
    padding: 0px 20px;
   }
   .list-items tr:nth-child(2) td label,
   .list-items tr:first-child td label
   {
        line-height: 3em;
        padding: 0px 5px;
   }
   .product-img{
       width: 50px;
   }
   .container-check{
    text-align: right;
   }
   .set_type{
        height: 20px;
        width: 20px;
        vertical-align: middle;
   }
   .input_values
   {
        width: 100%;
        margin: 0% 0% 0%;
   }
   .container-tags{
        /* background-color: white; */
        background-color: #0b1017;
        border-bottom: 1px solid white;
        padding: 15px;
        text-align: right;
   }
   .container-tags li{
        display: inline-block;
        /* background-color: rgb(9, 9, 84); */
        color: white;
        margin: 3px;
   }
   .container-tags li span{
        background-color: rgb(9, 9, 84);
        color: white;
        padding: 4px 10px;
        margin: 3px;
   }

   .container-tags li.onyourplatform span{
        color: white;
        background-color: #5353c1;
   }
   .fa-times-circle{
        cursor: pointer;
   }
   .top-footer-model .btn{
        background: #A9DFD8;
        color: black;
        border-radius: 25px;
        margin: 0px 10px;
        font-weight: bold;
        font-size: 13px;
   }
   .form-control{
        background-color: #1f1f1f;
        border: 1px solid #1f1f1f;
        height: 46px;
        margin: 10px 0px;
        color: white;
   }
   .list-items tr:last-child{
        border-bottom: 0px;
   }
   @media(max-width:1000px){
        .card-model{
            width: 95%;
        }
        .product-img{
            width: 40px;
        }
    }
</style>
