<script>
	export let entity //to UserPage
	export let showModal = false; //to UserPage

	let dialog; // HTMLDialogElement
	$: if (dialog && showModal) dialog.showModal();
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
					<!-- The slice is to remove the S on a given entity. Seek better solution, 
						it's especially awkward for "Create New Locations & Access Point" -->
					Create New {entity.slice(0, -1)}
					<hr />
				</h2>
				<slot name="form" />
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