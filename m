Return-Path: <linux-watchdog+bounces-143-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E2C805E52
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 Dec 2023 20:05:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3DC01C20F6B
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 Dec 2023 19:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B96868EA7;
	Tue,  5 Dec 2023 19:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="gq33LI02"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B252EB0
	for <linux-watchdog@vger.kernel.org>; Tue,  5 Dec 2023 11:05:49 -0800 (PST)
Received: from pps.filterd (m0134425.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B5Ifj4g010573;
	Tue, 5 Dec 2023 19:05:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pps0720;
 bh=uMPiCTU5VInqprTB8nATqHHEh2BgWz2yOCw33QBLZbM=;
 b=gq33LI02EagYCM6G5bwCf+xjBIZplUntHHQBmrjHVHS4oJboibYzoreFZ850BEReaQhF
 g6KIGozKGkbtK1tkt0FcgZk4msZY/V0gwb+UYerzjQ+zqJGWec7e7aBgkn5bK2Lwe77V
 xWsCzbFFW1tPYQf3qP7P9b+7s5iQBezWDh6Y3wAp27Rfg8irWRAjYmNgJukdzVVFCrFk
 7DPz1RDVCrFvvWE7bAhyQp0V//8EJL2drrO7P95+SugpmrGkf6w/eVWMyW+diwLjL+wA
 aXGH85QFij7ncUpng3il4XlTYAuxD5/LmUEkd9kFqWxutFI0Zfa7Ot1qg5dqf1Fc0/ye wQ== 
Received: from p1lg14878.it.hpe.com ([16.230.97.204])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 3ustrqg2qg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Dec 2023 19:05:34 +0000
Received: from hpnsw4746.rose.rdlabs.hpecorp.net (unknown [192.58.206.38])
	by p1lg14878.it.hpe.com (Postfix) with ESMTP id AAB9F13150;
	Tue,  5 Dec 2023 19:05:33 +0000 (UTC)
From: Curtis Klein <curtis.klein@hpe.com>
To: wim@linux-watchdog.org, linux@roeck-us.net, haokexin@gmail.com,
        linux-watchdog@vger.kernel.org
Cc: Curtis Klein <curtis.klein@hpe.com>
Subject: [PATCH] watchdog: set cdev owner before adding
Date: Tue,  5 Dec 2023 11:05:22 -0800
Message-Id: <20231205190522.55153-1-curtis.klein@hpe.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Mq0BQEOwWQxjip3Sz2C1U74y2BUe3OKZ
X-Proofpoint-ORIG-GUID: Mq0BQEOwWQxjip3Sz2C1U74y2BUe3OKZ
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-05_14,2023-12-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 clxscore=1011 suspectscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 spamscore=0 adultscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312050151

When the new watchdog character device is registered, it becomes
available for opening. This creates a race where userspace may open the
device before the character device's owner is set. This results in an
imbalance in module_get calls as the cdev_get in cdev_open will not
increment the reference count on the watchdog driver module.

This causes problems when the watchdog character device is released as
the module loader's reference will also be released. This makes it
impossible to open the watchdog device later on as it now appears that
the module is being unloaded. The open will fail with -ENXIO from
chrdev_open.

The legacy watchdog device will fail with -EBUSY from the try_module_get
in watchdog_open because it's module owner is the watchdog core module
so it can still be opened but it will fail to get a refcount on the
underlying watchdog device driver.

Fixes: 72139dfa2464 ("watchdog: Fix the race between the release of watchdog_core_data and cdev")
Signed-off-by: Curtis Klein <curtis.klein@hpe.com>
---
 drivers/watchdog/watchdog_dev.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index 15df74e11a59..e2bd266b1b5b 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -1073,6 +1073,7 @@ static int watchdog_cdev_register(struct watchdog_device *wdd)
 
 	/* Fill in the data structures */
 	cdev_init(&wd_data->cdev, &watchdog_fops);
+	wd_data->cdev.owner = wdd->ops->owner;
 
 	/* Add the device */
 	err = cdev_device_add(&wd_data->cdev, &wd_data->dev);
@@ -1087,8 +1088,6 @@ static int watchdog_cdev_register(struct watchdog_device *wdd)
 		return err;
 	}
 
-	wd_data->cdev.owner = wdd->ops->owner;
-
 	/* Record time of most recent heartbeat as 'just before now'. */
 	wd_data->last_hw_keepalive = ktime_sub(ktime_get(), 1);
 	watchdog_set_open_deadline(wd_data);
-- 
2.31.1


