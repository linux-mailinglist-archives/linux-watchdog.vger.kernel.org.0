Return-Path: <linux-watchdog+bounces-332-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FA78120ED
	for <lists+linux-watchdog@lfdr.de>; Wed, 13 Dec 2023 22:54:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D86B282790
	for <lists+linux-watchdog@lfdr.de>; Wed, 13 Dec 2023 21:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 569CF7FBB2;
	Wed, 13 Dec 2023 21:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="epAiYqZf"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AAD4E0;
	Wed, 13 Dec 2023 13:54:08 -0800 (PST)
Received: from pps.filterd (m0148664.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3BDL2GXH020125;
	Wed, 13 Dec 2023 21:53:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pps0720;
 bh=F3XM/iTwy0EIQD79Zi6C9dxzthptKdfMe5DQ9M3l66U=;
 b=epAiYqZfvq/mAyPq7GdEl4rp6c7sBAVQ1kLbcWeajoVz7nK+YduvQAdr4277bB+lfbv4
 9o6Kn8TKf1lyjl/uuiWvAcUoLcG9YjySYbAF/hiavECbEjwZrL7rOA6mPLSJbezj5bby
 TyNiv1L2Va+S46ABJ6qTGb+ivZ9gGxhuUoKNWfV8N8miJvzzB/jXwiX5a8WOm3ufCNhw
 aoDFTROPsYnG8pn6RZvMVf7nvqNeGun1P1djcYFtAbpO9aN/jQdSiA2YSXlaqCyNsbxQ
 nuuOllDPRbrduRufOpgEWEq5GMSi2gQG0B7OrX4+veUvyJWj2Lt8cZvGnjuFg3SUQeRH 0Q== 
Received: from p1lg14878.it.hpe.com ([16.230.97.204])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 3uy89nffwd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Dec 2023 21:53:53 +0000
Received: from p1lg14885.dc01.its.hpecorp.net (unknown [10.119.18.236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14878.it.hpe.com (Postfix) with ESMTPS id E7542131A9;
	Wed, 13 Dec 2023 21:53:52 +0000 (UTC)
Received: from anatevka.americas.hpqcorp.net (unknown [16.231.227.39])
	by p1lg14885.dc01.its.hpecorp.net (Postfix) with ESMTP id 81A40800472;
	Wed, 13 Dec 2023 21:53:52 +0000 (UTC)
From: Jerry Hoemann <jerry.hoemann@hpe.com>
To: linux@roeck-us.net
Cc: wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jerry Hoemann <jerry.hoemann@hpe.com>
Subject: [PATCH v2 3/3] watchdog/hpwdt: Remove unused variable
Date: Wed, 13 Dec 2023 14:53:40 -0700
Message-ID: <20231213215340.495734-4-jerry.hoemann@hpe.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231213215340.495734-1-jerry.hoemann@hpe.com>
References: <20231213215340.495734-1-jerry.hoemann@hpe.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: LIEevNw-2-8NirO5KXYar8IAuEU3V1In
X-Proofpoint-ORIG-GUID: LIEevNw-2-8NirO5KXYar8IAuEU3V1In
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-13_14,2023-12-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 mlxlogscore=977
 clxscore=1015 malwarescore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2312130154

Remove the unused variable ilo5.

Signed-off-by: Jerry Hoemann <jerry.hoemann@hpe.com>
---
 drivers/watchdog/hpwdt.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/watchdog/hpwdt.c b/drivers/watchdog/hpwdt.c
index d5c0aa3ef069..138dc8d8ca3d 100644
--- a/drivers/watchdog/hpwdt.c
+++ b/drivers/watchdog/hpwdt.c
@@ -33,7 +33,6 @@
 #define DEFAULT_MARGIN			30
 #define PRETIMEOUT_SEC			9
 
-static bool ilo5;
 static unsigned int soft_margin = DEFAULT_MARGIN;	/* in seconds */
 static bool nowayout = WATCHDOG_NOWAYOUT;
 static bool pretimeout = IS_ENABLED(CONFIG_HPWDT_NMI_DECODING);
@@ -360,9 +359,6 @@ static int hpwdt_init_one(struct pci_dev *dev,
 				pretimeout ? "on" : "off");
 	dev_info(&dev->dev, "kdumptimeout: %d.\n", kdumptimeout);
 
-	if (dev->subsystem_vendor == PCI_VENDOR_ID_HP_3PAR)
-		ilo5 = true;
-
 	return 0;
 
 error_wd_register:
-- 
2.41.0


