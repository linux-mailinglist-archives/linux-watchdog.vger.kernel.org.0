Return-Path: <linux-watchdog+bounces-1668-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 096C39690E6
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Sep 2024 03:27:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90BD428403C
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Sep 2024 01:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9480F19E989;
	Tue,  3 Sep 2024 01:27:35 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4011CC8A0;
	Tue,  3 Sep 2024 01:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725326855; cv=none; b=uuGGZUEXRw6V/ohdMs0IoN0HPbFC2frTx6/xWNbC+pa1616QmAwEQNlfjibvLca3zseVpMXUU/RtV7rThs/01PWIyT/OgUnhRiRI3osjkn2WmJOJM6thyMNKt8WW9sgqm/HugWyvaIHOTSu87g/MTMMcnGHxWm0FOCfe7NlTNXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725326855; c=relaxed/simple;
	bh=3yE4T0slWdfNmUM+tni8P1m0CjryFGYJPC8UzMQC9MU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cwo4Fi81lv3cNFbwiZNuM0J6A8PfX6uH8utBk3llHEG3djR0N0lEmHUm/L3R/ZIyjkOzZX/oYEkvbdK2akYIpIGMDTP2LAWuLSWbri8Ghyot6e8Y4o4+s34UYJtlAwKgowEA6IHBuv7hLu361Fn/42m9YLSHKO8J9eBQdwIRVAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-05 (Coremail) with SMTP id zQCowAA3GuryZdZm05DOAA--.43913S2;
	Tue, 03 Sep 2024 09:27:14 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH v2] watchdog: iTCO_wdt: Convert comma to semicolon
Date: Tue,  3 Sep 2024 09:26:20 +0800
Message-Id: <20240903012620.204247-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAA3GuryZdZm05DOAA--.43913S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Jw4UZF15Zr47Jw4fZw17Awb_yoW3tFgEka
	47urs7Gr1UKF10kF17Zw1rCryFvrZ8XF1xuFnYqrZak3srJryUX3yFqryktw45X3WUZF17
	AFs8XryYgF17CjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbsxFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJV
	WxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1lc2xSY4AK67AK6w4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0x
	ZFpf9x0JU9L05UUUUU=
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Replace a comma between expression statements by a semicolon.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
Changelog:

v1 -> v2:

1. Drop Fixes tag.
---
 drivers/watchdog/iTCO_wdt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
index 264857d314da..35b358bcf94c 100644
--- a/drivers/watchdog/iTCO_wdt.c
+++ b/drivers/watchdog/iTCO_wdt.c
@@ -563,8 +563,8 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
 	}
 
 	ident.firmware_version = p->iTCO_version;
-	p->wddev.info = &ident,
-	p->wddev.ops = &iTCO_wdt_ops,
+	p->wddev.info = &ident;
+	p->wddev.ops = &iTCO_wdt_ops;
 	p->wddev.bootstatus = 0;
 	p->wddev.timeout = WATCHDOG_TIMEOUT;
 	watchdog_set_nowayout(&p->wddev, nowayout);
-- 
2.25.1


