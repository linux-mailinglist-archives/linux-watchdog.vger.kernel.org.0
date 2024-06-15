Return-Path: <linux-watchdog+bounces-1141-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C256C909895
	for <lists+linux-watchdog@lfdr.de>; Sat, 15 Jun 2024 16:12:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8A5F1C20EE3
	for <lists+linux-watchdog@lfdr.de>; Sat, 15 Jun 2024 14:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F83C1E511;
	Sat, 15 Jun 2024 14:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="qI3n7Y4n"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C669917BB6
	for <linux-watchdog@vger.kernel.org>; Sat, 15 Jun 2024 14:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718460736; cv=none; b=Juh0MTDcZmZYgStYxIdcjZAu4U1yk7Nn7s6XYQ3iaFs8iVun+YmO/Q6zUp8htQctEEG7Ivao0gYgj5/FduvP4hQQhU9birjN7ZL5a0bVtg4FT84qqTqmuApDP8jwWmN56wTgmWx0lMDILbRfM2B+mf/3R2xGv/D3Cd5O4+of0h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718460736; c=relaxed/simple;
	bh=ysppDQEkB6tYTT8MEXmTW3fSf1MCmntTplromX3pjaU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AQVNETjNEXLENkahnuQzTQJhMv5O26Z2xJcdInZJYNVI7LvsVzRdQluIfIOfknHpwYk/MfoYjjGdyGT3dZPEmTLrbGY9oGBGO5h5j8TjGwwsx1zHB8Khhnmc8+dw5DH6drfkAPY4tT3I0kkLoUbluflDEip+PHvKo+Pne5vvlaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=qI3n7Y4n; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=ieKug
	Uq21pkO9EAjGILHNEFhB1VEmDQbP/Q7G3lCUXU=; b=qI3n7Y4ndoVNpgZKX/U5R
	/OouuP3zPFbxYm8UofZxX7WJSxnchNeKPRqkvMwNL4JTzWXkfFp0pPu4qa2RQSMv
	A8qZQlm0gIhJt9MMVIE61Y10ikvS7Vn/7p57CczvPSiOiRYXQJVAH2YupA46IiqN
	uZ+7mIZ1vGuLMveRDHq5EY=
Received: from lq-VirtualBox.. (unknown [118.112.88.81])
	by gzga-smtp-mta-g1-2 (Coremail) with SMTP id _____wDXP5b0oG1mjrqZHA--.46791S2;
	Sat, 15 Jun 2024 22:11:00 +0800 (CST)
From: LongQiang <lqking7735@163.com>
To: wim@linux-watchdog.org
Cc: linux@roeck-us.net,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-watchdog@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	LongQiang <lqking7735@163.com>
Subject: [PATCH] watchdog: imx2_wdg: Save the actual timeout value
Date: Sat, 15 Jun 2024 22:10:59 +0800
Message-ID: <20240615141059.345076-1-lqking7735@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDXP5b0oG1mjrqZHA--.46791S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xr4DuFWrXw1rCFyfGFyDJrb_yoW3Grg_Cr
	97tw42grs8Gr1IyF45Xw17Ary0gF1UW3WxZa1IgFWfu3srA3y5G3yqg34kZF1Uua18tr98
	Ar4kXr4FkF97CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRNZXo7UUUUU==
X-CM-SenderInfo: potnx0zjxxjki6rwjhhfrp/1tbiLBj+QGXAmf4Y7QAAs9

When setting the timeout, the effective timeout value should be saved.
Otherwise, the illegal timeout will take effect at 'start'.

Signed-off-by: LongQiang <lqking7735@163.com>
---
 drivers/watchdog/imx2_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/imx2_wdt.c b/drivers/watchdog/imx2_wdt.c
index 42e8ffae18dd..d4a4d4c58c3f 100644
--- a/drivers/watchdog/imx2_wdt.c
+++ b/drivers/watchdog/imx2_wdt.c
@@ -196,7 +196,7 @@ static int imx2_wdt_set_timeout(struct watchdog_device *wdog,
 
 	actual = min(new_timeout, IMX2_WDT_MAX_TIME);
 	__imx2_wdt_set_timeout(wdog, actual);
-	wdog->timeout = new_timeout;
+	wdog->timeout = actual;
 	return 0;
 }
 
-- 
2.43.0


