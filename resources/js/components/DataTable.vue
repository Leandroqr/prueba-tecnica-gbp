<template>

	<table class="table table-striped-primary br-5" ref="auxTabla" :value="set_valor" :class="[estilos,tipo]" style="overflow: hidden;">
		<thead>
			<slot name="head"></slot>
		</thead>
		<tbody></tbody>
		<tfoot>
			<slot name="footer"></slot>
		</tfoot>
	</table>

</template>

<script>
import 'datatables.net-bs4'
import 'datatables.net-fixedcolumns-bs4'


export default {
	name:'DataTable',
	props:{
		tipo:{
			type:String
		},
		estilos:{
			type:String
		},
		value:{},
		arreglo:{
			type:Array,
			required:true,
			default:{
				columns:[]
			}
		},
		configuracion:{
			type:Object,
			required:true,
		},
		depurar:{
			default:false
		}
	},
	data(){
		return {
			instancia:null,
		}
	},
	created(){
		if (this.arreglo.length) {
			this.configuracion.data = this.arreglo;
		}
		this.configuracion.creado_por={
			desarrollador:'Carlos Sanchez Acero',
			fecha:'2019-03-01 08:38',
			info:'Desarrollado para Grupo bien pensado. De Colombia para el mundo pa pa',
		}
		this.configuracion.language = {
			sProcessing:     "Procesando...",
			sLengthMenu:     "Mostrar _MENU_ registros",
			sZeroRecords:    "No se encontraron resultados",
			sEmptyTable:     "Ningún dato disponible en esta tabla",
			sInfo:           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
			sInfoEmpty:      "Mostrando registros del 0 al 0 de un total de 0 registros",
			sInfoFiltered:   "(filtrado de un total de _MAX_ registros)",
			sInfoPostFix:    "",
			sSearch:         "Buscar:",
			sUrl:            "",
			sInfoThousands:  ",",
			sLoadingRecords: "Cargando...",
			oPaginate: {
				sFirst:    "Primero",
				sLast:     "Último",
				sNext:     "Siguiente",
				sPrevious: "Anterior"
			},
			oAria: {
				sSortAscending:  ": Activar para ordenar la columna de manera ascendente",
				sSortDescending: ": Activar para ordenar la columna de manera descendente"
			}
		}
	},
	mounted(){

		this.inicializar();

	},
	watch:{
		arreglo(a,b){

			if (a){

				this.instancia.clear().draw();
				this.instancia.rows.add(a).draw();
			}

		}
	},
	methods:{
		getRow(e){
			return this.instancia.row(e.target.closest('tr'));
		},
		getRowData(e){
			return this.instancia.row(e.target.closest('tr')).data();
		},
		set_valor(e){
			this.$emit('input',e);
		},
		inicializar(){
			let that = this;
			that.instancia = $(that.$refs.auxTabla).DataTable(that.configuracion);

		}
	},
	destroyed(){

		this.instancia.destroy();
		this.instancia = null;
		

	}
}
</script>
<style lang="scss">
@import '~@sass/gbp.scss';

.tabla-gbp-1{
	font-size: 11px !important;

	thead{
		th{
			font-size: 11px !important;
			background-color: $azul4;
			color: white;
			text-align: center;
		}

		table{
			color:#fff;
			background-color: #007bff;
		}


	}
	tbody{
		tr{
			transition: .4s;

			&:hover{
				transition: .4s;
				background-color: $gris-terciary;
			}

			td{
				vertical-align: middle !important;
			}
			color: #6c757d;


		}
	}

}
</style>
