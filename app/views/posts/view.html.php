<?php

$this->title('Post: ' . $item->title);

?>
<main class="cp limit--normal">
	<h1><?= $item->title ?></h1>

	<?php if ($cover = $item->cover()): ?>
		<?= $this->media->image($cover->version('fix00')) ?>
	<?php endif ?>

	<div>
		<?= $this->editor->parse($item->body, ['mediaVersion' => 'fix00']) ?>
	</div>
</main>