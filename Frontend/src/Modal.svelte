<script>
	import AddGroupForm from "./lib/forms/AddGroupForm.svelte";
	import AddLocationForm from "./lib/forms/AddLocationForm.svelte";
	import AddUserForm from './lib/forms/AddUserForm.svelte';

	export let showModal = false; 
	export let selectedManager;


	let dialog; // HTMLDialogElement
	$: if (dialog && showModal) dialog.showModal();

	let currentHeader;
	
	let forms = {
		"Users" : AddUserForm,  
		"Groups" : AddGroupForm,
		"Locations & Access Points" : AddLocationForm
	};
</script>


<!-- If desired, put the below line within the dialog. Closes modal on outside click -->
<!-- on:click|self={() => dialog.close()} -->
{#if showModal}
<!-- svelte-ignore a11y-click-events-have-key-events a11y-no-noninteractive-element-interactions -->
	<dialog 
	bind:this={dialog}
	on:close={() => (showModal = false)}
	>
		<!-- svelte-ignore a11y-no-static-element-interactions -->
		<div on:click|stopPropagation>
			<div class="modal-x">
				<button on:click={() => (showModal = false)}> X </button>
			</div>
			<div>
				<h2>
					{currentHeader}
					<hr />
				</h2>
				<!-- Add more to the forms in order to inject anything into a modal-->
				<svelte:component this={forms[selectedManager]} bind:header={currentHeader}/>
			</div>
		</div>
	</dialog>
{/if}



<style>
	dialog {
		z-index: 10;
		/* No display: none */
		display: block;
		width: 25%;
		max-width: 32em;
		border-radius: 0.2em;
		border: none;
		padding: 0;
		background-color: white;
		color: black;
	}
	dialog::backdrop {
		background: rgba(0, 0, 0, 0.5);
	}
	dialog > div {
		padding: 1em;
	}
	dialog[open] {
		animation: zoom 0.3s cubic-bezier(0.34, 1.56, 0.64, 1);
	}
	@keyframes zoom {
	from {
		transform: scale(0.95);
		}
		to {
			transform: scale(1);
		}
	}

	dialog::backdrop {
	animation: fade 0.2s ease-out;
	}
	@keyframes fade {
		from {
			opacity: 0;
		}
		to {
			opacity: 1;
		}
	}
</style>