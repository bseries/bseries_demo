<?php
/**
 * Copyright 2017 Atelier Disko. All rights reserved.
 *
 * Use of this source code is governed by a BSD-style
 * license that can be found in the LICENSE file.
 */

namespace app\controllers;

use cms_post\models\Posts;

class PostsController extends \lithium\action\Controller {

	public function view() {
		$item = Posts::find('first', [
			'conditions' => [
				'id' => $this->request->id,
				'is_published' => true
			]
		]);
		return compact('item');
	}

	public function index() {
		$data = Posts::find('all', [
			'conditions' => [
				'is_published' => true
			]
		]);
		return compact('data');
	}
}

?>