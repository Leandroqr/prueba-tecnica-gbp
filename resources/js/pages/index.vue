<template>
    <section class="conf-section m-3 p-3">
        <div class="row mx-0">
            <div class="col-xl-4 px-0">
                <!-- bodegas -->
                <div class="border-dark p-2 br-5 my-2">
                    <div class="row mx-0 pl-2">
                        <b class="mr-2 my-auto">Bodegas</b>
                        <el-popover placement="bottom" title="Crear bodega" width="240" trigger="click" >
                            <div class="row mx-0 my-2">
                                <div class="col" >
                                    <label>Nombre Bodega</label>
                                    <input type="text" class="form-control" v-model="nom_bodega" value="" />
                                </div>
                            </div>
                            <div class="row mx-0 my-2">
                                <div class="col">
                                    <label>Responsable</label>
                                    <el-select v-model="responsable" placeholder="Select"> <el-option v-for="item in options" :key="item.id" :label="item.nombre" :value="item.id" /> </el-select>
                                </div>
                            </div>
                            <div class="row mx-0 mt-2 justify-content-end">
                                <button type="button" class="btn btn-sm btn-light mr-2" name="button">Cerrar</button>
                                <button type="button" class="btn btn-sm btn-primary" @click="agregarBodega" name="btn_add_bodega">Guardar</button>
                            </div>
                            <i slot="reference" class="mdi mdi-plus-circle f-22 cr-pointer" />
                        </el-popover>
                    </div>
                    <div v-for="(data, key) in bodegas" :key="`bodega-${key}`" class="row mx-0 my-3">
                        <p class="mx-2 my-auto"> {{data.nombre}}</p>
                        <el-tooltip class="item" effect="light" :content="data.nombre_user" placement="top">
                            <img class="rounded-circle mx-2 obj-cover" height="40" width="40" :src="`${data.foto == '' ? '/img/usuarios/james.jpg' : data.foto }`" alt="" />
                        </el-tooltip>
                        <button type="button" :class="`btn btn-sm my-auto ${data.estado ? 'btn-success':'btn-danger'}`" name="button" @click="cambiarEstadoBodega(data.id,data.estado)" >
                            {{data.estado ? 'Activo':'Inactivo'}}
                        </button>
                    </div>
                </div>
                <!-- usuarios -->
                <div class="border-dark p-2 br-5 my-2">
                    <div class="row mx-0 justify-conent-center pl-2">
                        <b class="mr-2 my-auto">Usuarios</b>
                        <i class="mdi mdi-plus-circle f-22 cr-pointer" />
                    </div>
                    <div v-for="(data, key) in users" :key="`user-${key}`" class="row mx-0 my-3 px-2">
                        <el-switch v-model="data.estado" :active-value="1" :inactive-value="0" :inactive-text="data.nombre" @change="cambiarEstadoUsuario(data.id,data.estado)"> </el-switch>
                    </div>
                </div>
                <!-- Productos -->
                <div class="border-dark p-2 br-5 my-2">
                    <div class="row mx-0 justify-conent-center">
                        <b class="mr-2 my-auto">Productos</b>
                        <i class="mdi mdi-plus-circle f-22 cr-pointer" />
                    </div>
                    <div v-for="(data, key) in products" :key="`prod-${key}`" class="row mx-0 my-3">
                        <p class="mx-2 my-auto">{{data.nombre}}</p>
                        <button type="button" :class="`btn btn-sm ${data.estado ? 'btn-success':'btn-danger'}`" name="button" @click="cambiarEstadoProducto(data.id,data.estado)">
                            {{data.estado ? 'Activo':'Inactivo'}}
                        </button>
                    </div>
                </div>
            </div>
            <!-- tablas -->
            <div class="col-xl-8">
                <div class="row mx-0 my-3">
                    <div class="col d-flex">
                        <label class="mr-2">Rojo</label>
                        <div class="custom-control custom-switch">
                            <input type="checkbox" class="custom-control-input" id="ColorTabla">
                            <label class="custom-control-label" for="ColorTabla">Azul</label>
                        </div>
                    </div>
                    <button type="button" class="btn btn-success my-auto btn-sm d-flex" name="button" @click="agregarProducto">
                        <span class="my-auto">Agregar producto</span>
                        <i class="mdi mdi-plus-box cr-pointer f-17 ml-2 my-n1" />
                    </button>
                    <button type="button" class="btn btn-primary ml-2 my-auto btn-sm d-flex" name="button">
                        <span class="my-auto">Transferir producto</span>
                        <i class="mdi mdi-reload f-17 ml-2 my-n1" />
                    </button>
                </div>
                <div class="row mx-0 my-3">
                    <div class="col overflow-auto">
                        <p class="f-600 my-2 text-center f-18">Productos en bodega </p>
                        <table id="listado_por_legal" class="table table-sm table-hover table-striped ">
                            <thead>
                                <tr>
                                    <th class="align-middle">Item</th>
                                    <th class="align-middle">Bodega</th>
                                    <th class="align-middle">Producto</th>
                                    <th class="align-middle">Cantidad</th>
                                    <th class="align-middle text-center">Fecha</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </div>
                <div class="row mx-0 my-3">
                    <div class="col overflow-auto">
                        <p class="f-600 my-2 text-center f-18">Historial de movimientos</p>
                    </div>
                </div>
            </div>
        </div>
        <modal-agregar-producto ref="modalAgregarProducto"/>
        <modal-transferir-producto ref="modalTransferirProducto" />
        <modal ref="cambiarEstado_User" titulo="Cambiar estado usuario">
            <div class="row mx-0 my-3 justify-content-center">
                ¿Está seguro de Activar/Desactivar este usuario?
            </div>
            <div class="row mx-0 mt-2 justify-content-end bg-whitesmoke py-2">
                <button type="button" class="btn btn-sm btn-secondary mr-2" name="button">Cerrar</button>
                <button type="button" class="btn btn-sm btn-primary" name="button">Guardar</button>
            </div>
        </modal>
        <!-- https://datatables.net/manual/ -->
        <!-- https://element.eleme.io/#/es -->
    </section>
</template>

<script>
import axios from 'axios'
import EventBus from '../event-bus.js'
export default {
    components: {
        modalAgregarProducto: () => import('./modales/modalAgregarProducto'),
        modalTransferirProducto: () => import('./modales/modalTransferirProducto'),
        modal: () => import('~/components/modal')
    },
    data(){
        return {
            nom_bodega: null,
            responsable: null,
            respuesta: '',
            idUser: null,
            idProduct: null,
            colorTabla: 0,
            value: '',
            tabla_empresa:[
                // { bodega: "Bodega 1",producto: "MFDA12678934501", cantidad: 5, fecha:'12/15/7894' },
                // { bodega: "Bodega 2",producto: "MFDA12678934501", cantidad: 15, fecha:'12/15/7894' },
                // { bodega: "Bodega 3",producto: "MFDA12678934501", cantidad: 25, fecha:'12/15/7894' },
                // { bodega: "Bodega 4",producto: "MFDA12678934501", cantidad: 35, fecha:'12/15/7894' },
                // { bodega: "Bodega 5",producto: "MFDA12678934501", cantidad: 45, fecha:'12/15/7894' },
            ],
            bodegas: [],
            products: [],
            users: [],
            options: []
        } 
    },
    created() {
        // EventBus.$on('add-prod-inventario', data => {
        //     this.products.push(data)
        // })
    },
    mounted(){
        this.initDatatables();
        this.traerUsuarios();
        this.traerBodegas();
        this.traerProductos();
        this.traerInventarios();
    },
    methods: {
        traerUsuarios() {
            axios.get('http://localhost:8000/api/usuarios')
            .then(response => {
                if (response.status == 200) {
                    this.users = response.data
                    this.options = response.data
                }
            })
            .catch( err => {
                console.log(err);
            })
        },
        traerBodegas() {
            axios.get('http://localhost:8000/api/bodegas')
            .then(response => {
                if (response.status == 200) {
                    this.bodegas = response.data    
                }
            })
            .catch( err => {
                console.log(err);
            })
        },
        traerProductos() {
            axios.get('http://localhost:8000/api/productos')
            .then(response => {
                if (response.status == 200) {
                    this.products = response.data
                }
            })
            .catch( err => {
                console.log(err)
            })
        },
        agregarBodega() {
            let url = 'http://localhost:8000/api/addBodega'
            axios.post(url, {
                nom_bodega: this.nom_bodega,
                responsable: this.responsable 
            })
            .then( res => {
                // this.bodegas.push(res.data.bodega)
                this.traerBodegas()
                console.log(res.data.mensaje)
            })
            .catch( err => {
                console.log(err)
            })
        },
        cambiarEstadoBodega(id,estado) {
            this.$confirm('¿Está seguro de Activar/Desactivar esta Bodega ?. Continue?', 'Warning', {
                confirmButtonText: 'OK',
                cancelButtonText: 'Cancel',
                type: 'warning'
            }).then(() => {
                let valueState = !estado ? 1 : 0
            // Enviamos el id y el estado
                this.modifyStateBodega(id,valueState)
                this.$message({
                    type: 'success',
                    message: 'Estado Actualizado'
                });
            }).catch(() => {
                this.$message({
                    type: 'info',
                    message: 'Cancelado'
                });          
            });
        },
        cambiarEstadoUsuario(id,estado) {
            this.$confirm('¿Está seguro de Activar/Desactivar este Usuario ?. Continue?', 'Warning', {
                confirmButtonText: 'OK',
                cancelButtonText: 'Cancel',
                type: 'warning'
            }).then(() => {
                let valueState = estado ? 1 : 0
            // Enviamos el id y el estado
                this.modifyStateUsuario(id,valueState)
                this.$message({
                    type: 'success',
                    message: 'Estado Actualizado'
                });
            }).catch(() => {
                this.$message({
                    type: 'info',
                    message: 'Cancelado'
                });          
            });
        },
        cambiarEstadoProducto(id,estado) {
            this.$confirm('¿Está seguro de Activar/Desactivar este Producto ?. Continue?', 'Warning', {
                confirmButtonText: 'OK',
                cancelButtonText: 'Cancel',
                type: 'warning'
            }).then(() => {
                let valueState = !estado ? 1 : 0
            // Enviamos el id y el estado
                this.modifyStateProducto(id,valueState)
                this.$message({
                    type: 'success',
                    message: 'Estado Actualizado'
                });
            }).catch(() => {
                this.$message({
                    type: 'info',
                    message: 'Cancelado'
                });          
            });
        },
        modifyStateBodega(id,estado) {
            let url = 'http://localhost:8000/api/updateBodega'
            axios.post(url, {
                idBodega: id,
                estado: estado
            })
            .then( res => {
                this.traerBodegas()
                console.log(res.data)
                    
            })
            .catch( err => {
                console.log(err)
            })
        },
        modifyStateUsuario(id,estado) {
            let url = 'http://localhost:8000/api/updateUsuario'
            axios.post(url, {
                idUser: id,
                estado: estado
            })
            .then( res => {
                this.traerUsuarios()
                console.log(res.data)
            })
            .catch( err => {
                console.log(err)
            })
        },
        modifyStateProducto(id,estado) {
            let url = 'http://localhost:8000/api/updateProducto'
            axios.post(url, {
                idProduct: id,
                estado: estado
            })
            .then( res => {
                this.traerProductos()
                console.log(res.data)
            })
            .catch( err => {
                console.log(err)
            })
        },
        traerInventarios() {
            axios.get('http://localhost:8000/api/inventario')
            .then(response => {
                if (response.status == 200) {
                    this.tabla_empresa = response.data
                    this.tabla_empresa = response.data
                    let table = $('#listado_por_legal').DataTable();
                    table.clear();
                    table.rows.add(this.tabla_empresa).draw();
                    console.log(this.tabla_empresa)
                }
            })
            .catch( err => {
                console.log(err)
            })
        },
        // cambiarEstadoUsuario(){ this.$refs.cambiarEstado_User.toggle() },
        // cambiarEstadoBodega(){ this.$refs.cambiarEstado_Bod.toggle() },
        // cambiarEstadoProducto(){ this.$refs.cambiarEstado_Pro.toggle() },
        agregarProducto(){ this.$refs.modalAgregarProducto.toggle() },
        trasnferirProducto(){ this.$refs.modalTransferirProducto.toggle() },
        initDatatables(){
            let that = this;
            let listado_por_legal = $("#listado_por_legal").DataTable({
                searching:false,
                // ordering:false,
                paging:false,
                // info:false,
                data: that.tabla_empresa,
                createdRow: function (row, data, index) {
                    $(row).addClass("cursor-pointer slc-row");
                    $(row).attr('data-id', data.id);
                },
                columns:[
                    { title:'Item', data:null, className:'align-middle text-center', render(data,type,row,meta){ return meta.row + 1; } },
                    { data:'bodega', className:'align-middle' },
                    { data:'producto', className:'align-middle' },
                    { data:'cantidad', className:' text-center align-middle' },
                    { data:'fecha', className:'text-center align-middle' },
                ],
            })
        } //fin datatable
    }
}
</script>

<style lang="css" scoped>
.border-dark{
    border: 1px solid #8a8a8a
}
</style>
