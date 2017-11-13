<?php

$this->title('Post: ' . $item->title);

?>
<main class="cp limit--normal">
	<h1><?= $item->title ?></h1>

	<?php if ($cover = $item->cover()): ?>
		<?php if ($cover->scheme() === 'vimeo'): ?>
			<iframe src="https://player.vimeo.com/video/<?php echo $cover->path() ?>?title=0&byline=0&portrait=0" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
		<?php else: ?>
			<?= $this->media->image($cover->version('fix00')) ?>
		<?php endif ?>
	<?php endif ?>

	<div>
		<?= $this->editor->parse($item->body, ['mediaVersion' => 'fix00']) ?>
	</div>
</main>