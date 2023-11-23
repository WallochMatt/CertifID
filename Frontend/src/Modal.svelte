<script>
	export let entity
	export let showModal = false;

	function closeModal(){
		showModal = false;
	}

</script>



{#if showModal}
<!-- svelte-ignore a11y-click-events-have-key-events a11y-no-noninteractive-element-interactions -->
	<dialog class="create-modal">
		<!-- svelte-ignore a11y-no-static-element-interactions -->
		<div class="actualModal" on:click|stopPropagation>
			
			<h2>
				Create New {entity}
			</h2>
			<hr />

			<slot name="form" {closeModal}/>

			<!-- <slot name="modalButtons" /> -->


		</div>
	</dialog>
{/if}
