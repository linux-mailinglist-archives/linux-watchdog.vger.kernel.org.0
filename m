Return-Path: <linux-watchdog+bounces-3078-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEBFA5C34D
	for <lists+linux-watchdog@lfdr.de>; Tue, 11 Mar 2025 15:10:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 323B01892E0E
	for <lists+linux-watchdog@lfdr.de>; Tue, 11 Mar 2025 14:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 003241D63E2;
	Tue, 11 Mar 2025 14:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RxVtD3SX"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361006F30C
	for <linux-watchdog@vger.kernel.org>; Tue, 11 Mar 2025 14:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741702214; cv=none; b=bCRRSlZjDGW65Rx4k3SV9bXXeIic6zbCoN8Zo6HZbQeTryoGa/QYbvyZ2V0pBig84W87TyPgrZHXfmvpnBkImJQEWbi5Bm4pLoo65QpfpCiDBJmx8VzJY007lN3Y0N0agd4VWQSlNvBLFJUoS7y1PJuAvW6yAGk561XZg51XnO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741702214; c=relaxed/simple;
	bh=e/BpuI4cNxJSvV8wM6Sp17SpilM3bSvuLtAjFkul/P4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dG4ZiKZ55AEntYreZRKTZN74o8iNO2vKNmSXh/pGZXRMRGuCu6VLDpbdABJdX0zDaxQwNkLVd5oixfP7YOYGOkToCPokePYxQnt1AnV7BAf6emsCYI8jE4Yd7Yd4GAxYFLiMuB5CxzqdKwZ2LqNTFzyiP9chz6ujJmCkxZU0tqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RxVtD3SX; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-225a28a511eso6254825ad.1
        for <linux-watchdog@vger.kernel.org>; Tue, 11 Mar 2025 07:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741702212; x=1742307012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=9oHItRVSBIDmZnDDfOHEOWOScL5YnDET4A9s9NljwNY=;
        b=RxVtD3SXEEdpXoMGmkDljusxhlDX7H5Jrn6RCXlZtAOZzksrc4SoAoqDWmVPMVCPA2
         kXAdU+O8Ikg4xZ9IIECrTUxP67q2fAuYzIVO45ScW+nopO0oLIsZp/77jtOppVMxTH/f
         +qZfKjQ4iVw6536qHqh/YNB07YM6N212obtHN2V0KZ6nX3WwZdHr2V11asF9fsvK6D3i
         nKEgP7MG6z7jm5ZxvjmNMs13Cxsj3iwmHyUj06fsfbvQXiAYox6gdZ5rHQ8kEcXix+Nn
         q+8pNIksf/1xFMIO13AAD07FKyMaQOZCx6IgzlTwpa1JAJKKW8ZnbhiQql+pxGN6XbqF
         JzAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741702212; x=1742307012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9oHItRVSBIDmZnDDfOHEOWOScL5YnDET4A9s9NljwNY=;
        b=jnPwtexL9SegbH803omACnspiwR/bM3tsmdcYXqW2Uj1A78jn5grhi3OdX2bxl87Pv
         8BMnlc/0ymLXpRT8Yf8sW48Vg0G/iOpvyPVundQPMZbs8FQY4wQFxkfxFBD4W6Aya9T5
         7+S89OdbrVzNSjcAaONAZNzC1Hv4sjJLaYd+VX3DcoWEep/sFg2hVWg55waRDcAtTf1K
         xyopqA5kAHXyxDm+2t7bPsJMjVI9ewySQmds9wGDMOpPs75EboGlkQWMMy1wnRBNbUIB
         +d6SW9Ike4aS7g4neBfbk4UfASHDU20wEd3SJVEAtFx+6tKuDbNFkDPFK5Jw7Ts+8znC
         4jUQ==
X-Gm-Message-State: AOJu0Yz+r3rhD6aJkPGAM7coHT/W/Tjqx8lyOYWCeyBN5UU5ThV55OX8
	Et+ixM+erQUpzHWRensew4un3awx7/bBpie8z8jWIFG48kVTPs9X
X-Gm-Gg: ASbGnctiw0nU01WcaQMKvljQLb/N/IMWoKvTZeC4wwzjqMzpAyAx2IM76IIqGvrgUxv
	ZAH3c8tyUOsnFuazi32omdgZUPcUbYUqM8g4wYIFVoXD4FHVsNujrm5a6Z+c1O6o8aLSqZCER7p
	F4PP+V+Uwzn10RR1qXKTaV00r3tSqAVk1GqYsa+uYyS6HFexgW6tcHg+48lq51ZZFw4mfviMOjq
	r23SjZ8yYEmPYFbnHefebLiZo70Ocx8HONm1Siroa9o//JgslqeIOLJtHQM8xKXGXlrQ9bvgWX4
	BOjDX2vEH3aL21VwVEOWWCXNOrtQsDQP5u4yqu0YEFn+qBX/ZlAwJZHc1A==
X-Google-Smtp-Source: AGHT+IGziYENU6h35dPW2ka7NF3vuViKM1WlrzBJ2K/zpsZKAASLNtPegIUjTI5NfOC5WUQS20IlXA==
X-Received: by 2002:a05:6a00:14d1:b0:736:755b:8311 with SMTP id d2e1a72fcca58-736aaad1daamr19366074b3a.16.1741702212305;
        Tue, 11 Mar 2025 07:10:12 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736dc222405sm3820928b3a.78.2025.03.11.07.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 07:10:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-watchdog@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] watchdog: Convert to use device property
Date: Tue, 11 Mar 2025 07:10:09 -0700
Message-ID: <20250311141009.756975-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use device_property_read_u32() instead of of_property_read_u32() to support
reading the timeout from non-devicetree sources.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/watchdog/watchdog_core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
index d46d8c8c01f2..6152dba4b52c 100644
--- a/drivers/watchdog/watchdog_core.c
+++ b/drivers/watchdog/watchdog_core.c
@@ -33,7 +33,8 @@
 #include <linux/init.h>		/* For __init/__exit/... */
 #include <linux/idr.h>		/* For ida_* macros */
 #include <linux/err.h>		/* For IS_ERR macros */
-#include <linux/of.h>		/* For of_get_timeout_sec */
+#include <linux/of.h>		/* For of_alias_get_id */
+#include <linux/property.h>	/* For device_property_read_u32 */
 #include <linux/suspend.h>
 
 #include "watchdog_core.h"	/* For watchdog_dev_register/... */
@@ -137,8 +138,7 @@ int watchdog_init_timeout(struct watchdog_device *wdd,
 	}
 
 	/* try to get the timeout_sec property */
-	if (dev && dev->of_node &&
-	    of_property_read_u32(dev->of_node, "timeout-sec", &t) == 0) {
+	if (dev && device_property_read_u32(dev, "timeout-sec", &t) == 0) {
 		if (t && !watchdog_timeout_invalid(wdd, t)) {
 			wdd->timeout = t;
 			return 0;
-- 
2.45.2


