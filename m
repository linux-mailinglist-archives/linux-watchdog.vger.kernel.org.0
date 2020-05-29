Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B02641E720B
	for <lists+linux-watchdog@lfdr.de>; Fri, 29 May 2020 03:25:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437710AbgE2BZK (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 28 May 2020 21:25:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437446AbgE2BZJ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 28 May 2020 21:25:09 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 600DBC08C5C6;
        Thu, 28 May 2020 18:25:09 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id 5so404578pjd.0;
        Thu, 28 May 2020 18:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zb9/BKES7gO8JntXyD1+9qJqMA/EUgxqDSspsL4nnMM=;
        b=CIq8zFqtfzbuIO5dwwrWQF3KfGQ4mT/5p6lTl7gOTBs9QTkFJGFviz1q2t1msqP4pi
         UESj5Jtpt4e9zvrjL3LvT7HyqSuT+7NWh9LLALdrLUlg0/CO50g0uwgMKgcUQUswlgoJ
         Qm5ZugNEJRxZIIVLH+swkgXRCEMI9310AM4r6TaJihxHEjiZMT4QSMtNSpry3wZaWfyx
         wYv+A0vQPs8PmvuASpijJBkv4l6pb7xh3ciEMgL68MtvzWEE08+Ia909T7TRGG+uK1j0
         aYQd2Onoo2C9Pzo+VVyiJVS4Qgyt+vuoAhtb7yWoq/FvjJUGftwzpuCWTMJff1unmEih
         KkoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zb9/BKES7gO8JntXyD1+9qJqMA/EUgxqDSspsL4nnMM=;
        b=ifrT8vFIfExgFMYV6/+gByO+iZOOR9Mk7J8bT9qgBarDs9ewxRhOQufkPHDN2eg33o
         /5MAf+szDcWQV4/8vwvnW4zLErvZBqBRo42APRiB80FdfcczjlVO4m9xaCQHv/FL5R7x
         SgJxZkL5Owhysa0uh17v46c6KrbXXIP2ZgJgj4sRYtgB9GH7j+OUoeQydUA3D7vPb1lA
         qGzePSFVqZ5+oy0CnpPO0N51mF/Js601UHaM30fqta1z2JmWFpX1C3SBE8hSrOjdBmVb
         N6db2pgFhLR5RVKkVpnShaZAdRYwv0rwTeCDyghivXNRL0pcC+E0M9c6dzc5tU+/U899
         j+Bg==
X-Gm-Message-State: AOAM5321AM9bS+/elSiMdEcui5jG4aS3WWbf/8acJwaNQ1QAbA2bP6rb
        0hp1XUipUtu8GLPwkTLykGk=
X-Google-Smtp-Source: ABdhPJzhgKtvkqJMQxiJ02XqNhU/AR/sB93T41h/+8wxgfSXnM58AgYW4RLJ+MU/uFJ51yD6vriJVA==
X-Received: by 2002:a17:902:7b92:: with SMTP id w18mr6186346pll.273.1590715508804;
        Thu, 28 May 2020 18:25:08 -0700 (PDT)
Received: from localhost.localdomain ([59.13.121.17])
        by smtp.gmail.com with ESMTPSA id y5sm5651606pff.150.2020.05.28.18.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 18:25:08 -0700 (PDT)
From:   Bumsik Kim <kbumsik@gmail.com>
X-Google-Original-From: Bumsik Kim <k.bumsik@gmail.com>
To:     wim@linux-watchdog.org, linux@roeck-us.net, corbet@lwn.net
Cc:     linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Bumsik Kim <k.bumsik@gmail.com>
Subject: [PATCH] watchdog: test_bit() => watchdog_active()
Date:   Fri, 29 May 2020 10:24:28 +0900
Message-Id: <20200529012428.84684-1-k.bumsik@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Use the dedicated function watchdog_active()
instead of the generic test_bit() function.

It is done using the following Coccinelle script:

@@
identifier wdd;
@@
- test_bit(WDOG_ACTIVE, &wdd->status)
+ watchdog_active(wdd)

Signed-off-by: Bumsik Kim <k.bumsik@gmail.com>
---
 drivers/watchdog/watchdog_dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index 7e4cd34a8c20..3ae608d78af2 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -916,7 +916,7 @@ static int watchdog_release(struct inode *inode, struct file *file)
 	 * or if WDIOF_MAGICCLOSE is not set. If nowayout was set then
 	 * watchdog_stop will fail.
 	 */
-	if (!test_bit(WDOG_ACTIVE, &wdd->status))
+	if (!watchdog_active(wdd))
 		err = 0;
 	else if (test_and_clear_bit(_WDOG_ALLOW_RELEASE, &wd_data->status) ||
 		 !(wdd->info->options & WDIOF_MAGICCLOSE))
-- 
2.26.2

