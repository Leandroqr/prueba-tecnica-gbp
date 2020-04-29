<template>
    <section class="conf-section m-3 p-3">
        <div class="row mx-0">
            <div class="col-xl-4">
                <div class="">
                    <div class="row mx-0">
                        <b class="mr-2 my-auto">Bodegas 6876</b>
                        <el-popover
                        placement="bottom"
                        title="Crear bodega"
                        width="240"
                        trigger="click"
                        >
                            <div class="row mx-0 my-2">
                                <div class="col">
                                    <label>Nombre Bodega</label>
                                    <input type="text" class="form-control" name="" value="" />
                                </div>
                            </div>
                            <div class="row mx-0 my-2">
                                <div class="col">
                                    <label>Responsable</label>
                                    <el-select v-model="value" placeholder="Select">
                                        <el-option
                                        v-for="item in options"
                                        :key="item.value"
                                        :label="item.label"
                                        :value="item.value"
                                        />
                                    </el-select>
                                </div>
                            </div>
                            <div class="row mx-0 mt-2 justify-content-end">
                                <button type="button" class="btn btn-sm btn-light mr-2" name="button">Cerrar</button>
                                <button type="button" class="btn btn-sm btn-primary" name="button">Guardar</button>
                            </div>
                        <i slot="reference" class="mdi mdi-plus-circle f-22 cr-pointer" />
                    </el-popover>
                    </div>
                    <div class="row mx-0 my-3">
                        <p class="mx-2 my-auto">Bodega 1</p>
                        <el-tooltip class="item" effect="light" content="Roberto Gómez Bolaños" placement="top">
                            <img class="rounded-circle mx-2 obj-cover" height="40" width="40" src="https://www.economist.com/sites/default/files/images/print-edition/20200208_LDD001_0.jpg" alt="" />
                        </el-tooltip>
                        <button
                        type="button"
                        :class="`btn btn-sm my-auto ${respBodega?'btn-success':'btn-danger'}`"
                        name="button"
                        @click="cambiarEstadoUsuario"
                        >{{respBodega?'Activo':'Inactivo'}} </button>
                    </div>
                </div>
                <div class="">
                    <div class="row mx-0 justify-conent-center">
                        <b class="mr-2 my-auto">Usuarios</b>
                        <i class="mdi mdi-plus-circle f-22 cr-pointer" />
                    </div>
                    <div class="row mx-0 my-3">
                        <div class="custom-control custom-switch">
                            <input type="checkbox" class="custom-control-input" id="usuarioActivo">
                            <label class="custom-control-label" for="usuarioActivo">Maria Antonieta</label>
                        </div>
                    </div>
                </div>
                <div class="">
                    <div class="row mx-0 justify-conent-center">
                        <b class="mr-2 my-auto">Productos</b>
                        <i class="mdi mdi-plus-circle f-22 cr-pointer" />
                    </div>
                    <div class="row mx-0 my-3">
                        <p class="mx-2 my-auto">Tenis nike</p>
                        <button type="button" :class="`btn btn-sm ${product?'btn-success':'btn-danger'}`" name="button" @click="product=!product">{{product?'Activo':'Inactivo'}}</button>
                    </div>
                </div>
            </div>
            <div class="col-xl-8">
                <div class="row mx-0 my-3">
                    <div class="col-auto d-flex">
                        <label class="mr-2">Rojo</label>
                        <div class="custom-control custom-switch">
                            <input type="checkbox" class="custom-control-input" id="ColorTabla">
                            <label class="custom-control-label" for="ColorTabla">Azul</label>
                        </div>
                    </div>
                    <el-tooltip class="item" effect="light" content="Agregar producto" placement="top">
                        <i class="mdi mdi-plus-box ml-auto cr-pointer mr-2 f-25" @click="agregarProducto" />
                    </el-tooltip>
                    <el-tooltip class="item" effect="light" content="Transferir producto" placement="top">
                        <div class="border cr-pointer d-flex my-auto align-items-center justify-content-center" style="width:26px;height:26px;" @click="trasnferirProducto">
                            <i class="mdi mdi-reload f-20 mx-2" />
                        </div>
                    </el-tooltip>
                </div>
                <div class="row mx-0 my-3">
                    <div class="col overflow-auto">
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
            </div>
        </div>
        <modal-agregar-producto ref="modalAgregarProducto" />
        <modal ref="cambiarEstado" titulo="Cambiar estado usuario">
            <div class="row mx-0 my-3 justify-content-center">
                ¿Está seguro de Activar/Desactivar este usuario?
            </div>
            <div class="row mx-0 mt-2 justify-content-end bg-whitesmoke py-2">
                <button type="button" class="btn btn-sm btn-secondary mr-2" name="button">Cerrar</button>
                <button type="button" class="btn btn-sm btn-primary" name="button">Guardar</button>
            </div>
        </modal>
    </section>
</template>
<!-- https://datatables.net/manual/ -->
<!-- https://element.eleme.io/#/es -->

<script>
export default {
    components: {
        // modalAgregarProducto: () => import('./modales/modalAgregarProducto'),
        // modalTransferirProducto: () => import('./modales/modalTransferirProducto'),
        // modal: () => import('~/components/modal')
    },
    data(){
        return {
            respBodega: false,
            product: false,
            colorTabla: 0,
            options: [{
                value: 'Option1',
                label: 'Option1'
            }, {
                value: 'Option2',
                label: 'Option2'
            }, {
                value: 'Option3',
                label: 'Option3'
            }, {
                value: 'Option4',
                label: 'Option4'
            }, {
                value: 'Option5',
                label: 'Option5'
            }],
            value: '',
            tabla_empresa:[
                // { bodega: "Bodega 1",producto: "MFDA12678934501", cantidad: 5, fecha:'12/15/7894' },
                // { bodega: "Bodega 2",producto: "MFDA12678934501", cantidad: 15, fecha:'12/15/7894' },
                // { bodega: "Bodega 3",producto: "MFDA12678934501", cantidad: 25, fecha:'12/15/7894' },
                // { bodega: "Bodega 4",producto: "MFDA12678934501", cantidad: 35, fecha:'12/15/7894' },
                // { bodega: "Bodega 5",producto: "MFDA12678934501", cantidad: 45, fecha:'12/15/7894' },
            ],
        }
    },
    mounted(){
        this.initDatatables();
    },
    methods: {
        cambiarEstadoUsuario(){
            // this.$refs.cambiarEstado.toggle()
        },
        agregarProducto(){
            // this.$refs.modalAgregarProducto.toggle()
        },
        trasnferirProducto(){
            // this.$refs.modalTransferirProducto.toggle()
        },
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
                    {
                        title:'Item',
                        data:null,
                        className:'align-middle text-center',
                        render(data,type,row,meta){
                            return meta.row + 1;
                        }
                    },
                    {
                        data:'bodega',
                        className:'align-middle'
                    },
                    {
                        data:'producto',
                        className:'align-middle'
                    },
                    {
                        data:'cantidad',
                        className:' text-center align-middle'
                    },
                    {
                        data:'fecha',
                        className:'text-center align-middle'
                    },
                ],

            })
        } //fin datatable
    }
}
</script>

<style lang="css" scoped>
</style> -->
