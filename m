Return-Path: <linux-watchdog+bounces-2764-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E56A1C70B
	for <lists+linux-watchdog@lfdr.de>; Sun, 26 Jan 2025 09:39:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55978166FCD
	for <lists+linux-watchdog@lfdr.de>; Sun, 26 Jan 2025 08:39:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D83958633F;
	Sun, 26 Jan 2025 08:39:03 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9139555887;
	Sun, 26 Jan 2025 08:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737880743; cv=none; b=iWovWInwSCUFh141gKxWi8kcDPZ3EquM7abn4AlgMcGCaERkxBBuflIbahrxqmIbN3qYHPHrjxtPTf8eaoiLywglJ6wqGdB5zb8gc2Q9MSS1U51LgauRIGIGo8k5NC9HHCdJZRG+lOaghM6qLqd8Ex8XeJ8FIt3BAPQbKDLBG48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737880743; c=relaxed/simple;
	bh=ejd38fcKbB9wMeiebZKeA40aVdeh6JT412Ml8XptxVQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nkzq9Dx29DKsRiFKr72gywv50ZcBSJyngp/YTHUdQ1GRVzQHMpToyjfHMX4rn17BO9g0QVyc+5Wb56CjG/s1lyqnqHWs/J1OL3qYYuEx1C6CmV159gozzl9k18Vu3hB4254h2sfYGo8ORflGrwgSujo3L+bsKy681VbaJa8/7kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4YglHT3DNcz2Fc6Q;
	Sun, 26 Jan 2025 16:35:33 +0800 (CST)
Received: from kwepemk100005.china.huawei.com (unknown [7.202.194.53])
	by mail.maildlp.com (Postfix) with ESMTPS id 9DA521402C1;
	Sun, 26 Jan 2025 16:38:57 +0800 (CST)
Received: from huawei.com (10.175.101.6) by kwepemk100005.china.huawei.com
 (7.202.194.53) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sun, 26 Jan
 2025 16:38:56 +0800
From: Liu Chao <liuchao173@huawei.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>,
	<linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <caihe@huawei.com>, <lixiaokeng@huawei.com>
Subject: [PATCH] watchdog: only print critical log when the watchdog fails to be stopped
Date: Sun, 26 Jan 2025 11:38:50 +0300
Message-ID: <20250126083850.34623-1-liuchao173@huawei.com>
X-Mailer: git-send-email 2.23.0
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemk100005.china.huawei.com (7.202.194.53)

Every time the user echoes 0 > /dev/watchdog0, meaningless critical log
is printed.

Signed-off-by: Liu Chao <liuchao173@huawei.com>
---
 drivers/watchdog/watchdog_dev.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index e2bd266b1b5b..0a9d5e6f3a88 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -960,14 +960,15 @@ static int watchdog_release(struct inode *inode, struct file *file)
 	if (!watchdog_active(wdd))
 		err = 0;
 	else if (test_and_clear_bit(_WDOG_ALLOW_RELEASE, &wd_data->status) ||
-		 !(wdd->info->options & WDIOF_MAGICCLOSE))
+		 !(wdd->info->options & WDIOF_MAGICCLOSE)) {
 		err = watchdog_stop(wdd);
+		if (err < 0)
+			pr_crit("watchdog%d: watchdog did not stop!\n", wdd->id);
+	}
 
 	/* If the watchdog was not stopped, send a keepalive ping */
-	if (err < 0) {
-		pr_crit("watchdog%d: watchdog did not stop!\n", wdd->id);
+	if (err < 0)
 		watchdog_ping(wdd);
-	}
 
 	watchdog_update_worker(wdd);
 
-- 
2.23.0


