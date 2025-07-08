Return-Path: <linux-watchdog+bounces-3843-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 827C2AFCC47
	for <lists+linux-watchdog@lfdr.de>; Tue,  8 Jul 2025 15:37:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D6F21BC193E
	for <lists+linux-watchdog@lfdr.de>; Tue,  8 Jul 2025 13:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7A5029E10A;
	Tue,  8 Jul 2025 13:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NtwkJ++E"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C5B2DE1FA;
	Tue,  8 Jul 2025 13:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751981818; cv=none; b=PaCj2bXEg2Tga3phUdSO3zMTE9nIgwMdErSHajUUq1N/C+N8vHO0EYj8ZfkcEBrdUNjQ+RCzcxtyI3eDJ2pPZUAnTvcAEljVCntNILyFDRgvlB68ZRDZBXiqV/dpJkOqJUNAZFBPqL16NSenJBpb0+9GL7YGZ98h21vTFC95NbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751981818; c=relaxed/simple;
	bh=Ap4QDUCyJPxPrr7O+kWeU2vEKmpGvwyPkXTCOZocQuA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qSSx7R7DhgZD9vzseZwMsvxcIfM5zx3/18WsGb6uw9c288tc3UzIkoz77ET6GLZINP4K8HgEzGeX5Bu3C944JDJKRmhdS5kQK/00bDr7bmXgv06Adg1RMmIOB9qoSPeYKGtb0B2JV34SIsFFtwHbfxSscblj8JxPyOpgjqt041M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NtwkJ++E; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751981817; x=1783517817;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ap4QDUCyJPxPrr7O+kWeU2vEKmpGvwyPkXTCOZocQuA=;
  b=NtwkJ++El+LaOC/0xan/TAi1HHXSzRUjlOwaDvEDN2JAgSMHZ53Vt+1A
   9GenG5u0V5cYyjvmCQIIVkD6yWFw+YBWcHWzX/wlNp1ErajHCu64ilZg9
   qKRmin/kDYiUydZiugVSicyS3OtNNGVLfSRMyeR2SkuExBfxJLjRyD66B
   phi3PBjOBsdslrUM0e4ey2+Zs29y98wTSt4L/hUHx4nApniwDAM3mp+Ct
   i+4MQdEcYkQyLSVUvtaa3hUqXyrhYHQqqeF5Z7I391u9QsDBKfllpnpu6
   7Pa+o+ipXFnVCiuD5y0gxEBPFzQYpjvORZu3O5UCkOmE3y/T6l5kaFG4S
   g==;
X-CSE-ConnectionGUID: iZCjxWrgR12ra4BunGR+KA==
X-CSE-MsgGUID: O9nNrlqoQJu+6rkzRistFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="65678021"
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; 
   d="scan'208";a="65678021"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 06:36:52 -0700
X-CSE-ConnectionGUID: gzsweEymR/2qSsfrsnjqFQ==
X-CSE-MsgGUID: qE4cxclKQiO2bTvfNsn7gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; 
   d="scan'208";a="154909699"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa006.jf.intel.com with ESMTP; 08 Jul 2025 06:36:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 69BC71B7; Tue, 08 Jul 2025 16:36:48 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Guenter Roeck <linux@roeck-us.net>,
	James Hilliard <james.hilliard1@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: [PATCH v3 0/2] watchdog: Don't use "proxy" inclusions
Date: Tue,  8 Jul 2025 16:33:42 +0300
Message-ID: <20250708133646.70384-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update header inclusions to follow IWYU (Include What You Use)
principle.

Note that kernel.h is discouraged to be included as it's written
at the top of that file.

Changelog v3:
- added prerequisite to avoid compilation errors (LKP, Guenter)

Andy Shevchenko (2):
  watchdog: it87_wdt: Don't use "proxy" headers
  watchdog: Don't use "proxy" headers

 drivers/watchdog/it87_wdt.c            |  4 +++-
 drivers/watchdog/watchdog_core.h       |  8 +++++++-
 drivers/watchdog/watchdog_pretimeout.c |  2 ++
 include/linux/watchdog.h               | 12 ++++++++----
 4 files changed, 20 insertions(+), 6 deletions(-)

-- 
2.47.2


