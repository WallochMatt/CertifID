<script>
	export let showModal; // boolean

	let dialog; // HTMLDialogElement

	$: if (dialog && showModal) dialog.showModal();
</script>

<!-- svelte-ignore a11y-click-events-have-key-events a11y-no-noninteractive-element-interactions -->
<dialog
	bind:this={dialog}
	on:close={() => (showModal = false)}
	on:click|self={() => dialog.close()}
>
	<!-- svelte-ignore a11y-no-static-element-interactions -->
	<div on:click|stopPropagation>

		<slot name="header" />
		<hr />
		<slot />

		<div class="modal-buttons">
			<!-- svelte-ignore a11y-autofocus -->
			<button class="close" autofocus on:click={() => dialog.close()}>Close</button>
			<!-- svelte-ignore a11y-autofocus -->
			<button class="save" autofocus on:click={() => dialog.close()}>Save</button> <!--Most finish a create request-->
		</div>
	</div>
</dialog>

<style>
	dialog {
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

	dialog[open]::backdrop {
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

	button {
		display: block;
		margin-left: 2em;
	}
</style>