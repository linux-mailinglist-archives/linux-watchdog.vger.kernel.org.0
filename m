Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 751608A823
	for <lists+linux-watchdog@lfdr.de>; Mon, 12 Aug 2019 22:12:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727845AbfHLUKO (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 12 Aug 2019 16:10:14 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:46181 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727418AbfHLUJf (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 12 Aug 2019 16:09:35 -0400
Received: by mail-pf1-f194.google.com with SMTP id q139so1955589pfc.13;
        Mon, 12 Aug 2019 13:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s7wEcXjgtIZl9U3KIuvRTDXiR5VgWVcjPVD+M9dp6i4=;
        b=E6ti69xyz0TK4JpVeWEr6CXyjvRhB07lnKL4/I45PFYaL3a8HiH+SZ57ZvpsAE+qtx
         1A0eUT1sgFvu/N9tMAq13meaumNazIBpESQb1phcAdOVf1sEzZEysjR+7orD4+mEpF9w
         1DHu5yOoA2re3ju7D8Rga/bDHj+u+OWCQaYjfZJPNWgysjGC45FfsTrZ5OgYPBWSx8iB
         bSpKrYb/F6vthPob3VSfrYIn6GJAITN+Kwcps9pwV8iiGE1LSq6ZuIA9CZ6djYxsJjCb
         bMcqClwv7yHmW42LjDJ6lHSG60ALKeCG8ntYzGvHX3D+W8y//gif/w6iZHkIBhkdUN4w
         OT/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s7wEcXjgtIZl9U3KIuvRTDXiR5VgWVcjPVD+M9dp6i4=;
        b=aZesWD8E4tyf+wJ2Qou8MUEOwiQ7ECKfQNXTNOvJbqFXr7wU47w8fltPqSvlxkPeEZ
         gKQcSvAL7toHba9AAWW+PsntlUJsiNbMEFBV3sJWoFxeOiRdf5PAm38R+kyMbjsk+/x6
         b56f/2Hy3QQphv2ET46swmXAvBS4QkmqPDsed0sIOq/7PSSTZXu0QPJP17sgOV1qgOZf
         czSErxrYOpi4JyL6gDhe5e3i3XONI6H/Q0/B4nS/rdOw9DNnj2trNkXNat5KwRVdag/A
         KSL6XtDwMn468nNtICV3NjpyJk37H8luVMZ8DU360ssnqDNdWQtgmXtpkknPnM2JyyOi
         eIDw==
X-Gm-Message-State: APjAAAWZddIO4yOgHUb2mMHRCc5Bn2ZDMn9dTKyPa2vfzYqCEZX6inDR
        kVNdbcA414VSeY2Hs+mztpvyWvfA
X-Google-Smtp-Source: APXvYqzqlTRXEnxBDqMPh41b70/Q7WJSsI/vXqI7PIeCKV2dBUmlwQmAphyJFAthzMwA4cKfNlMwQA==
X-Received: by 2002:aa7:8218:: with SMTP id k24mr35932001pfi.221.1565640574149;
        Mon, 12 Aug 2019 13:09:34 -0700 (PDT)
Received: from localhost.lan (c-67-185-54-80.hsd1.wa.comcast.net. [67.185.54.80])
        by smtp.gmail.com with ESMTPSA id n26sm110286451pfa.83.2019.08.12.13.09.32
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 12 Aug 2019 13:09:33 -0700 (PDT)
From:   Andrey Smirnov <andrew.smirnov@gmail.com>
To:     linux-watchdog@vger.kernel.org
Cc:     Andrey Smirnov <andrew.smirnov@gmail.com>,
        Chris Healy <cphealy@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rick Ramstetter <rick@anteaterllc.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 12/22] watchdog: ziirave_wdt: Don't check if ihex record length is zero
Date:   Mon, 12 Aug 2019 13:08:56 -0700
Message-Id: <20190812200906.31344-13-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190812200906.31344-1-andrew.smirnov@gmail.com>
References: <20190812200906.31344-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Ihex_next_binrec() will return NULL if next record's 'len' is zero, so
explicit checks for that in the driver are unnecessary. Drop them.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Chris Healy <cphealy@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Rick Ramstetter <rick@anteaterllc.com>
Cc: linux-watchdog@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/watchdog/ziirave_wdt.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/watchdog/ziirave_wdt.c b/drivers/watchdog/ziirave_wdt.c
index 38cf3ca329d7..4b95467bf239 100644
--- a/drivers/watchdog/ziirave_wdt.c
+++ b/drivers/watchdog/ziirave_wdt.c
@@ -318,10 +318,6 @@ static int ziirave_firm_verify(struct watchdog_device *wdd,
 	u16 addr;
 
 	for (rec = (void *)fw->data; rec; rec = ihex_next_binrec(rec)) {
-		/* Zero length marks end of records */
-		if (!be16_to_cpu(rec->len))
-			break;
-
 		addr = (be32_to_cpu(rec->addr) & 0xffff) >> 1;
 		if (addr < ZIIRAVE_FIRM_FLASH_MEMORY_START ||
 		    addr > ZIIRAVE_FIRM_FLASH_MEMORY_END)
@@ -381,10 +377,6 @@ static int ziirave_firm_upload(struct watchdog_device *wdd,
 	msleep(500);
 
 	for (rec = (void *)fw->data; rec; rec = ihex_next_binrec(rec)) {
-		/* Zero length marks end of records */
-		if (!be16_to_cpu(rec->len))
-			break;
-
 		ret = ziirave_firm_write_pkt(wdd, be32_to_cpu(rec->addr),
 					     rec->data, be16_to_cpu(rec->len));
 		if (ret)
-- 
2.21.0

