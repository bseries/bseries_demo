<?php

use base_core\base\Sites;

// The Sites class gives us access to Site objects, where each has a title and a FQDN.
// Each app can host multiple Sites if needed.
$site = Sites::current($this->_request);

// Usually we automatically add the application's name to the title so `$this->title('Lorem')`
// would result in `Lorem - App`. The home page is treated a little different, as to allowing
// claims and full control over the title. Thus `$this->title('App: Lorem')` will result in
// `App: Lorem`.
//
// @see app/views/layouts/default.html.php
// @see base_core\extensions\helper\Seo::title()
//
$this->title($site->title());

?>
<main class="home cp limit--normal">
	<h1 class="h--alpha">Home</h1>
	<p>
		Welcome to the B–Series Demonstration Website!
	</p>
	<?php if ($post): ?>
	<section class="promoted-post">
		<article>
			<h2>Promoted Post of the Day: <?= $post->title ?></h2>
			<div>
				<?= $this->editor->parse($post->teaser, ['mediaVersion' => 'fix00']) ?>
			</div>
			<?= $this->html->link('Read more…', [
				'controller' => 'Posts', 'action' => 'view', 'id' => $post->id
			]) ?>
		</article>
	</section>
	<?php endif ?>
	<?php if ($stream->count()): ?>
	<section class="social-stream">
		<h2>Our Tweets</h2>
		<?php foreach ($stream as $item): ?>
			<article>
				<h3><?= $item->title ?></h3>
				<div>
					<?php echo $item->body ?>
				</div>
			</article>
		<?php endforeach ?>
	</section>
	<?php endif ?>
</main>