Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA0D93B5093
	for <lists+linux-watchdog@lfdr.de>; Sun, 27 Jun 2021 01:49:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229850AbhFZXvf (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 26 Jun 2021 19:51:35 -0400
Received: from mx0a-002e3701.pphosted.com ([148.163.147.86]:38108 "EHLO
        mx0a-002e3701.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229556AbhFZXvf (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 26 Jun 2021 19:51:35 -0400
Received: from pps.filterd (m0134422.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15QNdPTP029050;
        Sat, 26 Jun 2021 23:48:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : cc : subject
 : date : message-id; s=pps0720;
 bh=KSH85L5/d4ls/oo5uSxRdbVkC4cWcVHyeaA780T1o94=;
 b=eTXpXDTliyJR0RUnjNrR+O/VWBEu9iH/TU8MY9TOhxJH9VTjLXebmGfWm3VguIjIV/qf
 61FC4MTBxDDYG4mcxnaWDoWKjz2JTKyjzFJ4ost+j0WBeAf3vc7EbUfpGfgoV1O7Uq/z
 MapTJej5IPmQgtKbVMwRE5rMWdeKLhiae4Io6moz5PkbG1CNiX3RUF4GN/YWCXXHBX6Z
 ayLBnqr55sOkf/gAsDs7et/loxfiFUAtD64CynctWnU8wUtjYHwlwcE6MIFnUDlriEW3
 EliuClmXua0C3ieMueXhmca7AtxKSlYYJteg1QNFvNO2W7qmLy0QDMr25EHNSyjJPD08 vg== 
Received: from g2t2354.austin.hpe.com (g2t2354.austin.hpe.com [15.233.44.27])
        by mx0b-002e3701.pphosted.com with ESMTP id 39dwmkvdgg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sat, 26 Jun 2021 23:48:58 +0000
Received: from hpnsw-phaguraws.rose.rdlabs.hpecorp.net (unknown [16.93.60.123])
        by g2t2354.austin.hpe.com (Postfix) with ESMTP id 4E8CD81;
        Sat, 26 Jun 2021 23:48:56 +0000 (UTC)
From:   Curtis Klein <curtis.klein@hpe.com>
To:     wim@linux-watchdog.org, linux@roeck-us.net
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Curtis Klein <curtis.klein@hpe.com>
Subject: [PATCH] watchdog: only run driver set_pretimeout op if device supports it
Date:   Sat, 26 Jun 2021 16:47:45 -0700
Message-Id: <1624751265-24785-1-git-send-email-curtis.klein@hpe.com>
X-Mailer: git-send-email 2.7.4
X-Proofpoint-GUID: of6wWYXuINwng-3tMKg5NVE19IlKfPy3
X-Proofpoint-ORIG-GUID: of6wWYXuINwng-3tMKg5NVE19IlKfPy3
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-26_15:2021-06-25,2021-06-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=999 phishscore=0 impostorscore=0
 mlxscore=0 spamscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106260170
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Some watchdog devices might conditionally support pretimeouts (e.g. if
an interrupt is exposed for the device) but some watchdog drivers might
still define the set_pretimeout operation (e.g. the mtk_wdt driver) and
indicate support at runtime through the WDIOF_PRETIMEOUT flag. If the
kernel is compiled with CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT enabled,
watchdog_set_pretimeout would run the driver specific set_pretimeout
even if WDIOF_PRETIMEOUT is not set which might have unintended
consequences.

So this change checks that the device flags and only runs the driver
operation if pretimeouts are supported.

Signed-off-by: Curtis Klein <curtis.klein@hpe.com>
---
 drivers/watchdog/watchdog_dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index 3bab324..5bf795c 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -401,7 +401,7 @@ static int watchdog_set_pretimeout(struct watchdog_device *wdd,
 	if (watchdog_pretimeout_invalid(wdd, timeout))
 		return -EINVAL;
 
-	if (wdd->ops->set_pretimeout)
+	if (wdd->ops->set_pretimeout && (wdd->info->options & WDIOF_PRETIMEOUT))
 		err = wdd->ops->set_pretimeout(wdd, timeout);
 	else
 		wdd->pretimeout = timeout;
-- 
2.7.4

