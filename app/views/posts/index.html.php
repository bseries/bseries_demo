<?php

$this->title('Posts');

?>
<main class="cp limit--normal">
	<h1>Posts</h1>
	<?php foreach ($data as $item): ?>
		<article>
			<h2><?= $this->html->link($item->title, ['action' => 'view', 'id' => $item->id]) ?></h2>
			<div>
				<?= $this->editor->parse($item->teaser, ['mediaVersion' => 'fix00']) ?>
			</div>
		</article>
	<?php endforeach ?>
</main>