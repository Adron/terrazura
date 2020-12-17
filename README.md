# terrazura

Last week of 2020, I'm going to present a Hasura, Azure, and Terraform stream session on Twitch. This is what I'm going to cover, and it'll all go into this repository. If you'd like to watch this session, star this repo and it'll get updated at 10am PT on Wednesday the 30th. The channel I'll be streaming on, is [Thrashing Code @ Twitch](https://www.twitch.tv/thrashingcode). Star this repo (*ya know, the button up in the top right, <span>Star</span>), [Follow](https://www.twitch.tv/thrashingcode) my Twitch channel, and I'll see you there. 🤘

<div class="d-block js-toggler-container js-social-container starring-container ">
    <form class="starred js-social-form" action="/Adron/terrazura/unstar" accept-charset="UTF-8" method="post"><input type="hidden" name="authenticity_token" value="eq8cdR6IP6OTJqhrSaIkw1RVFgn9jTPZfdvP1FwDD4eWzKAR6fE+L/L0PJOJdz47R6dTCSFs9e8SK+F+DflMIw==">
      <input type="hidden" name="context" value="repository">
      <button type="submit" class="btn btn-sm btn-with-count  js-toggler-target" aria-label="Unstar this repository" title="Unstar Adron/terrazura" data-hydro-click="{&quot;event_type&quot;:&quot;repository.click&quot;,&quot;payload&quot;:{&quot;target&quot;:&quot;UNSTAR_BUTTON&quot;,&quot;repository_id&quot;:322138829,&quot;originating_url&quot;:&quot;https://github.com/Adron/terrazura/edit/main/README.md&quot;,&quot;user_id&quot;:278870}}" data-hydro-click-hmac="5128a54bd7fe3cdababc4f96c634715f46f1954879258f236a6860b3a0604646" data-ga-click="Repository, click unstar button, action:blob#edit; text:Unstar">        <svg class="octicon octicon-star-fill mr-1" height="16" viewBox="0 0 16 16" version="1.1" width="16" aria-hidden="true"><path fill-rule="evenodd" d="M8 .25a.75.75 0 01.673.418l1.882 3.815 4.21.612a.75.75 0 01.416 1.279l-3.046 2.97.719 4.192a.75.75 0 01-1.088.791L8 12.347l-3.766 1.98a.75.75 0 01-1.088-.79l.72-4.194L.818 6.374a.75.75 0 01.416-1.28l4.21-.611L7.327.668A.75.75 0 018 .25z"></path></svg>
        <span>
          Unstar
</span></button>        <a class="social-count js-social-count" href="/Adron/terrazura/stargazers" aria-label="0 users starred this repository">
           0
        </a>
</form>
    <form class="unstarred js-social-form" action="/Adron/terrazura/star" accept-charset="UTF-8" method="post"><input type="hidden" name="authenticity_token" value="cMcbStMqJA1/4p8SAmG2/7vAR4L6R7HMKXJ2GwxAK/B66LL2MfnLZ1CBOpoEKN2WZnlzqcYUWJY748mMBCThYQ==">
      <input type="hidden" name="context" value="repository">
      <button type="submit" class="btn btn-sm btn-with-count  js-toggler-target" aria-label="Unstar this repository" title="Star Adron/terrazura" data-hydro-click="{&quot;event_type&quot;:&quot;repository.click&quot;,&quot;payload&quot;:{&quot;target&quot;:&quot;STAR_BUTTON&quot;,&quot;repository_id&quot;:322138829,&quot;originating_url&quot;:&quot;https://github.com/Adron/terrazura/edit/main/README.md&quot;,&quot;user_id&quot;:278870}}" data-hydro-click-hmac="151737e25a150442ea629ef1eee87164a39bfcb8fa8e33249945f53044dd1f6f" data-ga-click="Repository, click star button, action:blob#edit; text:Star">        <svg class="octicon octicon-star mr-1" height="16" viewBox="0 0 16 16" version="1.1" width="16" aria-hidden="true"><path fill-rule="evenodd" d="M8 .25a.75.75 0 01.673.418l1.882 3.815 4.21.612a.75.75 0 01.416 1.279l-3.046 2.97.719 4.192a.75.75 0 01-1.088.791L8 12.347l-3.766 1.98a.75.75 0 01-1.088-.79l.72-4.194L.818 6.374a.75.75 0 01.416-1.28l4.21-.611L7.327.668A.75.75 0 018 .25zm0 2.445L6.615 5.5a.75.75 0 01-.564.41l-3.097.45 2.24 2.184a.75.75 0 01.216.664l-.528 3.084 2.769-1.456a.75.75 0 01.698 0l2.77 1.456-.53-3.084a.75.75 0 01.216-.664l2.24-2.183-3.096-.45a.75.75 0 01-.564-.41L8 2.694v.001z"></path></svg>
        <span>
          Star
</span></button>        <a class="social-count js-social-count" href="/Adron/terrazura/stargazers" aria-label="0 users starred this repository">
          0
        </a>
</form>  </div>

* Setup of infrastructure as code using Terraform.
* Setup of GraphQL API Hasura Server.
* Setup of Dev AND Live *Prod* Deployment using Docker & Terraform.
* Build out of our initial Database Schema.
* Deployment of the database schema to Hasura using Hasura CLI Migrations.
* Coverage of basic GraphQL and looking into introspection, queries, mutations, and subscriptions.
