<?php
/**
 * Copyright 2013 David Persson. All rights reserved.
 * Copyright 2016 Atelier Disko. All rights reserved.
 *
 * Use of this source code is governed by a BSD-style
 * license that can be found in the LICENSE file.
 */

namespace app\controllers;

use cms_social\models\Stream;
use cms_post\models\Posts;
use indexed\Robots;

class PagesController extends \lithium\action\Controller {

	public function home() {
		// Display the first promoted post on the homepage.
		$post = Posts::find('first', [
			'conditions' => [
				'is_promoted' => true,
				'is_published' => true
			]
		]);
		$stream = Stream::find('all', [
			'conditions' => [
				'is_published' => true
			]
		]);
		return compact('post', 'stream');
	}

	public function imprint() {}

	// Allows to advice crawler behavior. By default allows any crawler to crawl anything.
	// Do not block access to media or assets as they are needed to render a preview of
	// the site or for image search.
	//
	// For usage see https://github.com/davidpersson/indexed
	//
	// Security: Do not block access to /admin as that would
	//           give attackers a hint where to look for. /admin
	//           should not be accessible by crawlers already.
	public function robots() {
		$robots = new Robots();
		$robots->allow('/');
		return compact('robots');
	}
}

?>