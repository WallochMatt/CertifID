<!-- Users need: last name, firstname, location group, title -->

<script>
    import PageHeader from "../PageHeader.svelte";

    export let showModal = false;

    // api call? users will become a request -- title, group and location will likely take a numbered key
    let users = [{
        "firstName" : "Chad",
        "lastName" : "Gouin",
        "location" : "Hales Corners",
        "group" : 1,
        "title" : "Technician",
        "image" : null,
    }, 
    {
        "firstName" : "Chris",
        "lastName" : "Haliga",
        "location" : "Milwaukee",
        "group" : 1,
        "title" : "Software Engineer II",
        "image" : null,
    }
    ];

    let colors = ["red", "blue", "green", "pink"];

    (function() {
        "use strict";
        var tableItems = document.querySelectorAll(".task");
        for ( var i = 0, len = tableItems.length; i < length; i++) {
            var tableItem = tableItem[i];
            contextMenuListener(tableItem);
        }

        function contextMenuListener(el) {
        el.addEventListener( "contextmenu", function(e) {
            console.log(e, el);
        });
    }
    })();
</script>


<main>
    <PageHeader bind:showModal = {showModal} currentPage = {"Users"}/>

    <table class="data-table">
        <thead>
            <tr>
                <th>
                    <input type="checkbox" /> <!--bind to all users? -->
                </th>
                <th>Users({users.length})</th>
                <th>Locations()</th>
                <th>Groups()</th>
                <th>Title</th>
                <th></th>
            </tr>
        </thead>

        <tbody>
            {#each users as user, index}

                <tr class="listed-user"> 
                    <td>
                        <input type="checkbox" /> <!--bind to user? -->
                    </td>
                    <td style="display: inline-flex;">

                        <!-- Come back to this with actual images -->
                        <button type="button" class="profile" style="background-color: {colors[index]}">
                            {#if user.image === null}
                                {user.firstName[0]}{user.lastName[0]}
                            {:else}
                                <img src="-{user.image}" alt="-{user.firstName}'s Profile Picture"/>
                            {/if}
                        </button>

                        <p>{user.lastName} , {user.firstName}</p>
                    </td>
                    <td>{user.location}</td>
                    <td>{user.group}</td>
                    <td>{user.title}</td>
                    <td class="final-col">
                        <button type="button" class="list-more-options">...</button>
                    </td>
                </tr>
            {/each}
        </tbody>
    </table>
</main>

