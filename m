Return-Path: <linux-watchdog+bounces-1638-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D775965920
	for <lists+linux-watchdog@lfdr.de>; Fri, 30 Aug 2024 09:54:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BC411C20309
	for <lists+linux-watchdog@lfdr.de>; Fri, 30 Aug 2024 07:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1CE11509A8;
	Fri, 30 Aug 2024 07:54:13 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5A1380
	for <linux-watchdog@vger.kernel.org>; Fri, 30 Aug 2024 07:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725004453; cv=none; b=ekxxd1tc06lK2neGqoFI4dfLCt9/8gF9DEyfP9cKQqiJXE5Hu2KsufukTt8eL4pkb7B8qiT+mV8QHXU3eM/zfMc7dovnPiBITcFSQxPE8GyihNzX1f1ZoF9tyrDnmhJSol8YoVJz0J5TXLK/2fqRs7qBW0AjQqhhiXZdxvJqTJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725004453; c=relaxed/simple;
	bh=RQsbkrzcvjS2aGIyv75Nx+FzgXqvDagSJ9tpnaXGDSg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eZCdmqkVtZAM4qda4rQiZnX6SkpaAAs17WqfwUcQ48kNT95VbPQsmq2SWRhDBe/88VxAptj72G/Z6RzmqdnPTh7yBO9KCjLf2/4D+Np1N86WEJSTCr0GSrljbJXAPc1yiadGf8pfhQNQ6BiOcLgcTBuHCdXx/L6++6cdxQmn37Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Ww9QC2Qslz1j7Nb;
	Fri, 30 Aug 2024 15:53:55 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
	by mail.maildlp.com (Postfix) with ESMTPS id E1D9614011D;
	Fri, 30 Aug 2024 15:54:08 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpeml500022.china.huawei.com
 (7.185.36.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 30 Aug
 2024 15:54:08 +0800
From: Hongbo Li <lihongbo22@huawei.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>
CC: <linux-watchdog@vger.kernel.org>, <lihongbo22@huawei.com>
Subject: [PATCH -next] watchdog: cpwd: replace simple_strtoul to kstrtoul
Date: Fri, 30 Aug 2024 16:02:20 +0800
Message-ID: <20240830080220.3545142-1-lihongbo22@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500022.china.huawei.com (7.185.36.66)

The function simple_strtoul performs no error checking
in scenarios where the input value overflows the intended
output variable.

We can replace the use of the simple_strtoul with the safer
alternatives kstrtoul. For fail case, we also print the extra
message.

Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
---
 drivers/watchdog/cpwd.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/cpwd.c b/drivers/watchdog/cpwd.c
index 901b94d456db..978bc6c87a35 100644
--- a/drivers/watchdog/cpwd.c
+++ b/drivers/watchdog/cpwd.c
@@ -550,8 +550,14 @@ static int cpwd_probe(struct platform_device *op)
 	p->reboot = (prop_val ? true : false);
 
 	str_prop = of_get_property(options, "watchdog-timeout", NULL);
-	if (str_prop)
-		p->timeout = simple_strtoul(str_prop, NULL, 10);
+	if (str_prop) {
+		err = kstrtoul(str_prop, 10, &p->timeout);
+		if (err != 0) {
+			pr_err("Unable to parse watchdog-timeout\n");
+			of_node_put(options);
+			goto out_iounmap;
+		}
+	}
 
 	of_node_put(options);
 
-- 
2.34.1


