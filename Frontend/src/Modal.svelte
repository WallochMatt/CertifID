<script>
	export let showModal = false;
	let dialog; // HTMLDialogElement

	$: if (dialog && showModal) dialog.showModal();
</script>


<!-- svelte-ignore a11y-click-events-have-key-events a11y-no-noninteractive-element-interactions -->
<dialog class="create-modal"
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
