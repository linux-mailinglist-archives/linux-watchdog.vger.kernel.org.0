Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D2B83B13E9
	for <lists+linux-watchdog@lfdr.de>; Wed, 23 Jun 2021 08:27:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbhFWG34 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 23 Jun 2021 02:29:56 -0400
Received: from mx0a-002e3701.pphosted.com ([148.163.147.86]:53316 "EHLO
        mx0a-002e3701.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229660AbhFWG34 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 23 Jun 2021 02:29:56 -0400
Received: from pps.filterd (m0134421.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15N6NdhN018045;
        Wed, 23 Jun 2021 06:27:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : cc : subject
 : date : message-id; s=pps0720;
 bh=SfHm3IX1nq/WFTdAgP/w6warpfNfUt/xXcDweZyHli4=;
 b=EywTBvytJShE1S84PDMze1OxcY2jlt8dx8k9mJlR5BN6fMOYkXMeASF55OTRCiR2mIJN
 e7YOn0E/UPfDRo/TzBbl1otuPoWjeOfCwuU9Ukjx2yA2UzBbomp1Z7QtcyQTWyNtmt6K
 AP0lOEOi7D8qpX9O1C2s75SSCQDIfYDXKbVvBFdwd1fARjsBPNimWxYTHS4hy+domqlW
 wcnZ6SDLdmNUqOVo2guccIHJaczpuCzQPLEMZ8XRtILT29gt5DYI6ram7pzLOMbzXQ8w
 Zrw1b9+jaC5R6jTOSRC4MqhCcy4gb/LGFZUucWqV2YVkLCT8r77QK/Q4bw5SteYGWdVI rw== 
Received: from g9t5008.houston.hpe.com (g9t5008.houston.hpe.com [15.241.48.72])
        by mx0b-002e3701.pphosted.com with ESMTP id 39bac42k9q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 23 Jun 2021 06:27:25 +0000
Received: from hpnsw-phaguraws.rose.rdlabs.hpecorp.net (unknown [16.93.60.123])
        by g9t5008.houston.hpe.com (Postfix) with ESMTP id 44A104F;
        Wed, 23 Jun 2021 06:27:24 +0000 (UTC)
From:   Curtis Klein <curtis.klein@hpe.com>
To:     wim@linux-watchdog.org, linux@roeck-us.net
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Curtis Klein <curtis.klein@hpe.com>
Subject: [PATCH] watchdog: Fix NULL pointer dereference when releasing cdev
Date:   Tue, 22 Jun 2021 23:26:23 -0700
Message-Id: <1624429583-5720-1-git-send-email-curtis.klein@hpe.com>
X-Mailer: git-send-email 2.7.4
X-Proofpoint-ORIG-GUID: qm_GO-jKOD03Hgll-JneN2Ghy9YZH5Hr
X-Proofpoint-GUID: qm_GO-jKOD03Hgll-JneN2Ghy9YZH5Hr
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-23_02:2021-06-22,2021-06-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=867 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106230036
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

watchdog_hrtimer_pretimeout_stop needs the watchdog device to have a
valid pointer to the watchdog core data to stop the pretimeout hrtimer.
Therefore it needs to be called before the pointers are cleared in
watchdog_cdev_unregister.

Fixes: 7b7d2fdc8c3e ("watchdog: Add hrtimer-based pretimeout feature")
Reported-by: Colin Ian King <colin.king@canonical.com>
Signed-off-by: Curtis Klein <curtis.klein@hpe.com>
---
 drivers/watchdog/watchdog_dev.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index 3bab324..ffd8f1a 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -1096,6 +1096,8 @@ static void watchdog_cdev_unregister(struct watchdog_device *wdd)
 		watchdog_stop(wdd);
 	}
 
+	watchdog_hrtimer_pretimeout_stop(wdd);
+
 	mutex_lock(&wd_data->lock);
 	wd_data->wdd = NULL;
 	wdd->wd_data = NULL;
@@ -1103,7 +1105,6 @@ static void watchdog_cdev_unregister(struct watchdog_device *wdd)
 
 	hrtimer_cancel(&wd_data->timer);
 	kthread_cancel_work_sync(&wd_data->work);
-	watchdog_hrtimer_pretimeout_stop(wdd);
 
 	put_device(&wd_data->dev);
 }
-- 
2.7.4

