<template>
    <div v-if="ShowProducts" class="model-browose-products">
        <form method="post" @submit.prevent="AddProductsForCampaign">
            <div class="card card-model">
                <div class="top-header-model">
                    <p class="title-model">
                        <label class="inner-title-model">
                            <img :src="require('../../../../../img/icons/browsevents.svg')" />
                            تصفح المنتحات المتوفرة فى متجرك
                        </label>
                    </p>
                    <ul class="navbar">
                        <li @click="LoadInnerItems(1)" :class="`item-navbar ${this.fetch_item_type == 1 ? 'active' : ''}`">
                            تحديد منتجات محددة
                        </li>
                        <template v-if="(campaign.action != '5') && (campaign.action != '4')">
                            <li @click="LoadInnerItems(2)" :class="`item-navbar ${this.fetch_item_type == 2 ? 'active' : ''}`">
                                تحديد تصنيفات
                            </li>
                        </template>
                    </ul>
                </div>
                <div class="body-of-model">
                    <div class="overlayer-products" v-if="startfetch == true">
                        <img src="../../../../../img/Enso-2.gif" class="image-loading"/>
                    </div>
                    <!-- Products Lists-->
                    <template v-if="fetch_item_type == 1">
                        <table class="list-items">
                            <tbody>
                                <tr>
                                    <td colspan="4">
                                        <input type="text" v-model="search"  placeholder="البحث فى المنتجات" class="form-control" />
                                    </td>
                                </tr>
                                <template v-if="!search">
                                    <tr v-for="(product,index) in products" :key="index">
                                        <td>
                                            <input type="checkbox" v-model="campaign.products" :value="product.id"/>
                                        </td>
                                        <td>
                                            <img :src="(product.image ? product.image : require('../../../../../img/product.png'))"  class="product-img"/>
                                        </td>
                                        <td>
                                            <h6> {{ product.name }}</h6>
                                        </td>
                                        <td>
                                            <p>{{ product.formatted_price ? product.formatted_price : product.price }} {{ product.currency }}</p>
                                        </td>
                                    </tr>
                                </template>
                                <template v-else>
                                    <tr v-for="(product,index) in results" :key="index">
                                        <td>
                                            <input type="checkbox" v-model="campaign.products" :value="product.id"/>
                                        </td>
                                        <td>
                                            <img :src="(product.image ? product.image : require('../../../../../img/product.png'))"  class="product-img"/>
                                        </td>
                                        <td>
                                            <h6> {{ product.name }}</h6>
                                        </td>
                                        <td>
                                            <p>{{ product.formatted_price ? product.formatted_price : product.price }} {{ product.currency }}</p>
                                        </td>
                                    </tr>
                                </template>
                            </tbody>
                        </table>
                        <button v-if="this.page_no > 0" type="button" @click="loadMoreProducts()" style="color: white;margin: 10px;border-radius: 0px;" class="btn">
                           <img :src="require('../../../../../img/icons/arrow.svg')" />
                        </button>
                    </template>
                    <!-- Categories Lists-->
                    <template v-if="fetch_item_type == 2">
                        <table class="list-items">
                            <tbody>
                                <tr>
                                    <td colspan="2">
                                        <input type="text" v-model="search_categories"  placeholder="البحث فى التصنيفات" class="form-control" />
                                    </td>
                                </tr>
                                <template v-if="!search_categories">
                                    <tr v-for="(category,index) in categories" :key="index">
                                        <td>
                                            <input type="checkbox" v-model="campaign.categories" :value="String(category.id)"/>
                                        </td>
                                        <td style="text-align: right;">
                                            <h6> {{ category.name }}</h6>
                                        </td>
                                    </tr>
                                </template>
                                <template v-else>
                                    <tr v-for="(category,index) in results_categories" :key="index">
                                        <td>
                                            <input type="checkbox" v-model="campaign.categories" :value="String(category.id)"/>
                                        </td>
                                        <td style="text-align: right;">
                                            <h6> {{ category.name }}</h6>
                                        </td>
                                    </tr>
                                </template>
                            </tbody>
                        </table>
                    </template>
                </div>
                <div class="top-footer-model">
                    <template  v-if="fetch_item_type == 1">
                        <button type="submit" class="btn">
                            <img :src="require('../../../../../img/icons/addevent.svg')" />
                            اضافة المنتجات
                        </button>
                    </template>
                    <template v-else>
                        <button type="submit" class="btn">
                            <img :src="require('../../../../../img/icons/addevent.svg')" />
                            اضافة التصنيفات
                        </button>
                    </template>
                    <button @click="CloseModel" type="button" class="btn">
                        <img :src="require('../../../../../img/icons/close.svg')" />
                        اخفاء
                    </button>
                </div>
            </div>
        </form>
    </div>
</template>
<script>
    export default {
        props:{
            ShowProducts:{
                default:false,
                type: Boolean
            },
            campaign:{
                default:{
                },
                type: Object
            }
        },
        data(){
            return{
                checked:null,
                search : '',
                search_categories:'',
                products:[],
                categories:[],
                results:{},
                errors:{},
                results_categories:{},
                page_no:1,
                full_pages:0,
                startfetch:false,
                fetch_item_type:1
            }
        },
        methods:{
            CloseModel:function(){
                this.ShowEvents = false;
                this.$emit('modelshow', false);
            },
            AddProductsForCampaign:async function(){
                this.CloseModel();
                let items = null;
                if(this.campaign.type_selected == 1){
                    items = this.products;
                } else if(this.campaign.type_selected == 2) {
                    items = this.categories;
                }

                this.$emit('updateFromProductsCampaign', this.campaign,items);
            },
            loadMoreProducts:function(){
                let self = this;
                this.startfetch = true;
                axios.get('/api/app-products',{
                    params:{
                        page_no:self.page_no
                    }
                }).then(function({data}){
                    self.full_pages = Number(self.full_pages) + Number(data.products.results.length);
                    console.log(data,'nn');
                    if((Number(data.products.count) - self.full_pages) > 0 ){
                        self.page_no++;
                    }else{
                        self.page_no = 0;
                    }
                    self.startfetch = false;
                    self.products  = self.products.concat(data.products.results);
                }).catch(function({response}){
                    self.startfetch = false;
                });
            },
            loadMoreCategories:function(){
                let self = this;
                this.startfetch = true;
                axios.get('/api/app-categories',{
                    params:{
                        page_no:self.page_no
                    }
                }).then(function({data}){
                    console.log(data,'nn');
                    self.startfetch  = false;
                    self.categories  = data.categories.results;
                }).catch(function({response}){
                    self.startfetch = false;
                });
            },
            LoadInnerItems:function(type){
                this.fetch_item_type = type;
                this.campaign.type_selected = type;
                if(this.fetch_item_type == 1){
                    if(this.products.length == 0){
                        this.loadMoreProducts();
                    }
                } else if(this.fetch_item_type == 2){
                    this.loadMoreCategories();
                }
            }
        },
        watch:{
            search:function(search_value){
                this.results = this.products.filter(function(item){
                    let searc= item.name;
                    if(searc.search(new RegExp(search_value, "ig")) != -1){
                        return item;
                    }
                });
            },
            search_categories:function(search_value){
                this.results_categories = this.categories.filter(function(item){
                    let search_cat= item.name;
                    if(search_cat.search(new RegExp(search_value, "ig")) != -1){
                        return item;
                    }
                });
            }
        },
        created(){
            if(this.fetch_item_type == 1){
                if(this.products.length == 0){
                    this.loadMoreProducts();
                }
            } else if(this.fetch_item_type == 2){
                this.loadMoreCategories();
            }
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
        background: #000000a6;
        text-align: center;
        overflow-y:auto;
        z-index: 100000;
   }
   .card-model{
        background-color: #151c28;
        color: white;
        width:40%;
        height:auto;
        margin:auto;
        margin-top: 5%;
   }
   .title-model{
        padding: 9px 15px;
        text-align: right;
        font-size: 17px;
        line-height: 3em;
   }
   .title-model .inner-title-model{
        background: #181920;
        padding: 2px 10px;
        border-radius: 10px;
        font-weight: bold;
   }
   .body-of-model{
        padding: 10px 20px;
        max-height:400px;
        overflow-y: auto;
        position: relative;
   }
   .overlayer-products{
        position: absolute;
        top:0;
        right:0;
        left:0;
        bottom:0;
        /* background-color:#fff9f97a; */
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
        border-bottom: 1px solid #5c5c5c;
   }
   .list-items tr:first-child {
        position: sticky;
        top: -14px;
        /* background: white; */
        background: #151c28;
        border-bottom: 0px;
    }
    .list-items tr td
   {
    padding: 5px;
   }
   .product-img{
       width: 50px;
   }
   .form-control{
        background-color: #1f1f1f;
        border: 1px solid #1f1f1f;
        height: 46px;
        margin: 10px 0px;
        color: white;
   }

   .top-footer-model .btn{
        background: #A9DFD8;
        color: black;
        border-radius: 25px;
        margin: 0px 10px;
        font-weight: bold;
        font-size: 13px;
   }
   .top-header-model .navbar{
        width: 100%;
        padding: 0px 35px;
        display: flex;
        justify-content: flex-start;
   }
   .top-header-model .navbar .item-navbar
   {
        padding:7px 15px;
        border-radius: 40px;
        background-color: #5b5f5f;
        list-style: none;
        margin-left: 13px;
        cursor: pointer;
   }
   .top-header-model .navbar .item-navbar.active
   {
        background-color: #15655a;
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
