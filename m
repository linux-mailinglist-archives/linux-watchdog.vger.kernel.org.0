Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40C1045D2F2
	for <lists+linux-watchdog@lfdr.de>; Thu, 25 Nov 2021 03:10:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234759AbhKYCN1 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 24 Nov 2021 21:13:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235401AbhKYCNK (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 24 Nov 2021 21:13:10 -0500
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62506C0698CD;
        Wed, 24 Nov 2021 17:49:32 -0800 (PST)
Received: by mail-qv1-xf32.google.com with SMTP id v2so3067188qve.11;
        Wed, 24 Nov 2021 17:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vja4AHnlTaMIcDb/SHQiaOGkis7osMdBc7ty1ZAf/nY=;
        b=eBfRTJzcTR3vI7uwEdQuf7a1xHTr6aE5rwTJ+n3Bh/yDeGrbYFRRxutkheQtfnciIB
         JI7sgZg9hFalVxetRIWBDLuhUNsp67nbe9apgQmR2vWnWgvER92DmbwmVdOaraZlwzZm
         rKTvgjI76hjCNCfMORkx7czfCUMd7evM7YRcaPKHw2YxqI3ScPRC1P2AKbrd7Y6KuzSl
         MDbKjRhoI7v20VY2D/beI+cA2nc5SncY6tmkpe5BPBVDUwiouAjk3aJHNiFg3sQK0FyY
         uDtuiiLDlQp1SoWeioKjBY3OE6fzYqNNITSRDCnM4gbxN6ryRRpjU1KU4CxDoP78uuBO
         pV+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vja4AHnlTaMIcDb/SHQiaOGkis7osMdBc7ty1ZAf/nY=;
        b=Y0XSCI4ETNXibW2nA6qw59OonlzGLjgJ4ymml1R+uzF1aybB3MF2Ou3WIhb3dWB0WI
         gaER9N7u5pEwOs/Ql+C8XKkq2j/IKBd9ypyI2LIbAO4qBg2KIYq2gIbK8AafkSflIqNB
         68546DTanq4/3RGud/5NDwX1BdxsMS38aV9pDURGKiSxjUvla3DwVPO/XE5kLlKuMbeN
         LkKvpFqiDXw0VoofuAQ7kDhPb33EFQJecJSJaY5JyL1X1c7mEzViH6a9xypJVuOsuAjs
         QnjboJuT7pAknz1O7uxZV+hFjZvvKA8pWgiPJo/Zf48J70v2Zyur9r3iqWSVjJnfW62w
         Bo4g==
X-Gm-Message-State: AOAM531Dxt36bzcNjPZFH7caEQIMluBy/NUPAWIh1cvn/+gCEA5MM3R0
        vddv1eIYHtj8T8MrlGq+piI=
X-Google-Smtp-Source: ABdhPJyMsvUyZ9zhLh4OQK/PQGfcFILX37gsgk2EBLfKDwjbkm2DJFhX7VydLCXnKhSCaClFn7T6OA==
X-Received: by 2002:a05:6214:c42:: with SMTP id r2mr1369622qvj.69.1637804971649;
        Wed, 24 Nov 2021 17:49:31 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id e13sm801260qte.56.2021.11.24.17.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 17:49:31 -0800 (PST)
From:   cgel.zte@gmail.com
X-Google-Original-From: deng.changcheng@zte.com.cn
To:     wim@linux-watchdog.org
Cc:     linux@roeck-us.net, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Changcheng Deng <deng.changcheng@zte.com.cn>,
        Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH] watchdog: davinci: Use div64_ul instead of do_div
Date:   Thu, 25 Nov 2021 01:49:24 +0000
Message-Id: <20211125014924.46297-1-deng.changcheng@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Changcheng Deng <deng.changcheng@zte.com.cn>

do_div() does a 64-by-32 division. Here the divisor is an unsigned long
which on some platforms is 64 bit wide. So use div64_ul instead of do_div
to avoid a possible truncation.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>
---
 drivers/watchdog/davinci_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/davinci_wdt.c b/drivers/watchdog/davinci_wdt.c
index e6eaba6bae5b..584a56893b81 100644
--- a/drivers/watchdog/davinci_wdt.c
+++ b/drivers/watchdog/davinci_wdt.c
@@ -134,7 +134,7 @@ static unsigned int davinci_wdt_get_timeleft(struct watchdog_device *wdd)
 	timer_counter = ioread32(davinci_wdt->base + TIM12);
 	timer_counter |= ((u64)ioread32(davinci_wdt->base + TIM34) << 32);
 
-	do_div(timer_counter, freq);
+	timer_counter = div64_ul(timer_counter, freq);
 
 	return wdd->timeout - timer_counter;
 }
-- 
2.25.1

